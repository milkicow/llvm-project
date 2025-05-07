; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p:32:32-i8:8:32-i16:16:32-i64:64-n32"
target triple = "arch52"

; Function Attrs: noinline nounwind optnone
define dso_local void @app() #0 {
entry:
  %a = alloca [1250 x i32], align 4
  %a_next = alloca [1250 x i32], align 4
  %i = alloca i32, align 4
  %alive = alloca ptr, align 4
  %alive_next = alloca ptr, align 4
  %s = alloca i32, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %y24 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %n = alloca i32, align 4
  %ny = alloca i32, align 4
  %nx = alloca i32, align 4
  %wrapped_x = alloca i32, align 4
  %wrapped_y = alloca i32, align 4
  %current = alloca i32, align 4
  %tmp = alloca ptr, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 1250
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %arrayidx = getelementptr inbounds [1250 x i32], ptr %a, i32 0, i32 %1
  store i32 0, ptr %arrayidx, align 4
  %2 = load i32, ptr %i, align 4
  %arrayidx1 = getelementptr inbounds [1250 x i32], ptr %a_next, i32 0, i32 %2
  store i32 0, ptr %arrayidx1, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, ptr %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !3

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [1250 x i32], ptr %a, i32 0, i32 52
  store i32 1, ptr %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds [1250 x i32], ptr %a, i32 0, i32 103
  store i32 1, ptr %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [1250 x i32], ptr %a, i32 0, i32 104
  store i32 1, ptr %arrayidx4, align 4
  %arrayidx5 = getelementptr inbounds [1250 x i32], ptr %a, i32 0, i32 152
  store i32 1, ptr %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds [1250 x i32], ptr %a, i32 0, i32 153
  store i32 1, ptr %arrayidx6, align 4
  %arraydecay = getelementptr inbounds [1250 x i32], ptr %a, i32 0, i32 0
  store ptr %arraydecay, ptr %alive, align 4
  %arraydecay7 = getelementptr inbounds [1250 x i32], ptr %a_next, i32 0, i32 0
  store ptr %arraydecay7, ptr %alive_next, align 4
  store i32 0, ptr %s, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc97, %for.end
  %4 = load i32, ptr %s, align 4
  %cmp9 = icmp slt i32 %4, 1000
  br i1 %cmp9, label %for.body10, label %for.end99

for.body10:                                       ; preds = %for.cond8
  store i32 0, ptr %y, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc21, %for.body10
  %5 = load i32, ptr %y, align 4
  %cmp12 = icmp slt i32 %5, 25
  br i1 %cmp12, label %for.body13, label %for.end23

for.body13:                                       ; preds = %for.cond11
  store i32 0, ptr %x, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc18, %for.body13
  %6 = load i32, ptr %x, align 4
  %cmp15 = icmp slt i32 %6, 50
  br i1 %cmp15, label %for.body16, label %for.end20

for.body16:                                       ; preds = %for.cond14
  %7 = load ptr, ptr %alive, align 4
  %8 = load i32, ptr %y, align 4
  %mul = mul nsw i32 %8, 50
  %9 = load i32, ptr %x, align 4
  %add = add nsw i32 %mul, %9
  %arrayidx17 = getelementptr inbounds i32, ptr %7, i32 %add
  %10 = load i32, ptr %arrayidx17, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body16
  %11 = load i32, ptr %x, align 4
  %12 = load i32, ptr %y, align 4
  call void @llvm.arch52.putdisplaypixel(i32 %11, i32 %12, i32 -16777216)
  br label %if.end

if.else:                                          ; preds = %for.body16
  %13 = load i32, ptr %x, align 4
  %14 = load i32, ptr %y, align 4
  call void @llvm.arch52.putdisplaypixel(i32 %13, i32 %14, i32 -1)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc18

for.inc18:                                        ; preds = %if.end
  %15 = load i32, ptr %x, align 4
  %inc19 = add nsw i32 %15, 1
  store i32 %inc19, ptr %x, align 4
  br label %for.cond14, !llvm.loop !5

for.end20:                                        ; preds = %for.cond14
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %16 = load i32, ptr %y, align 4
  %inc22 = add nsw i32 %16, 1
  store i32 %inc22, ptr %y, align 4
  br label %for.cond11, !llvm.loop !6

for.end23:                                        ; preds = %for.cond11
  call void @llvm.arch52.flush()
  store i32 0, ptr %y24, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc94, %for.end23
  %17 = load i32, ptr %y24, align 4
  %cmp26 = icmp slt i32 %17, 25
  br i1 %cmp26, label %for.body27, label %for.end96

for.body27:                                       ; preds = %for.cond25
  store i32 0, ptr %x28, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc91, %for.body27
  %18 = load i32, ptr %x28, align 4
  %cmp30 = icmp slt i32 %18, 50
  br i1 %cmp30, label %for.body31, label %for.end93

for.body31:                                       ; preds = %for.cond29
  store i32 0, ptr %n, align 4
  %19 = load i32, ptr %y24, align 4
  %sub = sub nsw i32 %19, 1
  store i32 %sub, ptr %ny, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc66, %for.body31
  %20 = load i32, ptr %ny, align 4
  %21 = load i32, ptr %y24, align 4
  %add33 = add nsw i32 %21, 1
  %cmp34 = icmp sle i32 %20, %add33
  br i1 %cmp34, label %for.body35, label %for.end68

for.body35:                                       ; preds = %for.cond32
  %22 = load i32, ptr %x28, align 4
  %sub36 = sub nsw i32 %22, 1
  store i32 %sub36, ptr %nx, align 4
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc63, %for.body35
  %23 = load i32, ptr %nx, align 4
  %24 = load i32, ptr %x28, align 4
  %add38 = add nsw i32 %24, 1
  %cmp39 = icmp sle i32 %23, %add38
  br i1 %cmp39, label %for.body40, label %for.end65

for.body40:                                       ; preds = %for.cond37
  %25 = load i32, ptr %nx, align 4
  %26 = load i32, ptr %x28, align 4
  %cmp41 = icmp eq i32 %25, %26
  br i1 %cmp41, label %land.lhs.true, label %if.end44

land.lhs.true:                                    ; preds = %for.body40
  %27 = load i32, ptr %ny, align 4
  %28 = load i32, ptr %y24, align 4
  %cmp42 = icmp eq i32 %27, %28
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %land.lhs.true
  br label %for.inc63

if.end44:                                         ; preds = %land.lhs.true, %for.body40
  %29 = load i32, ptr %nx, align 4
  store i32 %29, ptr %wrapped_x, align 4
  %30 = load i32, ptr %ny, align 4
  store i32 %30, ptr %wrapped_y, align 4
  %31 = load i32, ptr %wrapped_x, align 4
  %cmp45 = icmp slt i32 %31, 0
  br i1 %cmp45, label %if.then46, label %if.else47

if.then46:                                        ; preds = %if.end44
  store i32 49, ptr %wrapped_x, align 4
  br label %if.end51

if.else47:                                        ; preds = %if.end44
  %32 = load i32, ptr %wrapped_x, align 4
  %cmp48 = icmp sge i32 %32, 50
  br i1 %cmp48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.else47
  store i32 0, ptr %wrapped_x, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %if.else47
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then46
  %33 = load i32, ptr %wrapped_y, align 4
  %cmp52 = icmp slt i32 %33, 0
  br i1 %cmp52, label %if.then53, label %if.else54

if.then53:                                        ; preds = %if.end51
  store i32 24, ptr %wrapped_y, align 4
  br label %if.end58

if.else54:                                        ; preds = %if.end51
  %34 = load i32, ptr %wrapped_y, align 4
  %cmp55 = icmp sge i32 %34, 25
  br i1 %cmp55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %if.else54
  store i32 0, ptr %wrapped_y, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.then56, %if.else54
  br label %if.end58

if.end58:                                         ; preds = %if.end57, %if.then53
  %35 = load ptr, ptr %alive, align 4
  %36 = load i32, ptr %wrapped_y, align 4
  %mul59 = mul nsw i32 %36, 50
  %37 = load i32, ptr %wrapped_x, align 4
  %add60 = add nsw i32 %mul59, %37
  %arrayidx61 = getelementptr inbounds i32, ptr %35, i32 %add60
  %38 = load i32, ptr %arrayidx61, align 4
  %39 = load i32, ptr %n, align 4
  %add62 = add nsw i32 %39, %38
  store i32 %add62, ptr %n, align 4
  br label %for.inc63

for.inc63:                                        ; preds = %if.end58, %if.then43
  %40 = load i32, ptr %nx, align 4
  %inc64 = add nsw i32 %40, 1
  store i32 %inc64, ptr %nx, align 4
  br label %for.cond37, !llvm.loop !7

for.end65:                                        ; preds = %for.cond37
  br label %for.inc66

for.inc66:                                        ; preds = %for.end65
  %41 = load i32, ptr %ny, align 4
  %inc67 = add nsw i32 %41, 1
  store i32 %inc67, ptr %ny, align 4
  br label %for.cond32, !llvm.loop !8

for.end68:                                        ; preds = %for.cond32
  %42 = load ptr, ptr %alive, align 4
  %43 = load i32, ptr %y24, align 4
  %mul69 = mul nsw i32 %43, 50
  %44 = load i32, ptr %x28, align 4
  %add70 = add nsw i32 %mul69, %44
  %arrayidx71 = getelementptr inbounds i32, ptr %42, i32 %add70
  %45 = load i32, ptr %arrayidx71, align 4
  store i32 %45, ptr %current, align 4
  %46 = load i32, ptr %n, align 4
  %cmp72 = icmp eq i32 %46, 3
  br i1 %cmp72, label %if.then73, label %if.else77

if.then73:                                        ; preds = %for.end68
  %47 = load ptr, ptr %alive_next, align 4
  %48 = load i32, ptr %y24, align 4
  %mul74 = mul nsw i32 %48, 50
  %49 = load i32, ptr %x28, align 4
  %add75 = add nsw i32 %mul74, %49
  %arrayidx76 = getelementptr inbounds i32, ptr %47, i32 %add75
  store i32 1, ptr %arrayidx76, align 4
  br label %if.end90

if.else77:                                        ; preds = %for.end68
  %50 = load i32, ptr %n, align 4
  %cmp78 = icmp eq i32 %50, 2
  br i1 %cmp78, label %land.lhs.true79, label %if.else85

land.lhs.true79:                                  ; preds = %if.else77
  %51 = load i32, ptr %current, align 4
  %tobool80 = icmp ne i32 %51, 0
  br i1 %tobool80, label %if.then81, label %if.else85

if.then81:                                        ; preds = %land.lhs.true79
  %52 = load ptr, ptr %alive_next, align 4
  %53 = load i32, ptr %y24, align 4
  %mul82 = mul nsw i32 %53, 50
  %54 = load i32, ptr %x28, align 4
  %add83 = add nsw i32 %mul82, %54
  %arrayidx84 = getelementptr inbounds i32, ptr %52, i32 %add83
  store i32 1, ptr %arrayidx84, align 4
  br label %if.end89

if.else85:                                        ; preds = %land.lhs.true79, %if.else77
  %55 = load ptr, ptr %alive_next, align 4
  %56 = load i32, ptr %y24, align 4
  %mul86 = mul nsw i32 %56, 50
  %57 = load i32, ptr %x28, align 4
  %add87 = add nsw i32 %mul86, %57
  %arrayidx88 = getelementptr inbounds i32, ptr %55, i32 %add87
  store i32 0, ptr %arrayidx88, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.else85, %if.then81
  br label %if.end90

if.end90:                                         ; preds = %if.end89, %if.then73
  br label %for.inc91

for.inc91:                                        ; preds = %if.end90
  %58 = load i32, ptr %x28, align 4
  %inc92 = add nsw i32 %58, 1
  store i32 %inc92, ptr %x28, align 4
  br label %for.cond29, !llvm.loop !9

for.end93:                                        ; preds = %for.cond29
  br label %for.inc94

for.inc94:                                        ; preds = %for.end93
  %59 = load i32, ptr %y24, align 4
  %inc95 = add nsw i32 %59, 1
  store i32 %inc95, ptr %y24, align 4
  br label %for.cond25, !llvm.loop !10

for.end96:                                        ; preds = %for.cond25
  %60 = load ptr, ptr %alive, align 4
  store ptr %60, ptr %tmp, align 4
  %61 = load ptr, ptr %alive_next, align 4
  store ptr %61, ptr %alive, align 4
  %62 = load ptr, ptr %tmp, align 4
  store ptr %62, ptr %alive_next, align 4
  br label %for.inc97

for.inc97:                                        ; preds = %for.end96
  %63 = load i32, ptr %s, align 4
  %inc98 = add nsw i32 %63, 1
  store i32 %inc98, ptr %s, align 4
  br label %for.cond8, !llvm.loop !11

for.end99:                                        ; preds = %for.cond8
  ret void
}

; Function Attrs: nounwind
declare void @llvm.arch52.putdisplaypixel(i32, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.arch52.flush() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 1}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 19.1.0 (https://github.com/llvm/llvm-project.git 6daae48d3962e0cb1b0c133043fbe86fd629a943)"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
!5 = distinct !{!5, !4}
!6 = distinct !{!6, !4}
!7 = distinct !{!7, !4}
!8 = distinct !{!8, !4}
!9 = distinct !{!9, !4}
!10 = distinct !{!10, !4}
!11 = distinct !{!11, !4}
