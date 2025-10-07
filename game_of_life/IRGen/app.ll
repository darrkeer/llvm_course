; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @is_alive(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = load i32, ptr %5, align 4
  %9 = mul nsw i32 %8, 600
  %10 = load i32, ptr %4, align 4
  %11 = add nsw i32 %9, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8, ptr %7, i64 %12
  %14 = load i8, ptr %13, align 1
  ret i8 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @set_alive(i32 noundef %0, i32 noundef %1, i8 noundef signext %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i8 %2, ptr %7, align 1
  store ptr %3, ptr %8, align 8
  %9 = load i8, ptr %7, align 1
  %10 = load ptr, ptr %8, align 8
  %11 = load i32, ptr %6, align 4
  %12 = mul nsw i32 %11, 600
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr %10, i64 %15
  store i8 %9, ptr %16, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @generate_field(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %29, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 800
  br i1 %7, label %8, label %32

8:                                                ; preds = %5
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %25, %8
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %10, 600
  br i1 %11, label %12, label %28

12:                                               ; preds = %9
  %13 = call i32 (...) @sim_get_rand()
  %14 = srem i32 %13, 5
  %15 = icmp sgt i32 %14, 1
  br i1 %15, label %16, label %20

16:                                               ; preds = %12
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = load ptr, ptr %2, align 8
  call void @set_alive(i32 noundef %17, i32 noundef %18, i8 noundef signext 1, ptr noundef %19)
  br label %24

20:                                               ; preds = %12
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %4, align 4
  %23 = load ptr, ptr %2, align 8
  call void @set_alive(i32 noundef %21, i32 noundef %22, i8 noundef signext 0, ptr noundef %23)
  br label %24

24:                                               ; preds = %20, %16
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %9, !llvm.loop !6

28:                                               ; preds = %9
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %3, align 4
  br label %5, !llvm.loop !8

32:                                               ; preds = %5
  ret void
}

declare i32 @sim_get_rand(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @calc_siblings(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 -1, ptr %8, align 4
  br label %12

12:                                               ; preds = %60, %3
  %13 = load i32, ptr %8, align 4
  %14 = icmp sle i32 %13, 1
  br i1 %14, label %15, label %63

15:                                               ; preds = %12
  store i32 -1, ptr %9, align 4
  br label %16

16:                                               ; preds = %56, %15
  %17 = load i32, ptr %9, align 4
  %18 = icmp sle i32 %17, 1
  br i1 %18, label %19, label %59

19:                                               ; preds = %16
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %8, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %10, align 4
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %9, align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, ptr %11, align 4
  %26 = load i32, ptr %10, align 4
  %27 = icmp sle i32 0, %26
  br i1 %27, label %28, label %45

28:                                               ; preds = %19
  %29 = load i32, ptr %10, align 4
  %30 = icmp slt i32 %29, 800
  br i1 %30, label %31, label %45

31:                                               ; preds = %28
  %32 = load i32, ptr %11, align 4
  %33 = icmp sle i32 0, %32
  br i1 %33, label %34, label %45

34:                                               ; preds = %31
  %35 = load i32, ptr %11, align 4
  %36 = icmp slt i32 %35, 600
  br i1 %36, label %37, label %45

37:                                               ; preds = %34
  %38 = load i32, ptr %10, align 4
  %39 = load i32, ptr %4, align 4
  %40 = icmp eq i32 %38, %39
  br i1 %40, label %41, label %46

41:                                               ; preds = %37
  %42 = load i32, ptr %11, align 4
  %43 = load i32, ptr %5, align 4
  %44 = icmp eq i32 %42, %43
  br i1 %44, label %45, label %46

45:                                               ; preds = %41, %34, %31, %28, %19
  br label %56

46:                                               ; preds = %41, %37
  %47 = load i32, ptr %10, align 4
  %48 = load i32, ptr %11, align 4
  %49 = load ptr, ptr %6, align 8
  %50 = call signext i8 @is_alive(i32 noundef %47, i32 noundef %48, ptr noundef %49)
  %51 = icmp ne i8 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %46
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %7, align 4
  br label %55

55:                                               ; preds = %52, %46
  br label %56

56:                                               ; preds = %55, %45
  %57 = load i32, ptr %9, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %9, align 4
  br label %16, !llvm.loop !9

59:                                               ; preds = %16
  br label %60

60:                                               ; preds = %59
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %8, align 4
  br label %12, !llvm.loop !10

63:                                               ; preds = %12
  %64 = load i32, ptr %7, align 4
  ret i32 %64
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @update_field(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %58, %2
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 800
  br i1 %10, label %11, label %61

11:                                               ; preds = %8
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %54, %11
  %13 = load i32, ptr %6, align 4
  %14 = icmp slt i32 %13, 600
  br i1 %14, label %15, label %57

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %6, align 4
  %18 = load ptr, ptr %3, align 8
  %19 = call i32 @calc_siblings(i32 noundef %16, i32 noundef %17, ptr noundef %18)
  store i32 %19, ptr %7, align 4
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = load ptr, ptr %3, align 8
  %23 = call signext i8 @is_alive(i32 noundef %20, i32 noundef %21, ptr noundef %22)
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 1
  br i1 %25, label %26, label %41

26:                                               ; preds = %15
  %27 = load i32, ptr %7, align 4
  %28 = icmp sle i32 2, %27
  br i1 %28, label %29, label %36

29:                                               ; preds = %26
  %30 = load i32, ptr %7, align 4
  %31 = icmp sle i32 %30, 3
  br i1 %31, label %32, label %36

32:                                               ; preds = %29
  %33 = load i32, ptr %5, align 4
  %34 = load i32, ptr %6, align 4
  %35 = load ptr, ptr %4, align 8
  call void @set_alive(i32 noundef %33, i32 noundef %34, i8 noundef signext 1, ptr noundef %35)
  br label %40

36:                                               ; preds = %29, %26
  %37 = load i32, ptr %5, align 4
  %38 = load i32, ptr %6, align 4
  %39 = load ptr, ptr %4, align 8
  call void @set_alive(i32 noundef %37, i32 noundef %38, i8 noundef signext 0, ptr noundef %39)
  br label %40

40:                                               ; preds = %36, %32
  br label %53

41:                                               ; preds = %15
  %42 = load i32, ptr %7, align 4
  %43 = icmp eq i32 %42, 3
  br i1 %43, label %44, label %48

44:                                               ; preds = %41
  %45 = load i32, ptr %5, align 4
  %46 = load i32, ptr %6, align 4
  %47 = load ptr, ptr %4, align 8
  call void @set_alive(i32 noundef %45, i32 noundef %46, i8 noundef signext 1, ptr noundef %47)
  br label %52

48:                                               ; preds = %41
  %49 = load i32, ptr %5, align 4
  %50 = load i32, ptr %6, align 4
  %51 = load ptr, ptr %4, align 8
  call void @set_alive(i32 noundef %49, i32 noundef %50, i8 noundef signext 0, ptr noundef %51)
  br label %52

52:                                               ; preds = %48, %44
  br label %53

53:                                               ; preds = %52, %40
  br label %54

54:                                               ; preds = %53
  %55 = load i32, ptr %6, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %6, align 4
  br label %12, !llvm.loop !11

57:                                               ; preds = %12
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %5, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %5, align 4
  br label %8, !llvm.loop !12

61:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @paint_field(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %29, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 800
  br i1 %7, label %8, label %32

8:                                                ; preds = %5
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %25, %8
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %10, 600
  br i1 %11, label %12, label %28

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = call signext i8 @is_alive(i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %17 = icmp ne i8 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %12
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  call void @sim_draw_color(i32 noundef %19, i32 noundef %20, i32 noundef -1)
  br label %24

21:                                               ; preds = %12
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  call void @sim_draw_color(i32 noundef %22, i32 noundef %23, i32 noundef -16777216)
  br label %24

24:                                               ; preds = %21, %18
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %9, !llvm.loop !13

28:                                               ; preds = %9
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %3, align 4
  br label %5, !llvm.loop !14

32:                                               ; preds = %5
  ret void
}

declare void @sim_draw_color(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @app() #0 {
  %1 = alloca [480000 x i8], align 16
  %2 = alloca [480000 x i8], align 16
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = getelementptr inbounds [480000 x i8], ptr %1, i64 0, i64 0
  store ptr %7, ptr %3, align 8
  %8 = getelementptr inbounds [480000 x i8], ptr %2, i64 0, i64 0
  store ptr %8, ptr %4, align 8
  store i32 0, ptr %5, align 4
  %9 = load ptr, ptr %3, align 8
  call void @generate_field(ptr noundef %9)
  br label %10

10:                                               ; preds = %0, %10
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %4, align 8
  call void @update_field(ptr noundef %11, ptr noundef %12)
  %13 = load ptr, ptr %4, align 8
  call void @paint_field(ptr noundef %13)
  call void (...) @sim_flush()
  %14 = load ptr, ptr %3, align 8
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %4, align 8
  store ptr %15, ptr %3, align 8
  %16 = load ptr, ptr %6, align 8
  store ptr %16, ptr %4, align 8
  br label %10
}

declare void @sim_flush(...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
