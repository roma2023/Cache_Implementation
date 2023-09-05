
#include "cachelab.h"
#include <errno.h>
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// -------------------Definition of Constants and Data structures --------------

#define MAX_ADDR_LEN 64
#define MAX_SIZE_LEN 3
#define LINELEN 70 // Maximum length of a line in the trace file
/* 1 character for Op
1 character for comma
1 character for space
64 characters for Addr (maximum length)
3 characters for Size (assuming a max of three digit positive number)*/

/*
 * Structure of a cache line block.
 */
typedef struct {
    int valid;
    int dirty;
    int LRU_counter;
    unsigned long tag;
} cache_line_t;

// ----------------------Task 2 - Parser ----------------------------------
/**
 * @brief Process the trace file and simulate cache operations.
 *
 * @param trace The file name of the memory trace to process.
 * @param stats Cache statistics structure to track hits, misses, etc.
 * @param cache The cache data structure.
 * @param lines_per_set Number of lines per set (associativity).
 * @param Verbose_mode Flag to enable verbose mode for reporting.
 * @param s Number of set index bits.
 * @param b Number of block bits.
 * @param block_size Size of the cache block.
 * @return Returns 1 if there was an error parsing the trace file, 0 otherwise.
 */
int process_trace_file(const char *trace, csim_stats_t stats,
                       cache_line_t **cache, unsigned long lines_per_set,
                       int Verbose_mode, unsigned long s, unsigned long b,
                       unsigned long block_size) {

    // Open the trace file
    FILE *tfp = fopen(trace, "rt");
    if (!tfp) {
        fprintf(stderr, "Error opening '%s': %s\n", trace, strerror(errno));
        exit(1);
    }

    char linebuf[LINELEN];
    int parse_error = 0;

    // Process each line in the trace file
    while (fgets(linebuf, LINELEN, tfp)) {
        // Remove newline character from the end of the line
        linebuf[strcspn(linebuf, "\n")] = '\0';

        // Validate line format
        if (strlen(linebuf) < 5 || strlen(linebuf) > 70) {
            fprintf(stderr, "Error: Invalid line format in the trace file.\n");
            parse_error = 1;
            exit(1);
        }

        // Parse line into operation, address, and size
        char op;
        char addr[MAX_ADDR_LEN];
        char size[MAX_SIZE_LEN];
        sscanf(linebuf, "%c %[^,],%s", &op, addr, size);

        // Validate operation
        if (op != 'L' && op != 'S') {
            fprintf(stderr, "Error: Invalid operation in the trace file.\n");
            parse_error = 1;
            exit(1);
        }

        char *endptr; // Used to detect invalid characters after the number

        // Convert address from hexadecimal string to unsigned long
        unsigned long address = strtoul(addr, &endptr, 16);
        if (*endptr != '\0') {
            fprintf(stderr, "Error: Invalid address number\n");
            parse_error = 1;
            exit(1);
        }

        // Convert size from decimal string to unsigned long
        unsigned long size_val = strtoul(size, &endptr, 10);
        if (*endptr != '\0') {
            fprintf(stderr, "Error: Invalid size number\n");
            parse_error = 1;
            exit(1);
        }

        // Print operation, address, and size in non-verbose mode
        if (Verbose_mode == 0)
            printf("Op: %c, Addr: %lu, Size: %lu\n", op, address, size_val);

        // Print line in verbose mode
        if (Verbose_mode == 1)
            printf("%s", linebuf);

        // ------------------Task 3 Cache Simulator ---------------------------

        // Calculate set index and tag for the given address
        unsigned long set_index = (address >> b) & ((1UL << s) - 1UL);
        unsigned long tag = address >> (s + b);

        // Find a matching cache line within the set
        int match_index = -1;
        for (int i = 0; i < (int)lines_per_set; i++) {
            if (cache[set_index][i].valid && cache[set_index][i].tag == tag) {
                match_index = i;
                break;
            }
        }

        // Cache access handling
        if (op == 'L' || op == 'S') {
            if (match_index != -1) {
                // Cache hit
                if (Verbose_mode == 1)
                    printf(" hit\n");
                stats.hits++;

                // Update LRU counters
                for (int i = 0; i < (int)lines_per_set; i++) {
                    if (cache[set_index][i].valid) {
                        cache[set_index][i].LRU_counter++;
                    }
                }
                cache[set_index][match_index].LRU_counter = 0;

                // Update dirty bit and dirty bytes counter for store operation
                if (op == 'S') {
                    if (cache[set_index][match_index].dirty == 0) {
                        stats.dirty_bytes += block_size;
                    }
                    cache[set_index][match_index].dirty = 1;
                }
            } else {
                // Cache miss
                stats.misses++;
                int empty_index = -1;
                for (int i = 0; i < (int)lines_per_set; i++) {
                    if (!cache[set_index][i].valid) {
                        // Found an empty line in the set
                        empty_index = i;
                        break;
                    }
                }

                if (empty_index != -1) {
                    // Bring requested block into the cache
                    if (Verbose_mode == 1)
                        printf(" miss\n");
                    cache[set_index][empty_index].valid = 1;
                    cache[set_index][empty_index].tag = tag;

                    // Update LRU counters
                    for (int i = 0; i < (int)lines_per_set; i++) {
                        if (cache[set_index][i].valid) {
                            cache[set_index][i].LRU_counter++;
                        }
                    }
                    cache[set_index][empty_index].LRU_counter = 0;

                    // Update dirty bit and dirty bytes counter for store
                    // operation
                    if (op == 'S') {
                        cache[set_index][empty_index].dirty = 1;
                        stats.dirty_bytes += block_size;
                    } else {
                        cache[set_index][empty_index].dirty = 0;
                    }

                } else {
                    // Select a line for eviction (LRU)
                    stats.evictions++;
                    if (Verbose_mode == 1)
                        printf(" miss eviction\n");
                    int evict_index = 0;
                    for (int i = 1; i < (int)lines_per_set; i++) {
                        if (cache[set_index][i].LRU_counter >
                            cache[set_index][evict_index].LRU_counter) {
                            evict_index = i;
                        }
                    }

                    // Update dirty_bytes and dirty_evictions statistics
                    if (cache[set_index][evict_index].dirty) {
                        stats.dirty_bytes -= block_size; // Block_size
                        stats.dirty_evictions += block_size;
                    }

                    // Replace the evicted line with the requested block
                    cache[set_index][evict_index].valid = 1;
                    cache[set_index][evict_index].tag = tag;

                    // Update LRU counters
                    for (int i = 0; i < (int)lines_per_set; i++) {
                        if (cache[set_index][i].valid) {
                            cache[set_index][i].LRU_counter++;
                        }
                    }
                    cache[set_index][evict_index].LRU_counter = 0;

                    // Update dirty bit and dirty bytes counter for store
                    // operation
                    if (op == 'S') {
                        cache[set_index][evict_index].dirty = 1;
                        stats.dirty_bytes += block_size;
                    } else {
                        cache[set_index][evict_index].dirty = 0;
                    }
                }
            }
        }
    }

    // Print cache simulation summary
    printSummary(&stats);

    fclose(tfp);
    return parse_error;
}

// ---------------Task 1 Command Line Arguments Processor ---------------------
int main(int argc, char **argv) {
    unsigned long s = -1UL;  // Number of set index bits
    unsigned long b = -1UL;  // Number of block bits
    unsigned long E = -1UL;  // Number of lines per set
    char *trace_file = NULL; // File name of the memory trace
    int Verbose_mode = 0;

    int opt;
    while ((opt = getopt(argc, argv, "hvs:b:E:t:")) != -1) {
        switch (opt) {
        case 'h':
            printf("Usage: %s [-v] -s <s> -b <b> -E <E> -t <trace>\n", argv[0]);
            printf("-h\tPrint this help message and exit\n");
            printf(
                "-v\tVerbose mode: report effects of each memory operation\n");
            printf("-s <s>\tNumber of set index bits (there are 2^s sets)\n");
            printf("-b <b>\tNumber of block bits (there are 2^b blocks)\n");
            printf("-E <E>\tNumber of lines per set (associativity)\n");
            printf("-t <trace>\tFile name of the memory trace to process\n");
            return 0;
        case 'v':
            // Enable verbose mode
            Verbose_mode = 1;
            break;
        case 's':
            s = (unsigned long)strtol(optarg, NULL, 10);
            break;
        case 'b':
            b = (unsigned long)strtol(optarg, NULL, 10);
            break;
        case 'E':
            E = (unsigned long)strtol(optarg, NULL, 10);
            break;
        case 't':
            trace_file = optarg;
            break;
        default:
            fprintf(stderr, "Invalid option: -%c\n", optopt);
            exit(1);
        }
    }

    // Check if all mandatory options are provided
    if (s == -1UL || b == -1UL || E == -1UL || trace_file == NULL) {
        fprintf(stderr, "Mandatory arguments missing.\n");
        printf("Usage: %s [-v] -s <s> -b <b> -E <E> -t <trace>\n", argv[0]);
        exit(1);
    }
    // Check if all mandatory options are positive
    if (s < 0 || b < 0 || E < 0) {
        fprintf(stderr, "Error: Negative arguments are passed.\n");
        printf("Usage: %s [-v] -s <s> -b <b> -E <E> -t <trace>\n", argv[0]);
        exit(1);
    }
    // Check if the address size is too large
    unsigned long AddressSize = s + b;
    if (AddressSize >= 64) {
        fprintf(stderr, "Size of the Address %lu exceeds the limit",
                AddressSize);
        exit(1);
    }
    // Print the values for verification
    printf("s = %lu\n", s);
    printf("b = %lu\n", b);
    printf("E = %lu\n", E);
    printf("trace_file = %s\n", trace_file);

    // Calculate cache configuration
    unsigned long S = 1 << s; // 2^s
    unsigned long lines_per_set = E;
    unsigned long block_size = 1 << b; // 2^b

    // Allocate memory for the cache
    cache_line_t **cache = malloc(S * sizeof(cache_line_t *));
    for (int i = 0; i < (int)S; i++) {
        cache[i] = (cache_line_t *)malloc(E * sizeof(cache_line_t));
        for (int j = 0; j < (int)lines_per_set; j++) {
            cache[i][j].valid = 0;
            cache[i][j].tag = 0;
            cache[i][j].dirty = 0;
            cache[i][j].LRU_counter = 0;
        }
    }

    // Statistics initialization
    csim_stats_t stats = {0};

    // run the parser and a cache simulator
    int parse_error =
        process_trace_file(trace_file, stats, cache, lines_per_set,
                           Verbose_mode, s, b, block_size);

    // Free the allocated cache memory
    for (int i = 0; i < (int)S; i++) {
        free(cache[i]);
    }
    free(cache);

    return parse_error;
    exit(0);
}
