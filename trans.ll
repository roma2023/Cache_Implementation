; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"Optimized transpose\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Transpose for 32x32\00", align 1
@.str.3 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @registerFunctions() local_unnamed_addr #0 !dbg !13 {
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @transpose_submit, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #5, !dbg !17
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_optimized, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0)) #5, !dbg !18
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_optimized_32, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !19
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_tmp, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i64 0, i64 0)) #5, !dbg !20
  ret void, !dbg !21
}

declare !dbg !22 void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nofree nosync nounwind uwtable
define internal void @transpose_submit(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* nocapture noundef %4) #2 !dbg !38 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i64 %1, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata double* %2, metadata !42, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata double* %3, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata double* %4, metadata !44, metadata !DIExpression()), !dbg !45
  %6 = icmp eq i64 %0, 32, !dbg !46
  br i1 %6, label %7, label %8, !dbg !48

7:                                                ; preds = %5
  tail call void @trans_optimized_32(i64 noundef 32, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4), !dbg !49
  br label %85, !dbg !49

8:                                                ; preds = %5
  %9 = icmp eq i64 %0, %1, !dbg !50
  br i1 %9, label %10, label %36, !dbg !52

10:                                               ; preds = %8
  call void @llvm.dbg.value(metadata i64 %0, metadata !53, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i64 %1, metadata !56, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata double* %2, metadata !57, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata double* %3, metadata !58, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata double* %4, metadata !59, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i64 2, metadata !60, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i64 2, metadata !62, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i64 0, metadata !63, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i64 0, metadata !64, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i64 2, metadata !65, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i32 undef, metadata !63, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i32 undef, metadata !65, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i32 undef, metadata !63, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #5, !dbg !75
  call void @llvm.dbg.value(metadata i32 undef, metadata !65, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i32 undef, metadata !64, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i32 undef, metadata !64, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #5, !dbg !75
  %11 = mul i64 %0, %0, !dbg !77
  tail call fastcc void @tr(i64 noundef 0, i64 noundef 0, i64 noundef %11, i64 noundef %0, i64 noundef %0, double* noundef %2, double* noundef %3) #5, !dbg !78
  call void @llvm.dbg.value(metadata i64 0, metadata !66, metadata !DIExpression()) #5, !dbg !75
  %12 = icmp eq i64 %0, 0, !dbg !79
  br i1 %12, label %85, label %13, !dbg !80

13:                                               ; preds = %10, %33
  %14 = phi i64 [ %34, %33 ], [ 0, %10 ]
  call void @llvm.dbg.value(metadata i64 %14, metadata !66, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i64 0, metadata !67, metadata !DIExpression()) #5, !dbg !75
  %15 = lshr i64 %14, 1
  %16 = and i64 %14, 1
  %17 = getelementptr inbounds double, double* %3, i64 %14
  br label %18, !dbg !81

18:                                               ; preds = %18, %13
  %19 = phi i64 [ 0, %13 ], [ %31, %18 ]
  call void @llvm.dbg.value(metadata i64 %19, metadata !67, metadata !DIExpression()) #5, !dbg !75
  call void @llvm.dbg.value(metadata i64 %14, metadata !82, metadata !DIExpression()) #5, !dbg !96
  call void @llvm.dbg.value(metadata i64 %19, metadata !87, metadata !DIExpression()) #5, !dbg !96
  call void @llvm.dbg.value(metadata i64 1, metadata !88, metadata !DIExpression()) #5, !dbg !96
  call void @llvm.dbg.value(metadata i64 1, metadata !89, metadata !DIExpression()) #5, !dbg !96
  call void @llvm.dbg.value(metadata i64 2, metadata !90, metadata !DIExpression()) #5, !dbg !96
  call void @llvm.dbg.value(metadata i64 2, metadata !91, metadata !DIExpression()) #5, !dbg !96
  call void @llvm.dbg.value(metadata i64 %15, metadata !92, metadata !DIExpression()) #5, !dbg !96
  %20 = lshr i64 %19, 1, !dbg !98
  call void @llvm.dbg.value(metadata i64 %20, metadata !93, metadata !DIExpression()) #5, !dbg !96
  call void @llvm.dbg.value(metadata i64 %16, metadata !94, metadata !DIExpression()) #5, !dbg !96
  call void @llvm.dbg.value(metadata i64 %19, metadata !95, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)) #5, !dbg !96
  %21 = add nuw i64 %20, %15, !dbg !99
  %22 = shl i64 %21, 2, !dbg !100
  %23 = shl i64 %19, 1, !dbg !101
  %24 = and i64 %23, 2, !dbg !101
  %25 = or i64 %22, %24, !dbg !102
  %26 = or i64 %25, %16, !dbg !103
  call void @llvm.dbg.value(metadata i64 %26, metadata !68, metadata !DIExpression()) #5, !dbg !104
  %27 = getelementptr inbounds double, double* %4, i64 %26, !dbg !105
  %28 = load double, double* %27, align 8, !dbg !105, !tbaa !106
  %29 = mul nsw i64 %19, %0, !dbg !110
  %30 = getelementptr inbounds double, double* %17, i64 %29, !dbg !110
  store double %28, double* %30, align 8, !dbg !111, !tbaa !106
  %31 = add nuw i64 %19, 1, !dbg !112
  call void @llvm.dbg.value(metadata i64 %31, metadata !67, metadata !DIExpression()) #5, !dbg !75
  %32 = icmp eq i64 %31, %0, !dbg !113
  br i1 %32, label %33, label %18, !dbg !81, !llvm.loop !114

33:                                               ; preds = %18
  %34 = add nuw i64 %14, 1, !dbg !117
  call void @llvm.dbg.value(metadata i64 %34, metadata !66, metadata !DIExpression()) #5, !dbg !75
  %35 = icmp eq i64 %34, %0, !dbg !79
  br i1 %35, label %85, label %13, !dbg !80, !llvm.loop !118

36:                                               ; preds = %8
  call void @llvm.dbg.value(metadata i64 %0, metadata !120, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i64 %1, metadata !123, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata double* %2, metadata !124, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata double* %3, metadata !125, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata double* %4, metadata !126, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i64 8, metadata !127, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i64 0, metadata !128, metadata !DIExpression()), !dbg !147
  %37 = icmp eq i64 %1, 0, !dbg !148
  br i1 %37, label %85, label %38, !dbg !149

38:                                               ; preds = %36
  %39 = icmp eq i64 %0, 0
  br i1 %39, label %81, label %40, !dbg !150

40:                                               ; preds = %38, %48
  %41 = phi i64 [ %42, %48 ], [ 0, %38 ]
  call void @llvm.dbg.value(metadata i64 %41, metadata !128, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.value(metadata i64 0, metadata !130, metadata !DIExpression()), !dbg !151
  %42 = add i64 %41, 8
  %43 = icmp eq i64 %41, -8
  br i1 %43, label %44, label %50, !dbg !152

44:                                               ; preds = %40, %44
  %45 = phi i64 [ %46, %44 ], [ 0, %40 ]
  call void @llvm.dbg.value(metadata i64 %45, metadata !130, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.value(metadata i64 %41, metadata !134, metadata !DIExpression()), !dbg !153
  %46 = add i64 %45, 8, !dbg !154
  call void @llvm.dbg.value(metadata i64 %46, metadata !130, metadata !DIExpression()), !dbg !151
  %47 = icmp ult i64 %46, %0, !dbg !155
  br i1 %47, label %44, label %48, !dbg !150, !llvm.loop !156

48:                                               ; preds = %54, %44
  call void @llvm.dbg.value(metadata i64 %42, metadata !128, metadata !DIExpression()), !dbg !147
  %49 = icmp ult i64 %42, %1, !dbg !148
  br i1 %49, label %40, label %85, !dbg !149, !llvm.loop !158

50:                                               ; preds = %40, %54
  %51 = phi i64 [ %52, %54 ], [ 0, %40 ]
  call void @llvm.dbg.value(metadata i64 %51, metadata !130, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.value(metadata i64 %41, metadata !134, metadata !DIExpression()), !dbg !153
  %52 = add i64 %51, 8
  %53 = icmp eq i64 %51, -8
  br i1 %53, label %54, label %56, !dbg !160

54:                                               ; preds = %76, %50
  call void @llvm.dbg.value(metadata i64 %52, metadata !130, metadata !DIExpression()), !dbg !151
  %55 = icmp ult i64 %52, %0, !dbg !155
  br i1 %55, label %50, label %48, !dbg !150, !llvm.loop !161

56:                                               ; preds = %50, %76
  %57 = phi i64 [ %77, %76 ], [ %41, %50 ]
  call void @llvm.dbg.value(metadata i64 %57, metadata !134, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.value(metadata i64 %51, metadata !138, metadata !DIExpression()), !dbg !162
  %58 = and i64 %57, 1
  %59 = mul nsw i64 %57, %0
  %60 = getelementptr inbounds double, double* %2, i64 %59
  %61 = getelementptr inbounds double, double* %3, i64 %57
  br label %62, !dbg !160

62:                                               ; preds = %62, %56
  %63 = phi i64 [ %51, %56 ], [ %72, %62 ]
  call void @llvm.dbg.value(metadata i64 %63, metadata !138, metadata !DIExpression()), !dbg !162
  %64 = shl i64 %63, 1, !dbg !163
  %65 = and i64 %64, 2, !dbg !163
  %66 = or i64 %65, %58, !dbg !164
  call void @llvm.dbg.value(metadata i64 %66, metadata !142, metadata !DIExpression()), !dbg !165
  %67 = getelementptr inbounds double, double* %60, i64 %63, !dbg !166
  %68 = load double, double* %67, align 8, !dbg !166, !tbaa !106
  %69 = getelementptr inbounds double, double* %4, i64 %66, !dbg !167
  store double %68, double* %69, align 8, !dbg !168, !tbaa !106
  %70 = mul nsw i64 %63, %1, !dbg !169
  %71 = getelementptr inbounds double, double* %61, i64 %70, !dbg !169
  store double %68, double* %71, align 8, !dbg !170, !tbaa !106
  %72 = add nuw i64 %63, 1, !dbg !171
  call void @llvm.dbg.value(metadata i64 %72, metadata !138, metadata !DIExpression()), !dbg !162
  %73 = icmp ult i64 %72, %52, !dbg !172
  %74 = icmp ult i64 %72, %0, !dbg !173
  %75 = and i1 %73, %74, !dbg !173
  br i1 %75, label %62, label %76, !dbg !160, !llvm.loop !174

76:                                               ; preds = %62
  %77 = add nuw i64 %57, 1, !dbg !176
  call void @llvm.dbg.value(metadata i64 %77, metadata !134, metadata !DIExpression()), !dbg !153
  %78 = icmp ult i64 %77, %42, !dbg !177
  %79 = icmp ult i64 %77, %1, !dbg !178
  %80 = and i1 %78, %79, !dbg !178
  br i1 %80, label %56, label %54, !dbg !152, !llvm.loop !179

81:                                               ; preds = %38, %81
  %82 = phi i64 [ %83, %81 ], [ 0, %38 ]
  call void @llvm.dbg.value(metadata i64 %82, metadata !128, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.value(metadata i64 0, metadata !130, metadata !DIExpression()), !dbg !151
  %83 = add i64 %82, 8, !dbg !181
  call void @llvm.dbg.value(metadata i64 %83, metadata !128, metadata !DIExpression()), !dbg !147
  %84 = icmp ult i64 %83, %1, !dbg !148
  br i1 %84, label %81, label %85, !dbg !149, !llvm.loop !182

85:                                               ; preds = %48, %81, %33, %36, %10, %7
  ret void, !dbg !183
}

; Function Attrs: nofree nosync nounwind uwtable
define internal void @trans_optimized(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* nocapture noundef readonly %4) #2 !dbg !54 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !53, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i64 %1, metadata !56, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata double* %2, metadata !57, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata double* %3, metadata !58, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata double* %4, metadata !59, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i64 2, metadata !60, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i64 2, metadata !62, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i64 0, metadata !63, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i64 0, metadata !64, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i64 2, metadata !65, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i32 undef, metadata !63, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i32 undef, metadata !65, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i32 undef, metadata !63, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !184
  call void @llvm.dbg.value(metadata i32 undef, metadata !65, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i32 undef, metadata !64, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i32 undef, metadata !64, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !184
  %6 = mul i64 %1, %0, !dbg !185
  tail call fastcc void @tr(i64 noundef 0, i64 noundef 0, i64 noundef %6, i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3), !dbg !186
  call void @llvm.dbg.value(metadata i64 0, metadata !66, metadata !DIExpression()), !dbg !184
  %7 = icmp eq i64 %1, 0, !dbg !187
  %8 = icmp eq i64 %0, 0
  %9 = or i1 %7, %8, !dbg !188
  br i1 %9, label %33, label %10, !dbg !188

10:                                               ; preds = %5, %30
  %11 = phi i64 [ %31, %30 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %11, metadata !66, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i64 0, metadata !67, metadata !DIExpression()), !dbg !184
  %12 = lshr i64 %11, 1
  %13 = and i64 %11, 1
  %14 = getelementptr inbounds double, double* %3, i64 %11
  br label %15, !dbg !189

15:                                               ; preds = %10, %15
  %16 = phi i64 [ 0, %10 ], [ %28, %15 ]
  call void @llvm.dbg.value(metadata i64 %16, metadata !67, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i64 %11, metadata !82, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64 %16, metadata !87, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64 1, metadata !88, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64 1, metadata !89, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64 2, metadata !90, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64 2, metadata !91, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64 %12, metadata !92, metadata !DIExpression()), !dbg !190
  %17 = lshr i64 %16, 1, !dbg !192
  call void @llvm.dbg.value(metadata i64 %17, metadata !93, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64 %13, metadata !94, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64 %16, metadata !95, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !190
  %18 = add nuw i64 %17, %12, !dbg !193
  %19 = shl i64 %18, 2, !dbg !194
  %20 = shl i64 %16, 1, !dbg !195
  %21 = and i64 %20, 2, !dbg !195
  %22 = or i64 %19, %21, !dbg !196
  %23 = or i64 %22, %13, !dbg !197
  call void @llvm.dbg.value(metadata i64 %23, metadata !68, metadata !DIExpression()), !dbg !198
  %24 = getelementptr inbounds double, double* %4, i64 %23, !dbg !199
  %25 = load double, double* %24, align 8, !dbg !199, !tbaa !106
  %26 = mul nsw i64 %16, %1, !dbg !200
  %27 = getelementptr inbounds double, double* %14, i64 %26, !dbg !200
  store double %25, double* %27, align 8, !dbg !201, !tbaa !106
  %28 = add nuw i64 %16, 1, !dbg !202
  call void @llvm.dbg.value(metadata i64 %28, metadata !67, metadata !DIExpression()), !dbg !184
  %29 = icmp eq i64 %28, %0, !dbg !203
  br i1 %29, label %30, label %15, !dbg !189, !llvm.loop !204

30:                                               ; preds = %15
  %31 = add nuw i64 %11, 1, !dbg !206
  call void @llvm.dbg.value(metadata i64 %31, metadata !66, metadata !DIExpression()), !dbg !184
  %32 = icmp eq i64 %31, %1, !dbg !187
  br i1 %32, label %33, label %10, !dbg !188, !llvm.loop !207

33:                                               ; preds = %30, %5
  ret void, !dbg !209
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_optimized_32(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef %3, double* nocapture noundef %4) #3 !dbg !210 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !212, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %1, metadata !213, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata double* %2, metadata !214, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata double* %3, metadata !215, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata double* %4, metadata !216, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 0, metadata !217, metadata !DIExpression()), !dbg !221
  %6 = icmp eq i64 %0, 0, !dbg !222
  br i1 %6, label %160, label %7, !dbg !225

7:                                                ; preds = %5
  %8 = icmp eq i64 %1, 0
  br i1 %8, label %156, label %9, !dbg !226

9:                                                ; preds = %7, %153
  %10 = phi i64 [ %154, %153 ], [ 0, %7 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !217, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 0, metadata !218, metadata !DIExpression()), !dbg !221
  %11 = or i64 %10, 7
  %12 = or i64 %10, 3
  %13 = icmp ugt i64 %11, %12
  %14 = icmp ult i64 %11, %0
  %15 = and i1 %13, %14
  br label %16, !dbg !226

16:                                               ; preds = %9, %18
  %17 = phi i64 [ 0, %9 ], [ %19, %18 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !218, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %11, metadata !219, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %11, metadata !219, metadata !DIExpression()), !dbg !221
  br i1 %15, label %40, label %91, !dbg !229

18:                                               ; preds = %21
  %19 = add i64 %17, 8, !dbg !233
  call void @llvm.dbg.value(metadata i64 %19, metadata !218, metadata !DIExpression()), !dbg !221
  %20 = icmp ult i64 %19, %1, !dbg !234
  br i1 %20, label %16, label %153, !dbg !226, !llvm.loop !235

21:                                               ; preds = %26
  %22 = add nuw i64 %142, 1, !dbg !237
  call void @llvm.dbg.value(metadata i64 %22, metadata !219, metadata !DIExpression()), !dbg !221
  %23 = icmp ult i64 %142, %12, !dbg !240
  %24 = icmp ult i64 %22, %0, !dbg !241
  %25 = and i1 %23, %24, !dbg !241
  br i1 %25, label %141, label %18, !dbg !242, !llvm.loop !243

26:                                               ; preds = %141, %26
  %27 = phi i64 [ %17, %141 ], [ %35, %26 ]
  call void @llvm.dbg.value(metadata i64 %27, metadata !220, metadata !DIExpression()), !dbg !221
  %28 = add i64 %27, %152, !dbg !245
  %29 = add nuw nsw i64 %28, 4, !dbg !250
  %30 = getelementptr inbounds double, double* %146, i64 %29, !dbg !251
  %31 = load double, double* %30, align 8, !dbg !251, !tbaa !106
  store double %31, double* %4, align 8, !dbg !252, !tbaa !106
  %32 = getelementptr inbounds double, double* %148, i64 %28, !dbg !253
  %33 = load double, double* %32, align 8, !dbg !253, !tbaa !106
  store double %33, double* %30, align 8, !dbg !254, !tbaa !106
  %34 = load double, double* %4, align 8, !dbg !255, !tbaa !106
  store double %34, double* %32, align 8, !dbg !256, !tbaa !106
  %35 = add nuw nsw i64 %27, 1, !dbg !257
  call void @llvm.dbg.value(metadata i64 %35, metadata !220, metadata !DIExpression()), !dbg !221
  %36 = icmp ult i64 %27, %150, !dbg !258
  %37 = icmp ult i64 %35, %1, !dbg !259
  %38 = and i1 %36, %37, !dbg !259
  br i1 %38, label %26, label %21, !dbg !260, !llvm.loop !261

39:                                               ; preds = %58
  call void @llvm.dbg.value(metadata i64 %11, metadata !219, metadata !DIExpression()), !dbg !221
  br i1 %15, label %63, label %91, !dbg !263

40:                                               ; preds = %16
  %41 = or i64 %17, 3
  %42 = icmp ult i64 %41, %1
  br i1 %42, label %43, label %63, !dbg !265

43:                                               ; preds = %40, %58
  %44 = phi i64 [ %59, %58 ], [ %11, %40 ]
  call void @llvm.dbg.value(metadata i64 %44, metadata !219, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %41, metadata !220, metadata !DIExpression()), !dbg !221
  %45 = mul nsw i64 %44, %0
  %46 = getelementptr inbounds double, double* %2, i64 %45
  %47 = getelementptr inbounds double, double* %3, i64 %44
  br label %48, !dbg !265

48:                                               ; preds = %48, %43
  %49 = phi i64 [ %41, %43 ], [ %54, %48 ]
  call void @llvm.dbg.value(metadata i64 %49, metadata !220, metadata !DIExpression()), !dbg !221
  %50 = getelementptr inbounds double, double* %46, i64 %49, !dbg !269
  %51 = load double, double* %50, align 8, !dbg !269, !tbaa !106
  %52 = mul nsw i64 %49, %1, !dbg !272
  %53 = getelementptr inbounds double, double* %47, i64 %52, !dbg !272
  store double %51, double* %53, align 8, !dbg !273, !tbaa !106
  %54 = add i64 %49, -1, !dbg !274
  call void @llvm.dbg.value(metadata i64 %54, metadata !220, metadata !DIExpression()), !dbg !221
  %55 = icmp uge i64 %54, %17, !dbg !275
  %56 = icmp ult i64 %54, %1, !dbg !276
  %57 = and i1 %55, %56, !dbg !276
  br i1 %57, label %48, label %58, !dbg !265, !llvm.loop !277

58:                                               ; preds = %48
  %59 = add nsw i64 %44, -1, !dbg !279
  call void @llvm.dbg.value(metadata i64 %59, metadata !219, metadata !DIExpression()), !dbg !221
  %60 = icmp ugt i64 %59, %12, !dbg !280
  %61 = icmp ult i64 %59, %0, !dbg !281
  %62 = and i1 %60, %61, !dbg !281
  br i1 %62, label %43, label %39, !dbg !229, !llvm.loop !282

63:                                               ; preds = %40, %39
  %64 = or i64 %17, 4
  %65 = or i64 %17, 7
  %66 = icmp ule i64 %64, %65
  %67 = icmp ult i64 %64, %1
  %68 = and i1 %66, %67
  br i1 %68, label %69, label %91, !dbg !284

69:                                               ; preds = %63, %86
  %70 = phi i64 [ %87, %86 ], [ %11, %63 ]
  call void @llvm.dbg.value(metadata i64 %70, metadata !219, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %64, metadata !220, metadata !DIExpression()), !dbg !221
  %71 = mul nsw i64 %70, %0
  %72 = getelementptr inbounds double, double* %2, i64 %71
  %73 = add nsw i64 %70, -4
  %74 = getelementptr inbounds double, double* %3, i64 %73
  br label %75, !dbg !284

75:                                               ; preds = %75, %69
  %76 = phi i64 [ %64, %69 ], [ %82, %75 ]
  call void @llvm.dbg.value(metadata i64 %76, metadata !220, metadata !DIExpression()), !dbg !221
  %77 = getelementptr inbounds double, double* %72, i64 %76, !dbg !288
  %78 = load double, double* %77, align 8, !dbg !288, !tbaa !106
  %79 = add nsw i64 %76, -4, !dbg !291
  %80 = mul nsw i64 %79, %1, !dbg !292
  %81 = getelementptr inbounds double, double* %74, i64 %80, !dbg !292
  store double %78, double* %81, align 8, !dbg !293, !tbaa !106
  %82 = add nuw i64 %76, 1, !dbg !294
  call void @llvm.dbg.value(metadata i64 %82, metadata !220, metadata !DIExpression()), !dbg !221
  %83 = icmp ult i64 %76, %65, !dbg !295
  %84 = icmp ult i64 %82, %1, !dbg !296
  %85 = and i1 %83, %84, !dbg !296
  br i1 %85, label %75, label %86, !dbg !284, !llvm.loop !297

86:                                               ; preds = %75
  %87 = add nsw i64 %70, -1, !dbg !299
  call void @llvm.dbg.value(metadata i64 %87, metadata !219, metadata !DIExpression()), !dbg !221
  %88 = icmp ugt i64 %87, %12, !dbg !300
  %89 = icmp ult i64 %87, %0, !dbg !301
  %90 = and i1 %88, %89, !dbg !301
  br i1 %90, label %69, label %91, !dbg !263, !llvm.loop !302

91:                                               ; preds = %86, %16, %63, %39
  call void @llvm.dbg.value(metadata i64 %10, metadata !219, metadata !DIExpression()), !dbg !221
  %92 = or i64 %17, 4
  %93 = or i64 %17, 7
  %94 = icmp ule i64 %92, %93
  %95 = icmp ult i64 %92, %1
  %96 = and i1 %94, %95
  br i1 %96, label %97, label %117, !dbg !304

97:                                               ; preds = %91, %112
  %98 = phi i64 [ %113, %112 ], [ %10, %91 ]
  call void @llvm.dbg.value(metadata i64 %98, metadata !219, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %92, metadata !220, metadata !DIExpression()), !dbg !221
  %99 = mul nsw i64 %98, %0
  %100 = getelementptr inbounds double, double* %2, i64 %99
  %101 = getelementptr inbounds double, double* %3, i64 %98
  br label %102, !dbg !304

102:                                              ; preds = %102, %97
  %103 = phi i64 [ %92, %97 ], [ %108, %102 ]
  call void @llvm.dbg.value(metadata i64 %103, metadata !220, metadata !DIExpression()), !dbg !221
  %104 = getelementptr inbounds double, double* %100, i64 %103, !dbg !309
  %105 = load double, double* %104, align 8, !dbg !309, !tbaa !106
  %106 = mul nsw i64 %103, %1, !dbg !312
  %107 = getelementptr inbounds double, double* %101, i64 %106, !dbg !312
  store double %105, double* %107, align 8, !dbg !313, !tbaa !106
  %108 = add nuw i64 %103, 1, !dbg !314
  call void @llvm.dbg.value(metadata i64 %108, metadata !220, metadata !DIExpression()), !dbg !221
  %109 = icmp ult i64 %103, %93, !dbg !315
  %110 = icmp ult i64 %108, %1, !dbg !316
  %111 = and i1 %109, %110, !dbg !316
  br i1 %111, label %102, label %112, !dbg !304, !llvm.loop !317

112:                                              ; preds = %102
  %113 = add nuw i64 %98, 1, !dbg !319
  call void @llvm.dbg.value(metadata i64 %113, metadata !219, metadata !DIExpression()), !dbg !221
  %114 = icmp ult i64 %98, %12, !dbg !320
  %115 = icmp ult i64 %113, %0, !dbg !321
  %116 = and i1 %114, %115, !dbg !321
  br i1 %116, label %97, label %117, !dbg !322, !llvm.loop !323

117:                                              ; preds = %112, %91
  call void @llvm.dbg.value(metadata i64 %10, metadata !219, metadata !DIExpression()), !dbg !221
  %118 = or i64 %17, 3
  br label %119, !dbg !325

119:                                              ; preds = %117, %136
  %120 = phi i64 [ %137, %136 ], [ %10, %117 ]
  call void @llvm.dbg.value(metadata i64 %120, metadata !219, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %17, metadata !220, metadata !DIExpression()), !dbg !221
  %121 = mul nsw i64 %120, %0
  %122 = getelementptr inbounds double, double* %2, i64 %121
  %123 = add i64 %120, 4
  %124 = getelementptr inbounds double, double* %3, i64 %123
  br label %125, !dbg !327

125:                                              ; preds = %125, %119
  %126 = phi i64 [ %17, %119 ], [ %132, %125 ]
  call void @llvm.dbg.value(metadata i64 %126, metadata !220, metadata !DIExpression()), !dbg !221
  %127 = getelementptr inbounds double, double* %122, i64 %126, !dbg !331
  %128 = load double, double* %127, align 8, !dbg !331, !tbaa !106
  %129 = add nuw nsw i64 %126, 4, !dbg !334
  %130 = mul nsw i64 %129, %1, !dbg !335
  %131 = getelementptr inbounds double, double* %124, i64 %130, !dbg !335
  store double %128, double* %131, align 8, !dbg !336, !tbaa !106
  %132 = add nuw nsw i64 %126, 1, !dbg !337
  call void @llvm.dbg.value(metadata i64 %132, metadata !220, metadata !DIExpression()), !dbg !221
  %133 = icmp ult i64 %126, %118, !dbg !338
  %134 = icmp ult i64 %132, %1, !dbg !339
  %135 = and i1 %133, %134, !dbg !339
  br i1 %135, label %125, label %136, !dbg !327, !llvm.loop !340

136:                                              ; preds = %125
  %137 = add nuw i64 %120, 1, !dbg !342
  call void @llvm.dbg.value(metadata i64 %137, metadata !219, metadata !DIExpression()), !dbg !221
  %138 = icmp ult i64 %120, %12, !dbg !343
  %139 = icmp ult i64 %137, %0, !dbg !344
  %140 = and i1 %138, %139, !dbg !344
  br i1 %140, label %119, label %149, !dbg !325, !llvm.loop !345

141:                                              ; preds = %21, %149
  %142 = phi i64 [ %10, %149 ], [ %22, %21 ]
  call void @llvm.dbg.value(metadata i64 %142, metadata !219, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %17, metadata !220, metadata !DIExpression()), !dbg !221
  %143 = add i64 %142, %151
  %144 = add i64 %143, 4
  %145 = mul nsw i64 %144, %1
  %146 = getelementptr inbounds double, double* %3, i64 %145
  %147 = mul nsw i64 %143, %1
  %148 = getelementptr inbounds double, double* %3, i64 %147
  br label %26, !dbg !260

149:                                              ; preds = %136
  call void @llvm.dbg.value(metadata i64 %10, metadata !219, metadata !DIExpression()), !dbg !221
  %150 = or i64 %17, 3
  %151 = sub i64 %17, %10
  %152 = sub i64 %10, %17
  br label %141, !dbg !242

153:                                              ; preds = %18
  %154 = add i64 %10, 8, !dbg !347
  call void @llvm.dbg.value(metadata i64 %154, metadata !217, metadata !DIExpression()), !dbg !221
  %155 = icmp ult i64 %154, %0, !dbg !222
  br i1 %155, label %9, label %160, !dbg !225, !llvm.loop !348

156:                                              ; preds = %7, %156
  %157 = phi i64 [ %158, %156 ], [ 0, %7 ]
  call void @llvm.dbg.value(metadata i64 %157, metadata !217, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 0, metadata !218, metadata !DIExpression()), !dbg !221
  %158 = add i64 %157, 8, !dbg !347
  call void @llvm.dbg.value(metadata i64 %158, metadata !217, metadata !DIExpression()), !dbg !221
  %159 = icmp ult i64 %158, %0, !dbg !222
  br i1 %159, label %156, label %160, !dbg !225, !llvm.loop !348

160:                                              ; preds = %153, %156, %5
  ret void, !dbg !350
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_tmp(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef writeonly %4) #3 !dbg !121 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !120, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i64 %1, metadata !123, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata double* %2, metadata !124, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata double* %3, metadata !125, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata double* %4, metadata !126, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i64 8, metadata !127, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i64 0, metadata !128, metadata !DIExpression()), !dbg !352
  %6 = icmp eq i64 %1, 0, !dbg !353
  br i1 %6, label %54, label %7, !dbg !354

7:                                                ; preds = %5
  %8 = icmp eq i64 %0, 0
  br i1 %8, label %50, label %9, !dbg !355

9:                                                ; preds = %7, %17
  %10 = phi i64 [ %11, %17 ], [ 0, %7 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !128, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.value(metadata i64 0, metadata !130, metadata !DIExpression()), !dbg !356
  %11 = add i64 %10, 8
  %12 = icmp eq i64 %10, -8
  br i1 %12, label %13, label %19, !dbg !357

13:                                               ; preds = %9, %13
  %14 = phi i64 [ %15, %13 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %14, metadata !130, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.value(metadata i64 %10, metadata !134, metadata !DIExpression()), !dbg !358
  %15 = add i64 %14, 8, !dbg !359
  call void @llvm.dbg.value(metadata i64 %15, metadata !130, metadata !DIExpression()), !dbg !356
  %16 = icmp ult i64 %15, %0, !dbg !360
  br i1 %16, label %13, label %17, !dbg !355, !llvm.loop !361

17:                                               ; preds = %23, %13
  call void @llvm.dbg.value(metadata i64 %11, metadata !128, metadata !DIExpression()), !dbg !352
  %18 = icmp ult i64 %11, %1, !dbg !353
  br i1 %18, label %9, label %54, !dbg !354, !llvm.loop !363

19:                                               ; preds = %9, %23
  %20 = phi i64 [ %21, %23 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %20, metadata !130, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.value(metadata i64 %10, metadata !134, metadata !DIExpression()), !dbg !358
  %21 = add i64 %20, 8
  %22 = icmp eq i64 %20, -8
  br i1 %22, label %23, label %25, !dbg !365

23:                                               ; preds = %45, %19
  call void @llvm.dbg.value(metadata i64 %21, metadata !130, metadata !DIExpression()), !dbg !356
  %24 = icmp ult i64 %21, %0, !dbg !360
  br i1 %24, label %19, label %17, !dbg !355, !llvm.loop !361

25:                                               ; preds = %19, %45
  %26 = phi i64 [ %46, %45 ], [ %10, %19 ]
  call void @llvm.dbg.value(metadata i64 %26, metadata !134, metadata !DIExpression()), !dbg !358
  call void @llvm.dbg.value(metadata i64 %20, metadata !138, metadata !DIExpression()), !dbg !366
  %27 = and i64 %26, 1
  %28 = mul nsw i64 %26, %0
  %29 = getelementptr inbounds double, double* %2, i64 %28
  %30 = getelementptr inbounds double, double* %3, i64 %26
  br label %31, !dbg !365

31:                                               ; preds = %31, %25
  %32 = phi i64 [ %20, %25 ], [ %41, %31 ]
  call void @llvm.dbg.value(metadata i64 %32, metadata !138, metadata !DIExpression()), !dbg !366
  %33 = shl i64 %32, 1, !dbg !367
  %34 = and i64 %33, 2, !dbg !367
  %35 = or i64 %34, %27, !dbg !368
  call void @llvm.dbg.value(metadata i64 %35, metadata !142, metadata !DIExpression()), !dbg !369
  %36 = getelementptr inbounds double, double* %29, i64 %32, !dbg !370
  %37 = load double, double* %36, align 8, !dbg !370, !tbaa !106
  %38 = getelementptr inbounds double, double* %4, i64 %35, !dbg !371
  store double %37, double* %38, align 8, !dbg !372, !tbaa !106
  %39 = mul nsw i64 %32, %1, !dbg !373
  %40 = getelementptr inbounds double, double* %30, i64 %39, !dbg !373
  store double %37, double* %40, align 8, !dbg !374, !tbaa !106
  %41 = add nuw i64 %32, 1, !dbg !375
  call void @llvm.dbg.value(metadata i64 %41, metadata !138, metadata !DIExpression()), !dbg !366
  %42 = icmp ult i64 %41, %21, !dbg !376
  %43 = icmp ult i64 %41, %0, !dbg !377
  %44 = and i1 %42, %43, !dbg !377
  br i1 %44, label %31, label %45, !dbg !365, !llvm.loop !378

45:                                               ; preds = %31
  %46 = add nuw i64 %26, 1, !dbg !380
  call void @llvm.dbg.value(metadata i64 %46, metadata !134, metadata !DIExpression()), !dbg !358
  %47 = icmp ult i64 %46, %11, !dbg !381
  %48 = icmp ult i64 %46, %1, !dbg !382
  %49 = and i1 %47, %48, !dbg !382
  br i1 %49, label %25, label %23, !dbg !357, !llvm.loop !383

50:                                               ; preds = %7, %50
  %51 = phi i64 [ %52, %50 ], [ 0, %7 ]
  call void @llvm.dbg.value(metadata i64 %51, metadata !128, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.value(metadata i64 0, metadata !130, metadata !DIExpression()), !dbg !356
  %52 = add i64 %51, 8, !dbg !385
  call void @llvm.dbg.value(metadata i64 %52, metadata !128, metadata !DIExpression()), !dbg !352
  %53 = icmp ult i64 %52, %1, !dbg !353
  br i1 %53, label %50, label %54, !dbg !354, !llvm.loop !363

54:                                               ; preds = %17, %50, %5
  ret void, !dbg !386
}

; Function Attrs: nofree nosync nounwind uwtable
define internal fastcc void @tr(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, double* noundef %5, double* noundef %6) unnamed_addr #2 !dbg !387 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !391, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %1, metadata !392, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %2, metadata !393, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %3, metadata !394, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %4, metadata !395, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata double* %5, metadata !396, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata double* %6, metadata !397, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 2, metadata !398, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 2, metadata !399, metadata !DIExpression()), !dbg !403
  %8 = icmp eq i64 %2, 1, !dbg !404
  br i1 %8, label %9, label %29, !dbg !405

9:                                                ; preds = %29, %7
  %10 = phi i64 [ %0, %7 ], [ %40, %29 ]
  %11 = phi i64 [ %1, %7 ], [ %41, %29 ]
  %12 = mul nsw i64 %10, %3, !dbg !406
  %13 = getelementptr inbounds double, double* %5, i64 %12, !dbg !406
  %14 = mul nsw i64 %11, %4, !dbg !408
  %15 = getelementptr inbounds double, double* %6, i64 %14, !dbg !408
  call void @llvm.dbg.value(metadata double* %13, metadata !409, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata double* %15, metadata !414, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i64 %3, metadata !415, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i64 %4, metadata !416, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i64 2, metadata !417, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i64 2, metadata !418, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i64 0, metadata !419, metadata !DIExpression()), !dbg !421
  br label %16, !dbg !423

16:                                               ; preds = %16, %9
  %17 = phi i64 [ 0, %9 ], [ %27, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !419, metadata !DIExpression()), !dbg !421
  %18 = mul nuw nsw i64 %17, %3
  call void @llvm.dbg.value(metadata i64 0, metadata !420, metadata !DIExpression()), !dbg !421
  %19 = getelementptr inbounds double, double* %13, i64 %18, !dbg !425
  %20 = load double, double* %19, align 8, !dbg !425, !tbaa !106
  %21 = getelementptr inbounds double, double* %15, i64 %17, !dbg !431
  store double %20, double* %21, align 8, !dbg !432, !tbaa !106
  %22 = add i64 %18, 1, !dbg !433
  %23 = getelementptr inbounds double, double* %13, i64 %22, !dbg !425
  %24 = load double, double* %23, align 8, !dbg !425, !tbaa !106
  %25 = add i64 %17, %4, !dbg !434
  %26 = getelementptr inbounds double, double* %15, i64 %25, !dbg !431
  store double %24, double* %26, align 8, !dbg !432, !tbaa !106
  call void @llvm.dbg.value(metadata i64 0, metadata !420, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !421
  %27 = add nuw nsw i64 %17, 1, !dbg !435
  call void @llvm.dbg.value(metadata i64 %27, metadata !419, metadata !DIExpression()), !dbg !421
  %28 = icmp eq i64 %27, 2, !dbg !436
  br i1 %28, label %43, label %16, !dbg !423, !llvm.loop !437

29:                                               ; preds = %7, %29
  %30 = phi i64 [ %33, %29 ], [ %2, %7 ]
  %31 = phi i64 [ %41, %29 ], [ %1, %7 ]
  %32 = phi i64 [ %40, %29 ], [ %0, %7 ]
  call void @llvm.dbg.value(metadata i64 %30, metadata !393, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %31, metadata !392, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %32, metadata !391, metadata !DIExpression()), !dbg !403
  %33 = lshr i64 %30, 2, !dbg !439
  call void @llvm.dbg.value(metadata i64 %33, metadata !400, metadata !DIExpression()), !dbg !440
  tail call fastcc void @tr(i64 noundef %32, i64 noundef %31, i64 noundef %33, i64 noundef %3, i64 noundef %4, double* noundef %5, double* noundef %6), !dbg !441
  %34 = add i64 %33, %32, !dbg !442
  %35 = shl nuw nsw i64 %33, 1, !dbg !443
  %36 = add i64 %35, %31, !dbg !444
  tail call fastcc void @tr(i64 noundef %34, i64 noundef %36, i64 noundef %33, i64 noundef %3, i64 noundef %4, double* noundef %5, double* noundef %6), !dbg !445
  %37 = add i64 %35, %32, !dbg !446
  %38 = add i64 %33, %31, !dbg !447
  tail call fastcc void @tr(i64 noundef %37, i64 noundef %38, i64 noundef %33, i64 noundef %3, i64 noundef %4, double* noundef %5, double* noundef %6), !dbg !448
  %39 = mul nuw i64 %33, 3, !dbg !449
  %40 = add i64 %39, %32, !dbg !450
  %41 = add i64 %39, %31, !dbg !451
  call void @llvm.dbg.value(metadata i64 %40, metadata !391, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %41, metadata !392, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %33, metadata !393, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %3, metadata !394, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 %4, metadata !395, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata double* %5, metadata !396, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata double* %6, metadata !397, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 2, metadata !398, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata i64 2, metadata !399, metadata !DIExpression()), !dbg !403
  %42 = icmp eq i64 %33, 1, !dbg !404
  br i1 %42, label %9, label %29, !dbg !405

43:                                               ; preds = %16
  ret void, !dbg !452
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "trans.c", directory: "/afs/andrew.cmu.edu/usr20/rsaparkh/private/15213/cachelab-m23-roma2023")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !4, line: 46, baseType: !5)
!4 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "")
!5 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!13 = distinct !DISubprogram(name: "registerFunctions", scope: !1, file: !1, line: 353, type: !14, scopeLine: 353, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !16)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocation(line: 355, column: 5, scope: !13)
!18 = !DILocation(line: 358, column: 5, scope: !13)
!19 = !DILocation(line: 359, column: 5, scope: !13)
!20 = !DILocation(line: 360, column: 5, scope: !13)
!21 = !DILocation(line: 361, column: 1, scope: !13)
!22 = !DISubprogram(name: "registerTransFunction", scope: !23, file: !23, line: 99, type: !24, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !16)
!23 = !DIFile(filename: "./cachelab.h", directory: "/afs/andrew.cmu.edu/usr20/rsaparkh/private/15213/cachelab-m23-roma2023")
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26, !35}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !3, !3, !29, !29, !34}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, elements: !32)
!31 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!32 = !{!33}
!33 = !DISubrange(count: -1)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !37)
!37 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!38 = distinct !DISubprogram(name: "transpose_submit", scope: !1, file: !1, line: 339, type: !27, scopeLine: 340, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !39)
!39 = !{!40, !41, !42, !43, !44}
!40 = !DILocalVariable(name: "M", arg: 1, scope: !38, file: !1, line: 339, type: !3)
!41 = !DILocalVariable(name: "N", arg: 2, scope: !38, file: !1, line: 339, type: !3)
!42 = !DILocalVariable(name: "A", arg: 3, scope: !38, file: !1, line: 339, type: !29)
!43 = !DILocalVariable(name: "B", arg: 4, scope: !38, file: !1, line: 339, type: !29)
!44 = !DILocalVariable(name: "tmp", arg: 5, scope: !38, file: !1, line: 340, type: !34)
!45 = !DILocation(line: 0, scope: !38)
!46 = !DILocation(line: 341, column: 11, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !1, line: 341, column: 9)
!48 = !DILocation(line: 341, column: 9, scope: !38)
!49 = !DILocation(line: 341, column: 18, scope: !47)
!50 = !DILocation(line: 342, column: 15, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 342, column: 13)
!52 = !DILocation(line: 342, column: 13, scope: !47)
!53 = !DILocalVariable(name: "M", arg: 1, scope: !54, file: !1, line: 115, type: !3)
!54 = distinct !DISubprogram(name: "trans_optimized", scope: !1, file: !1, line: 115, type: !27, scopeLine: 115, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !55)
!55 = !{!53, !56, !57, !58, !59, !60, !62, !63, !64, !65, !66, !67, !68}
!56 = !DILocalVariable(name: "N", arg: 2, scope: !54, file: !1, line: 115, type: !3)
!57 = !DILocalVariable(name: "A", arg: 3, scope: !54, file: !1, line: 115, type: !29)
!58 = !DILocalVariable(name: "B", arg: 4, scope: !54, file: !1, line: 115, type: !29)
!59 = !DILocalVariable(name: "tmp", arg: 5, scope: !54, file: !1, line: 115, type: !34)
!60 = !DILocalVariable(name: "tR", scope: !54, file: !1, line: 120, type: !61)
!61 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3)
!62 = !DILocalVariable(name: "tC", scope: !54, file: !1, line: 121, type: !61)
!63 = !DILocalVariable(name: "m", scope: !54, file: !1, line: 124, type: !3)
!64 = !DILocalVariable(name: "n", scope: !54, file: !1, line: 125, type: !3)
!65 = !DILocalVariable(name: "temp", scope: !54, file: !1, line: 126, type: !3)
!66 = !DILocalVariable(name: "i", scope: !54, file: !1, line: 141, type: !3)
!67 = !DILocalVariable(name: "j", scope: !54, file: !1, line: 141, type: !3)
!68 = !DILocalVariable(name: "index", scope: !69, file: !1, line: 144, type: !3)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 143, column: 33)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 143, column: 9)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 143, column: 9)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 142, column: 29)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 142, column: 5)
!74 = distinct !DILexicalBlock(scope: !54, file: !1, line: 142, column: 5)
!75 = !DILocation(line: 0, scope: !54, inlinedAt: !76)
!76 = distinct !DILocation(line: 342, column: 21, scope: !51)
!77 = !DILocation(line: 138, column: 29, scope: !54, inlinedAt: !76)
!78 = !DILocation(line: 138, column: 5, scope: !54, inlinedAt: !76)
!79 = !DILocation(line: 142, column: 19, scope: !73, inlinedAt: !76)
!80 = !DILocation(line: 142, column: 5, scope: !74, inlinedAt: !76)
!81 = !DILocation(line: 143, column: 9, scope: !71, inlinedAt: !76)
!82 = !DILocalVariable(name: "i", arg: 1, scope: !83, file: !1, line: 84, type: !3)
!83 = distinct !DISubprogram(name: "LMO", scope: !1, file: !1, line: 84, type: !84, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !86)
!84 = !DISubroutineType(types: !85)
!85 = !{!3, !3, !3, !3, !3, !3, !3}
!86 = !{!82, !87, !88, !89, !90, !91, !92, !93, !94, !95}
!87 = !DILocalVariable(name: "j", arg: 2, scope: !83, file: !1, line: 84, type: !3)
!88 = !DILocalVariable(name: "m", arg: 3, scope: !83, file: !1, line: 84, type: !3)
!89 = !DILocalVariable(name: "n", arg: 4, scope: !83, file: !1, line: 84, type: !3)
!90 = !DILocalVariable(name: "tR", arg: 5, scope: !83, file: !1, line: 84, type: !3)
!91 = !DILocalVariable(name: "tC", arg: 6, scope: !83, file: !1, line: 84, type: !3)
!92 = !DILocalVariable(name: "ti", scope: !83, file: !1, line: 85, type: !3)
!93 = !DILocalVariable(name: "tj", scope: !83, file: !1, line: 86, type: !3)
!94 = !DILocalVariable(name: "fi", scope: !83, file: !1, line: 87, type: !3)
!95 = !DILocalVariable(name: "fj", scope: !83, file: !1, line: 88, type: !3)
!96 = !DILocation(line: 0, scope: !83, inlinedAt: !97)
!97 = distinct !DILocation(line: 144, column: 28, scope: !69, inlinedAt: !76)
!98 = !DILocation(line: 86, column: 19, scope: !83, inlinedAt: !97)
!99 = !DILocation(line: 90, column: 39, scope: !83, inlinedAt: !97)
!100 = !DILocation(line: 90, column: 20, scope: !83, inlinedAt: !97)
!101 = !DILocation(line: 90, column: 64, scope: !83, inlinedAt: !97)
!102 = !DILocation(line: 90, column: 58, scope: !83, inlinedAt: !97)
!103 = !DILocation(line: 90, column: 70, scope: !83, inlinedAt: !97)
!104 = !DILocation(line: 0, scope: !69, inlinedAt: !76)
!105 = !DILocation(line: 145, column: 23, scope: !69, inlinedAt: !76)
!106 = !{!107, !107, i64 0}
!107 = !{!"double", !108, i64 0}
!108 = !{!"omnipotent char", !109, i64 0}
!109 = !{!"Simple C/C++ TBAA"}
!110 = !DILocation(line: 145, column: 13, scope: !69, inlinedAt: !76)
!111 = !DILocation(line: 145, column: 21, scope: !69, inlinedAt: !76)
!112 = !DILocation(line: 143, column: 29, scope: !70, inlinedAt: !76)
!113 = !DILocation(line: 143, column: 23, scope: !70, inlinedAt: !76)
!114 = distinct !{!114, !81, !115, !116}
!115 = !DILocation(line: 146, column: 9, scope: !71, inlinedAt: !76)
!116 = !{!"llvm.loop.unroll.disable"}
!117 = !DILocation(line: 142, column: 25, scope: !73, inlinedAt: !76)
!118 = distinct !{!118, !80, !119, !116}
!119 = !DILocation(line: 147, column: 5, scope: !74, inlinedAt: !76)
!120 = !DILocalVariable(name: "M", arg: 1, scope: !121, file: !1, line: 310, type: !3)
!121 = distinct !DISubprogram(name: "trans_tmp", scope: !1, file: !1, line: 310, type: !27, scopeLine: 310, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !122)
!122 = !{!120, !123, !124, !125, !126, !127, !128, !130, !134, !138, !142}
!123 = !DILocalVariable(name: "N", arg: 2, scope: !121, file: !1, line: 310, type: !3)
!124 = !DILocalVariable(name: "A", arg: 3, scope: !121, file: !1, line: 310, type: !29)
!125 = !DILocalVariable(name: "B", arg: 4, scope: !121, file: !1, line: 310, type: !29)
!126 = !DILocalVariable(name: "tmp", arg: 5, scope: !121, file: !1, line: 310, type: !34)
!127 = !DILocalVariable(name: "blockSize", scope: !121, file: !1, line: 314, type: !61)
!128 = !DILocalVariable(name: "i", scope: !129, file: !1, line: 316, type: !3)
!129 = distinct !DILexicalBlock(scope: !121, file: !1, line: 316, column: 5)
!130 = !DILocalVariable(name: "j", scope: !131, file: !1, line: 317, type: !3)
!131 = distinct !DILexicalBlock(scope: !132, file: !1, line: 317, column: 9)
!132 = distinct !DILexicalBlock(scope: !133, file: !1, line: 316, column: 47)
!133 = distinct !DILexicalBlock(scope: !129, file: !1, line: 316, column: 5)
!134 = !DILocalVariable(name: "ii", scope: !135, file: !1, line: 319, type: !3)
!135 = distinct !DILexicalBlock(scope: !136, file: !1, line: 319, column: 13)
!136 = distinct !DILexicalBlock(scope: !137, file: !1, line: 317, column: 51)
!137 = distinct !DILexicalBlock(scope: !131, file: !1, line: 317, column: 9)
!138 = !DILocalVariable(name: "jj", scope: !139, file: !1, line: 320, type: !3)
!139 = distinct !DILexicalBlock(scope: !140, file: !1, line: 320, column: 17)
!140 = distinct !DILexicalBlock(scope: !141, file: !1, line: 319, column: 69)
!141 = distinct !DILexicalBlock(scope: !135, file: !1, line: 319, column: 13)
!142 = !DILocalVariable(name: "block", scope: !143, file: !1, line: 321, type: !3)
!143 = distinct !DILexicalBlock(scope: !144, file: !1, line: 320, column: 73)
!144 = distinct !DILexicalBlock(scope: !139, file: !1, line: 320, column: 17)
!145 = !DILocation(line: 0, scope: !121, inlinedAt: !146)
!146 = distinct !DILocation(line: 343, column: 10, scope: !51)
!147 = !DILocation(line: 0, scope: !129, inlinedAt: !146)
!148 = !DILocation(line: 316, column: 26, scope: !133, inlinedAt: !146)
!149 = !DILocation(line: 316, column: 5, scope: !129, inlinedAt: !146)
!150 = !DILocation(line: 317, column: 9, scope: !131, inlinedAt: !146)
!151 = !DILocation(line: 0, scope: !131, inlinedAt: !146)
!152 = !DILocation(line: 319, column: 13, scope: !135, inlinedAt: !146)
!153 = !DILocation(line: 0, scope: !135, inlinedAt: !146)
!154 = !DILocation(line: 317, column: 37, scope: !137, inlinedAt: !146)
!155 = !DILocation(line: 317, column: 30, scope: !137, inlinedAt: !146)
!156 = distinct !{!156, !150, !157, !116}
!157 = !DILocation(line: 326, column: 9, scope: !131, inlinedAt: !146)
!158 = distinct !{!158, !149, !159, !116}
!159 = !DILocation(line: 327, column: 5, scope: !129, inlinedAt: !146)
!160 = !DILocation(line: 320, column: 17, scope: !139, inlinedAt: !146)
!161 = distinct !{!161, !150, !157, !116}
!162 = !DILocation(line: 0, scope: !139, inlinedAt: !146)
!163 = !DILocation(line: 321, column: 46, scope: !143, inlinedAt: !146)
!164 = !DILocation(line: 321, column: 51, scope: !143, inlinedAt: !146)
!165 = !DILocation(line: 0, scope: !143, inlinedAt: !146)
!166 = !DILocation(line: 322, column: 34, scope: !143, inlinedAt: !146)
!167 = !DILocation(line: 322, column: 21, scope: !143, inlinedAt: !146)
!168 = !DILocation(line: 322, column: 32, scope: !143, inlinedAt: !146)
!169 = !DILocation(line: 323, column: 21, scope: !143, inlinedAt: !146)
!170 = !DILocation(line: 323, column: 31, scope: !143, inlinedAt: !146)
!171 = !DILocation(line: 320, column: 69, scope: !144, inlinedAt: !146)
!172 = !DILocation(line: 320, column: 40, scope: !144, inlinedAt: !146)
!173 = !DILocation(line: 320, column: 56, scope: !144, inlinedAt: !146)
!174 = distinct !{!174, !160, !175, !116}
!175 = !DILocation(line: 324, column: 17, scope: !139, inlinedAt: !146)
!176 = !DILocation(line: 319, column: 65, scope: !141, inlinedAt: !146)
!177 = !DILocation(line: 319, column: 36, scope: !141, inlinedAt: !146)
!178 = !DILocation(line: 319, column: 52, scope: !141, inlinedAt: !146)
!179 = distinct !{!179, !152, !180, !116}
!180 = !DILocation(line: 325, column: 13, scope: !135, inlinedAt: !146)
!181 = !DILocation(line: 316, column: 33, scope: !133, inlinedAt: !146)
!182 = distinct !{!182, !149, !159, !116}
!183 = !DILocation(line: 344, column: 1, scope: !38)
!184 = !DILocation(line: 0, scope: !54)
!185 = !DILocation(line: 138, column: 29, scope: !54)
!186 = !DILocation(line: 138, column: 5, scope: !54)
!187 = !DILocation(line: 142, column: 19, scope: !73)
!188 = !DILocation(line: 142, column: 5, scope: !74)
!189 = !DILocation(line: 143, column: 9, scope: !71)
!190 = !DILocation(line: 0, scope: !83, inlinedAt: !191)
!191 = distinct !DILocation(line: 144, column: 28, scope: !69)
!192 = !DILocation(line: 86, column: 19, scope: !83, inlinedAt: !191)
!193 = !DILocation(line: 90, column: 39, scope: !83, inlinedAt: !191)
!194 = !DILocation(line: 90, column: 20, scope: !83, inlinedAt: !191)
!195 = !DILocation(line: 90, column: 64, scope: !83, inlinedAt: !191)
!196 = !DILocation(line: 90, column: 58, scope: !83, inlinedAt: !191)
!197 = !DILocation(line: 90, column: 70, scope: !83, inlinedAt: !191)
!198 = !DILocation(line: 0, scope: !69)
!199 = !DILocation(line: 145, column: 23, scope: !69)
!200 = !DILocation(line: 145, column: 13, scope: !69)
!201 = !DILocation(line: 145, column: 21, scope: !69)
!202 = !DILocation(line: 143, column: 29, scope: !70)
!203 = !DILocation(line: 143, column: 23, scope: !70)
!204 = distinct !{!204, !189, !205, !116}
!205 = !DILocation(line: 146, column: 9, scope: !71)
!206 = !DILocation(line: 142, column: 25, scope: !73)
!207 = distinct !{!207, !188, !208, !116}
!208 = !DILocation(line: 147, column: 5, scope: !74)
!209 = !DILocation(line: 148, column: 1, scope: !54)
!210 = distinct !DISubprogram(name: "trans_optimized_32", scope: !1, file: !1, line: 160, type: !27, scopeLine: 160, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !211)
!211 = !{!212, !213, !214, !215, !216, !217, !218, !219, !220}
!212 = !DILocalVariable(name: "M", arg: 1, scope: !210, file: !1, line: 160, type: !3)
!213 = !DILocalVariable(name: "N", arg: 2, scope: !210, file: !1, line: 160, type: !3)
!214 = !DILocalVariable(name: "A", arg: 3, scope: !210, file: !1, line: 160, type: !29)
!215 = !DILocalVariable(name: "B", arg: 4, scope: !210, file: !1, line: 160, type: !29)
!216 = !DILocalVariable(name: "tmp", arg: 5, scope: !210, file: !1, line: 160, type: !34)
!217 = !DILocalVariable(name: "i", scope: !210, file: !1, line: 161, type: !3)
!218 = !DILocalVariable(name: "j", scope: !210, file: !1, line: 161, type: !3)
!219 = !DILocalVariable(name: "p", scope: !210, file: !1, line: 162, type: !3)
!220 = !DILocalVariable(name: "q", scope: !210, file: !1, line: 162, type: !3)
!221 = !DILocation(line: 0, scope: !210)
!222 = !DILocation(line: 164, column: 15, scope: !223)
!223 = distinct !DILexicalBlock(scope: !224, file: !1, line: 164, column: 5)
!224 = distinct !DILexicalBlock(scope: !210, file: !1, line: 164, column: 5)
!225 = !DILocation(line: 164, column: 5, scope: !224)
!226 = !DILocation(line: 165, column: 9, scope: !227)
!227 = distinct !DILexicalBlock(scope: !228, file: !1, line: 165, column: 9)
!228 = distinct !DILexicalBlock(scope: !223, file: !1, line: 164, column: 24)
!229 = !DILocation(line: 167, column: 13, scope: !230)
!230 = distinct !DILexicalBlock(scope: !231, file: !1, line: 167, column: 13)
!231 = distinct !DILexicalBlock(scope: !232, file: !1, line: 165, column: 28)
!232 = distinct !DILexicalBlock(scope: !227, file: !1, line: 165, column: 9)
!233 = !DILocation(line: 165, column: 24, scope: !232)
!234 = !DILocation(line: 165, column: 19, scope: !232)
!235 = distinct !{!235, !226, !236, !116}
!236 = !DILocation(line: 208, column: 9, scope: !227)
!237 = !DILocation(line: 199, column: 40, scope: !238)
!238 = distinct !DILexicalBlock(scope: !239, file: !1, line: 199, column: 13)
!239 = distinct !DILexicalBlock(scope: !231, file: !1, line: 199, column: 13)
!240 = !DILocation(line: 199, column: 24, scope: !238)
!241 = !DILocation(line: 199, column: 32, scope: !238)
!242 = !DILocation(line: 199, column: 13, scope: !239)
!243 = distinct !{!243, !242, !244, !116}
!244 = !DILocation(line: 207, column: 13, scope: !239)
!245 = !DILocation(line: 203, column: 40, scope: !246)
!246 = distinct !DILexicalBlock(scope: !247, file: !1, line: 202, column: 17)
!247 = distinct !DILexicalBlock(scope: !248, file: !1, line: 201, column: 17)
!248 = distinct !DILexicalBlock(scope: !249, file: !1, line: 201, column: 17)
!249 = distinct !DILexicalBlock(scope: !238, file: !1, line: 200, column: 13)
!250 = !DILocation(line: 203, column: 42, scope: !246)
!251 = !DILocation(line: 203, column: 26, scope: !246)
!252 = !DILocation(line: 203, column: 25, scope: !246)
!253 = !DILocation(line: 204, column: 45, scope: !246)
!254 = !DILocation(line: 204, column: 44, scope: !246)
!255 = !DILocation(line: 205, column: 41, scope: !246)
!256 = !DILocation(line: 205, column: 40, scope: !246)
!257 = !DILocation(line: 201, column: 44, scope: !247)
!258 = !DILocation(line: 201, column: 28, scope: !247)
!259 = !DILocation(line: 201, column: 36, scope: !247)
!260 = !DILocation(line: 201, column: 17, scope: !248)
!261 = distinct !{!261, !260, !262, !116}
!262 = !DILocation(line: 206, column: 17, scope: !248)
!263 = !DILocation(line: 175, column: 13, scope: !264)
!264 = distinct !DILexicalBlock(scope: !231, file: !1, line: 175, column: 13)
!265 = !DILocation(line: 169, column: 17, scope: !266)
!266 = distinct !DILexicalBlock(scope: !267, file: !1, line: 169, column: 17)
!267 = distinct !DILexicalBlock(scope: !268, file: !1, line: 168, column: 13)
!268 = distinct !DILexicalBlock(scope: !230, file: !1, line: 167, column: 13)
!269 = !DILocation(line: 171, column: 29, scope: !270)
!270 = distinct !DILexicalBlock(scope: !271, file: !1, line: 170, column: 17)
!271 = distinct !DILexicalBlock(scope: !266, file: !1, line: 169, column: 17)
!272 = !DILocation(line: 171, column: 21, scope: !270)
!273 = !DILocation(line: 171, column: 28, scope: !270)
!274 = !DILocation(line: 169, column: 42, scope: !271)
!275 = !DILocation(line: 169, column: 30, scope: !271)
!276 = !DILocation(line: 169, column: 34, scope: !271)
!277 = distinct !{!277, !265, !278, !116}
!278 = !DILocation(line: 172, column: 17, scope: !266)
!279 = !DILocation(line: 167, column: 41, scope: !268)
!280 = !DILocation(line: 167, column: 26, scope: !268)
!281 = !DILocation(line: 167, column: 33, scope: !268)
!282 = distinct !{!282, !229, !283, !116}
!283 = !DILocation(line: 173, column: 13, scope: !230)
!284 = !DILocation(line: 177, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !286, file: !1, line: 177, column: 17)
!286 = distinct !DILexicalBlock(scope: !287, file: !1, line: 176, column: 13)
!287 = distinct !DILexicalBlock(scope: !264, file: !1, line: 175, column: 13)
!288 = !DILocation(line: 179, column: 33, scope: !289)
!289 = distinct !DILexicalBlock(scope: !290, file: !1, line: 178, column: 17)
!290 = distinct !DILexicalBlock(scope: !285, file: !1, line: 177, column: 17)
!291 = !DILocation(line: 179, column: 24, scope: !289)
!292 = !DILocation(line: 179, column: 21, scope: !289)
!293 = !DILocation(line: 179, column: 32, scope: !289)
!294 = !DILocation(line: 177, column: 46, scope: !290)
!295 = !DILocation(line: 177, column: 30, scope: !290)
!296 = !DILocation(line: 177, column: 38, scope: !290)
!297 = distinct !{!297, !284, !298, !116}
!298 = !DILocation(line: 180, column: 17, scope: !285)
!299 = !DILocation(line: 175, column: 41, scope: !287)
!300 = !DILocation(line: 175, column: 26, scope: !287)
!301 = !DILocation(line: 175, column: 33, scope: !287)
!302 = distinct !{!302, !263, !303, !116}
!303 = !DILocation(line: 181, column: 13, scope: !264)
!304 = !DILocation(line: 185, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !306, file: !1, line: 185, column: 17)
!306 = distinct !DILexicalBlock(scope: !307, file: !1, line: 184, column: 13)
!307 = distinct !DILexicalBlock(scope: !308, file: !1, line: 183, column: 13)
!308 = distinct !DILexicalBlock(scope: !231, file: !1, line: 183, column: 13)
!309 = !DILocation(line: 187, column: 29, scope: !310)
!310 = distinct !DILexicalBlock(scope: !311, file: !1, line: 186, column: 17)
!311 = distinct !DILexicalBlock(scope: !305, file: !1, line: 185, column: 17)
!312 = !DILocation(line: 187, column: 21, scope: !310)
!313 = !DILocation(line: 187, column: 28, scope: !310)
!314 = !DILocation(line: 185, column: 46, scope: !311)
!315 = !DILocation(line: 185, column: 30, scope: !311)
!316 = !DILocation(line: 185, column: 38, scope: !311)
!317 = distinct !{!317, !304, !318, !116}
!318 = !DILocation(line: 188, column: 17, scope: !305)
!319 = !DILocation(line: 183, column: 40, scope: !307)
!320 = !DILocation(line: 183, column: 24, scope: !307)
!321 = !DILocation(line: 183, column: 32, scope: !307)
!322 = !DILocation(line: 183, column: 13, scope: !308)
!323 = distinct !{!323, !322, !324, !116}
!324 = !DILocation(line: 189, column: 13, scope: !308)
!325 = !DILocation(line: 191, column: 13, scope: !326)
!326 = distinct !DILexicalBlock(scope: !231, file: !1, line: 191, column: 13)
!327 = !DILocation(line: 193, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !329, file: !1, line: 193, column: 17)
!329 = distinct !DILexicalBlock(scope: !330, file: !1, line: 192, column: 13)
!330 = distinct !DILexicalBlock(scope: !326, file: !1, line: 191, column: 13)
!331 = !DILocation(line: 195, column: 33, scope: !332)
!332 = distinct !DILexicalBlock(scope: !333, file: !1, line: 194, column: 17)
!333 = distinct !DILexicalBlock(scope: !328, file: !1, line: 193, column: 17)
!334 = !DILocation(line: 195, column: 24, scope: !332)
!335 = !DILocation(line: 195, column: 21, scope: !332)
!336 = !DILocation(line: 195, column: 32, scope: !332)
!337 = !DILocation(line: 193, column: 44, scope: !333)
!338 = !DILocation(line: 193, column: 28, scope: !333)
!339 = !DILocation(line: 193, column: 36, scope: !333)
!340 = distinct !{!340, !327, !341, !116}
!341 = !DILocation(line: 196, column: 17, scope: !328)
!342 = !DILocation(line: 191, column: 40, scope: !330)
!343 = !DILocation(line: 191, column: 24, scope: !330)
!344 = !DILocation(line: 191, column: 32, scope: !330)
!345 = distinct !{!345, !325, !346, !116}
!346 = !DILocation(line: 197, column: 13, scope: !326)
!347 = !DILocation(line: 164, column: 20, scope: !223)
!348 = distinct !{!348, !225, !349, !116}
!349 = !DILocation(line: 210, column: 5, scope: !224)
!350 = !DILocation(line: 211, column: 1, scope: !210)
!351 = !DILocation(line: 0, scope: !121)
!352 = !DILocation(line: 0, scope: !129)
!353 = !DILocation(line: 316, column: 26, scope: !133)
!354 = !DILocation(line: 316, column: 5, scope: !129)
!355 = !DILocation(line: 317, column: 9, scope: !131)
!356 = !DILocation(line: 0, scope: !131)
!357 = !DILocation(line: 319, column: 13, scope: !135)
!358 = !DILocation(line: 0, scope: !135)
!359 = !DILocation(line: 317, column: 37, scope: !137)
!360 = !DILocation(line: 317, column: 30, scope: !137)
!361 = distinct !{!361, !355, !362, !116}
!362 = !DILocation(line: 326, column: 9, scope: !131)
!363 = distinct !{!363, !354, !364, !116}
!364 = !DILocation(line: 327, column: 5, scope: !129)
!365 = !DILocation(line: 320, column: 17, scope: !139)
!366 = !DILocation(line: 0, scope: !139)
!367 = !DILocation(line: 321, column: 46, scope: !143)
!368 = !DILocation(line: 321, column: 51, scope: !143)
!369 = !DILocation(line: 0, scope: !143)
!370 = !DILocation(line: 322, column: 34, scope: !143)
!371 = !DILocation(line: 322, column: 21, scope: !143)
!372 = !DILocation(line: 322, column: 32, scope: !143)
!373 = !DILocation(line: 323, column: 21, scope: !143)
!374 = !DILocation(line: 323, column: 31, scope: !143)
!375 = !DILocation(line: 320, column: 69, scope: !144)
!376 = !DILocation(line: 320, column: 40, scope: !144)
!377 = !DILocation(line: 320, column: 56, scope: !144)
!378 = distinct !{!378, !365, !379, !116}
!379 = !DILocation(line: 324, column: 17, scope: !139)
!380 = !DILocation(line: 319, column: 65, scope: !141)
!381 = !DILocation(line: 319, column: 36, scope: !141)
!382 = !DILocation(line: 319, column: 52, scope: !141)
!383 = distinct !{!383, !357, !384, !116}
!384 = !DILocation(line: 325, column: 13, scope: !135)
!385 = !DILocation(line: 316, column: 33, scope: !133)
!386 = !DILocation(line: 330, column: 1, scope: !121)
!387 = distinct !DISubprogram(name: "tr", scope: !1, file: !1, line: 102, type: !388, scopeLine: 102, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !390)
!388 = !DISubroutineType(types: !389)
!389 = !{null, !5, !5, !3, !3, !3, !29, !29, !3, !3}
!390 = !{!391, !392, !393, !394, !395, !396, !397, !398, !399, !400}
!391 = !DILocalVariable(name: "src", arg: 1, scope: !387, file: !1, line: 102, type: !5)
!392 = !DILocalVariable(name: "dst", arg: 2, scope: !387, file: !1, line: 102, type: !5)
!393 = !DILocalVariable(name: "num", arg: 3, scope: !387, file: !1, line: 102, type: !3)
!394 = !DILocalVariable(name: "M", arg: 4, scope: !387, file: !1, line: 102, type: !3)
!395 = !DILocalVariable(name: "N", arg: 5, scope: !387, file: !1, line: 102, type: !3)
!396 = !DILocalVariable(name: "A", arg: 6, scope: !387, file: !1, line: 102, type: !29)
!397 = !DILocalVariable(name: "B", arg: 7, scope: !387, file: !1, line: 102, type: !29)
!398 = !DILocalVariable(name: "tR", arg: 8, scope: !387, file: !1, line: 102, type: !3)
!399 = !DILocalVariable(name: "tC", arg: 9, scope: !387, file: !1, line: 102, type: !3)
!400 = !DILocalVariable(name: "nn1", scope: !401, file: !1, line: 107, type: !3)
!401 = distinct !DILexicalBlock(scope: !402, file: !1, line: 106, column: 12)
!402 = distinct !DILexicalBlock(scope: !387, file: !1, line: 103, column: 9)
!403 = !DILocation(line: 0, scope: !387)
!404 = !DILocation(line: 103, column: 13, scope: !402)
!405 = !DILocation(line: 103, column: 9, scope: !387)
!406 = !DILocation(line: 105, column: 23, scope: !407)
!407 = distinct !DILexicalBlock(scope: !402, file: !1, line: 103, column: 19)
!408 = !DILocation(line: 105, column: 31, scope: !407)
!409 = !DILocalVariable(name: "src", arg: 1, scope: !410, file: !1, line: 93, type: !34)
!410 = distinct !DISubprogram(name: "transposeTile", scope: !1, file: !1, line: 93, type: !411, scopeLine: 93, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !413)
!411 = !DISubroutineType(types: !412)
!412 = !{null, !34, !34, !3, !3, !3, !3}
!413 = !{!409, !414, !415, !416, !417, !418, !419, !420}
!414 = !DILocalVariable(name: "dst", arg: 2, scope: !410, file: !1, line: 93, type: !34)
!415 = !DILocalVariable(name: "srcStride", arg: 3, scope: !410, file: !1, line: 93, type: !3)
!416 = !DILocalVariable(name: "dstStride", arg: 4, scope: !410, file: !1, line: 93, type: !3)
!417 = !DILocalVariable(name: "tR", arg: 5, scope: !410, file: !1, line: 93, type: !3)
!418 = !DILocalVariable(name: "tC", arg: 6, scope: !410, file: !1, line: 93, type: !3)
!419 = !DILocalVariable(name: "i", scope: !410, file: !1, line: 94, type: !3)
!420 = !DILocalVariable(name: "j", scope: !410, file: !1, line: 94, type: !3)
!421 = !DILocation(line: 0, scope: !410, inlinedAt: !422)
!422 = distinct !DILocation(line: 105, column: 9, scope: !407)
!423 = !DILocation(line: 95, column: 5, scope: !424, inlinedAt: !422)
!424 = distinct !DILexicalBlock(scope: !410, file: !1, line: 95, column: 5)
!425 = !DILocation(line: 97, column: 38, scope: !426, inlinedAt: !422)
!426 = distinct !DILexicalBlock(scope: !427, file: !1, line: 96, column: 34)
!427 = distinct !DILexicalBlock(scope: !428, file: !1, line: 96, column: 9)
!428 = distinct !DILexicalBlock(scope: !429, file: !1, line: 96, column: 9)
!429 = distinct !DILexicalBlock(scope: !430, file: !1, line: 95, column: 30)
!430 = distinct !DILexicalBlock(scope: !424, file: !1, line: 95, column: 5)
!431 = !DILocation(line: 97, column: 13, scope: !426, inlinedAt: !422)
!432 = !DILocation(line: 97, column: 36, scope: !426, inlinedAt: !422)
!433 = !DILocation(line: 97, column: 56, scope: !426, inlinedAt: !422)
!434 = !DILocation(line: 97, column: 31, scope: !426, inlinedAt: !422)
!435 = !DILocation(line: 95, column: 26, scope: !430, inlinedAt: !422)
!436 = !DILocation(line: 95, column: 19, scope: !430, inlinedAt: !422)
!437 = distinct !{!437, !423, !438, !116}
!438 = !DILocation(line: 99, column: 5, scope: !424, inlinedAt: !422)
!439 = !DILocation(line: 107, column: 26, scope: !401)
!440 = !DILocation(line: 0, scope: !401)
!441 = !DILocation(line: 108, column: 9, scope: !401)
!442 = !DILocation(line: 109, column: 16, scope: !401)
!443 = !DILocation(line: 109, column: 31, scope: !401)
!444 = !DILocation(line: 109, column: 27, scope: !401)
!445 = !DILocation(line: 109, column: 9, scope: !401)
!446 = !DILocation(line: 110, column: 16, scope: !401)
!447 = !DILocation(line: 110, column: 31, scope: !401)
!448 = !DILocation(line: 110, column: 9, scope: !401)
!449 = !DILocation(line: 111, column: 20, scope: !401)
!450 = !DILocation(line: 111, column: 16, scope: !401)
!451 = !DILocation(line: 111, column: 31, scope: !401)
!452 = !DILocation(line: 113, column: 1, scope: !387)
