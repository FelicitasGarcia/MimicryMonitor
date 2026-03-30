; ModuleID = '../../../llvm/feli/temps/programPUA.ll'
source_filename = "/Users/felicitasgarcia/TESIS/mimicrymonitor/llvm/feli/inputs/programPUA.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%AutomatonTransition = type { ptr, ptr }
%AutomatonNode = type { ptr, ptr, ptr, i1, ptr, i32 }

@.str = private unnamed_addr constant [7 x i8] c"Error0\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [6 x i8] c"Error\00", align 1, !dbg !7
@id.str.1 = private constant [2 x i8] c"1\00"
@verdict.str.1 = private constant [3 x i8] c"NV\00"
@condition.str.1 = private constant [1 x i8] zeroinitializer
@trans.type.1.cond = private constant [5 x i8] c"cond\00"
@trans.target.1.cond = private constant [2 x i8] c"2\00"
@transitions.array.1 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.1.cond, ptr @trans.target.1.cond }]
@id.str.10 = private constant [3 x i8] c"10\00"
@verdict.str.10 = private constant [3 x i8] c"NV\00"
@condition.str.10 = private constant [1 x i8] zeroinitializer
@trans.type.10.else = private constant [5 x i8] c"else\00"
@trans.target.10.else = private constant [3 x i8] c"12\00"
@trans.type.10.then = private constant [5 x i8] c"then\00"
@trans.target.10.then = private constant [3 x i8] c"11\00"
@transitions.array.10 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.10.else, ptr @trans.target.10.else }, %AutomatonTransition { ptr @trans.type.10.then, ptr @trans.target.10.then }]
@id.str.11 = private constant [3 x i8] c"11\00"
@verdict.str.11 = private constant [2 x i8] c"V\00"
@condition.str.11 = private constant [1 x i8] zeroinitializer
@transitions.array.11 = private constant [0 x %AutomatonTransition] zeroinitializer
@id.str.12 = private constant [3 x i8] c"12\00"
@verdict.str.12 = private constant [3 x i8] c"IV\00"
@condition.str.12 = private constant [1 x i8] zeroinitializer
@transitions.array.12 = private constant [0 x %AutomatonTransition] zeroinitializer
@id.str.2 = private constant [2 x i8] c"2\00"
@verdict.str.2 = private constant [3 x i8] c"NV\00"
@condition.str.2 = private constant [1 x i8] zeroinitializer
@trans.type.2.else = private constant [5 x i8] c"else\00"
@trans.target.2.else = private constant [2 x i8] c"3\00"
@trans.type.2.then = private constant [5 x i8] c"then\00"
@trans.target.2.then = private constant [2 x i8] c"3\00"
@transitions.array.2 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.2.else, ptr @trans.target.2.else }, %AutomatonTransition { ptr @trans.type.2.then, ptr @trans.target.2.then }]
@id.str.3 = private constant [2 x i8] c"3\00"
@verdict.str.3 = private constant [3 x i8] c"NV\00"
@condition.str.3 = private constant [1 x i8] zeroinitializer
@trans.type.3.cond = private constant [5 x i8] c"cond\00"
@trans.target.3.cond = private constant [2 x i8] c"4\00"
@transitions.array.3 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.3.cond, ptr @trans.target.3.cond }]
@id.str.4 = private constant [2 x i8] c"4\00"
@verdict.str.4 = private constant [3 x i8] c"NV\00"
@condition.str.4 = private constant [1 x i8] zeroinitializer
@trans.type.4.else = private constant [5 x i8] c"else\00"
@trans.target.4.else = private constant [2 x i8] c"6\00"
@trans.type.4.then = private constant [5 x i8] c"then\00"
@trans.target.4.then = private constant [3 x i8] c"12\00"
@transitions.array.4 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.4.else, ptr @trans.target.4.else }, %AutomatonTransition { ptr @trans.type.4.then, ptr @trans.target.4.then }]
@id.str.6 = private constant [2 x i8] c"6\00"
@verdict.str.6 = private constant [3 x i8] c"NV\00"
@condition.str.6 = private constant [1 x i8] zeroinitializer
@trans.type.6.cond = private constant [5 x i8] c"cond\00"
@trans.target.6.cond = private constant [2 x i8] c"7\00"
@transitions.array.6 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.6.cond, ptr @trans.target.6.cond }]
@id.str.7 = private constant [2 x i8] c"7\00"
@verdict.str.7 = private constant [3 x i8] c"NV\00"
@condition.str.7 = private constant [1 x i8] zeroinitializer
@trans.type.7.else = private constant [5 x i8] c"else\00"
@trans.target.7.else = private constant [3 x i8] c"11\00"
@trans.type.7.then = private constant [5 x i8] c"then\00"
@trans.target.7.then = private constant [2 x i8] c"8\00"
@transitions.array.7 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.7.else, ptr @trans.target.7.else }, %AutomatonTransition { ptr @trans.type.7.then, ptr @trans.target.7.then }]
@id.str.8 = private constant [2 x i8] c"8\00"
@verdict.str.8 = private constant [3 x i8] c"NV\00"
@condition.str.8 = private constant [1 x i8] zeroinitializer
@trans.type.8.cond = private constant [5 x i8] c"cond\00"
@trans.target.8.cond = private constant [3 x i8] c"10\00"
@transitions.array.8 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.8.cond, ptr @trans.target.8.cond }]
@automatonArray = internal constant [10 x %AutomatonNode] [%AutomatonNode { ptr @id.str.1, ptr @verdict.str.1, ptr @condition.str.1, i1 false, ptr @transitions.array.1, i32 1 }, %AutomatonNode { ptr @id.str.10, ptr @verdict.str.10, ptr @condition.str.10, i1 false, ptr @transitions.array.10, i32 2 }, %AutomatonNode { ptr @id.str.11, ptr @verdict.str.11, ptr @condition.str.11, i1 true, ptr @transitions.array.11, i32 0 }, %AutomatonNode { ptr @id.str.12, ptr @verdict.str.12, ptr @condition.str.12, i1 true, ptr @transitions.array.12, i32 0 }, %AutomatonNode { ptr @id.str.2, ptr @verdict.str.2, ptr @condition.str.2, i1 false, ptr @transitions.array.2, i32 2 }, %AutomatonNode { ptr @id.str.3, ptr @verdict.str.3, ptr @condition.str.3, i1 false, ptr @transitions.array.3, i32 1 }, %AutomatonNode { ptr @id.str.4, ptr @verdict.str.4, ptr @condition.str.4, i1 false, ptr @transitions.array.4, i32 2 }, %AutomatonNode { ptr @id.str.6, ptr @verdict.str.6, ptr @condition.str.6, i1 false, ptr @transitions.array.6, i32 1 }, %AutomatonNode { ptr @id.str.7, ptr @verdict.str.7, ptr @condition.str.7, i1 false, ptr @transitions.array.7, i32 2 }, %AutomatonNode { ptr @id.str.8, ptr @verdict.str.8, ptr @condition.str.8, i1 false, ptr @transitions.array.8, i32 1 }]
@0 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 0, ptr @automaton.init, ptr null }]
@.str.1.1 = private constant [5 x i8] c"cond\00"
@.str.2 = private constant [5 x i8] c"then\00"
@.str.3 = private constant [5 x i8] c"else\00"
@.str.4 = private constant [5 x i8] c"cond\00"
@.str.5 = private constant [5 x i8] c"then\00"
@.str.6 = private constant [5 x i8] c"else\00"
@.str.7 = private constant [5 x i8] c"cond\00"
@.str.8 = private constant [5 x i8] c"then\00"
@.str.9 = private constant [5 x i8] c"else\00"
@.str.10 = private constant [5 x i8] c"cond\00"
@.str.11 = private constant [5 x i8] c"then\00"
@.str.12 = private constant [5 x i8] c"else\00"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !23 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !30, !DIExpression(), !31)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !32, !DIExpression(), !33)
    #dbg_declare(ptr %6, !34, !DIExpression(), !35)
  store i32 10, ptr %6, align 4, !dbg !35
    #dbg_declare(ptr %7, !36, !DIExpression(), !37)
  %9 = load ptr, ptr %5, align 8, !dbg !38
  %10 = getelementptr inbounds ptr, ptr %9, i64 1, !dbg !38
  %11 = load ptr, ptr %10, align 8, !dbg !38
  %12 = icmp ne ptr %11, null, !dbg !38
  call void @monitorAction(ptr @.str.1.1), !dbg !38
  br i1 %12, label %monedge.then, label %monedge.else, !dbg !38

13:                                               ; preds = %monedge.then
  %14 = load ptr, ptr %5, align 8, !dbg !39
  %15 = getelementptr inbounds ptr, ptr %14, i64 1, !dbg !39
  %16 = load ptr, ptr %15, align 8, !dbg !39
  %17 = call i32 @atoi(ptr noundef %16), !dbg !40
  br label %19, !dbg !38

18:                                               ; preds = %monedge.else
  br label %19, !dbg !38

19:                                               ; preds = %18, %13
  %20 = phi i32 [ %17, %13 ], [ 0, %18 ], !dbg !38
  store i32 %20, ptr %7, align 4, !dbg !37
    #dbg_declare(ptr %8, !41, !DIExpression(), !42)
  store i32 0, ptr %8, align 4, !dbg !42
  %21 = load i32, ptr %7, align 4, !dbg !43
  %22 = call zeroext i1 @Cond0(i32 noundef %21), !dbg !45
  call void @monitorAction(ptr @.str.4), !dbg !45
  br i1 %22, label %monedge.then1, label %monedge.else2, !dbg !45

23:                                               ; preds = %monedge.then1
  call void @logMessage(ptr noundef @.str), !dbg !46
  br label %44, !dbg !48

24:                                               ; preds = %monedge.else2
  %25 = load i32, ptr %7, align 4, !dbg !49
  %26 = call zeroext i1 @Cond1(i32 noundef %25), !dbg !52
  call void @monitorAction(ptr @.str.7), !dbg !52
  br i1 %26, label %monedge.then3, label %monedge.else4, !dbg !52

27:                                               ; preds = %monedge.then3
  %28 = load i32, ptr %7, align 4, !dbg !53
  %29 = call i32 @AComputation(i32 noundef %28), !dbg !55
  store i32 %29, ptr %8, align 4, !dbg !56
  %30 = load i32, ptr %8, align 4, !dbg !57
  %31 = call zeroext i1 @Cond(i32 noundef %30), !dbg !59
  call void @monitorAction(ptr @.str.10), !dbg !59
  br i1 %31, label %monedge.then5, label %monedge.else6, !dbg !59

32:                                               ; preds = %monedge.then5
  %33 = load i32, ptr %7, align 4, !dbg !60
  %34 = load i32, ptr %8, align 4, !dbg !62
  %35 = call i32 @HeavyRComputation(i32 noundef %33, i32 noundef %34), !dbg !63
  store i32 %35, ptr %6, align 4, !dbg !64
  br label %40, !dbg !65

36:                                               ; preds = %monedge.else6
  %37 = load i32, ptr %7, align 4, !dbg !66
  %38 = load i32, ptr %8, align 4, !dbg !68
  %39 = call i32 @ChangedRComputation(i32 noundef %37, i32 noundef %38), !dbg !69
  store i32 %39, ptr %6, align 4, !dbg !70
  br label %40

40:                                               ; preds = %36, %32
  br label %42, !dbg !71

41:                                               ; preds = %monedge.else4
  call void @logMessage(ptr noundef @.str.1), !dbg !72
  br label %42

42:                                               ; preds = %41, %40
  %43 = load i32, ptr %6, align 4, !dbg !74
  call void @logValue(i32 noundef %43), !dbg !75
  br label %44

44:                                               ; preds = %42, %23
  %45 = load i32, ptr %6, align 4, !dbg !76
  ret i32 %45, !dbg !77

monedge.then:                                     ; preds = %2
  call void @monitorAction(ptr @.str.2)
  br label %13

monedge.else:                                     ; preds = %2
  call void @monitorAction(ptr @.str.3)
  br label %18

monedge.then1:                                    ; preds = %19
  call void @monitorAction(ptr @.str.5)
  br label %23

monedge.else2:                                    ; preds = %19
  call void @monitorAction(ptr @.str.6)
  br label %24

monedge.then3:                                    ; preds = %24
  call void @monitorAction(ptr @.str.8)
  br label %27

monedge.else4:                                    ; preds = %24
  call void @monitorAction(ptr @.str.9)
  br label %41

monedge.then5:                                    ; preds = %27
  call void @monitorAction(ptr @.str.11)
  br label %32

monedge.else6:                                    ; preds = %27
  call void @monitorAction(ptr @.str.12)
  br label %36
}

declare i32 @atoi(ptr noundef) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond0(i32 noundef %0) #0 !dbg !78 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !82, !DIExpression(), !83)
  %3 = load i32, ptr %2, align 4, !dbg !84
  %4 = icmp sgt i32 %3, 0, !dbg !85
  ret i1 %4, !dbg !86
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @logMessage(ptr noundef %0) #0 !dbg !87 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !92, !DIExpression(), !93)
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond1(i32 noundef %0) #0 !dbg !95 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !96, !DIExpression(), !97)
  %3 = load i32, ptr %2, align 4, !dbg !98
  %4 = call zeroext i1 @isEven(i32 noundef %3), !dbg !99
  ret i1 %4, !dbg !100
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @AComputation(i32 noundef %0) #0 !dbg !101 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !104, !DIExpression(), !105)
  %3 = load i32, ptr %2, align 4, !dbg !106
  %4 = mul nsw i32 %3, 2, !dbg !107
  ret i32 %4, !dbg !108
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond(i32 noundef %0) #0 !dbg !109 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !110, !DIExpression(), !111)
  %3 = load i32, ptr %2, align 4, !dbg !112
  %4 = icmp slt i32 %3, 0, !dbg !113
  ret i1 %4, !dbg !114
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @HeavyRComputation(i32 noundef %0, i32 noundef %1) #0 !dbg !115 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !118, !DIExpression(), !119)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !120, !DIExpression(), !121)
  %5 = load i32, ptr %3, align 4, !dbg !122
  %6 = load i32, ptr %4, align 4, !dbg !123
  %7 = add nsw i32 %5, %6, !dbg !124
  ret i32 %7, !dbg !125
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @ChangedRComputation(i32 noundef %0, i32 noundef %1) #0 !dbg !126 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !127, !DIExpression(), !128)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !129, !DIExpression(), !130)
  %5 = load i32, ptr %3, align 4, !dbg !131
  %6 = load i32, ptr %4, align 4, !dbg !132
  %7 = sub nsw i32 %5, %6, !dbg !133
  ret i32 %7, !dbg !134
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @logValue(i32 noundef %0) #0 !dbg !135 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !138, !DIExpression(), !139)
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @isEven(i32 noundef %0) #0 !dbg !141 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !142, !DIExpression(), !143)
  %3 = load i32, ptr %2, align 4, !dbg !144
  %4 = srem i32 %3, 2, !dbg !145
  %5 = icmp eq i32 %4, 0, !dbg !146
  ret i1 %5, !dbg !147
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @PredR(i32 noundef %0, i32 noundef %1) #0 !dbg !148 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !151, !DIExpression(), !152)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !153, !DIExpression(), !154)
  %5 = load i32, ptr %3, align 4, !dbg !155
  %6 = load i32, ptr %4, align 4, !dbg !156
  %7 = icmp sgt i32 %5, %6, !dbg !157
  ret i1 %7, !dbg !158
}

declare void @monitorAction(ptr)

declare void @initAutomaton(ptr, i32, ptr)

declare void @setMonitorPolicy(ptr)

define internal void @automaton.init() {
entry:
  call void @setMonitorPolicy(ptr @0)
  call void @initAutomaton(ptr @automatonArray, i32 10, ptr @1)
  ret void
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.dbg.cu = !{!19}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "inputs/programPUA.c", directory: "/Users/felicitasgarcia/TESIS/mimicrymonitor/llvm/feli", checksumkind: CSK_MD5, checksum: "abcb0053acb7df581a7e58968bb3ee81")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 7)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 37, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 6)
!12 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!13 = !{i32 7, !"Dwarf Version", i32 5}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 8, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 1}
!19 = distinct !DICompileUnit(language: DW_LANG_C11, file: !20, producer: "Homebrew clang version 20.1.3", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !21, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!20 = !DIFile(filename: "/Users/felicitasgarcia/TESIS/mimicrymonitor/llvm/feli/inputs/programPUA.c", directory: "/Users/felicitasgarcia/TESIS/mimicrymonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "abcb0053acb7df581a7e58968bb3ee81")
!21 = !{!0, !7}
!22 = !{!"Homebrew clang version 20.1.3"}
!23 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 17, type: !24, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !26, !27}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!29 = !{}
!30 = !DILocalVariable(name: "argc", arg: 1, scope: !23, file: !2, line: 17, type: !26)
!31 = !DILocation(line: 17, column: 14, scope: !23)
!32 = !DILocalVariable(name: "argv", arg: 2, scope: !23, file: !2, line: 17, type: !27)
!33 = !DILocation(line: 17, column: 26, scope: !23)
!34 = !DILocalVariable(name: "R", scope: !23, file: !2, line: 19, type: !26)
!35 = !DILocation(line: 19, column: 9, scope: !23)
!36 = !DILocalVariable(name: "P", scope: !23, file: !2, line: 21, type: !26)
!37 = !DILocation(line: 21, column: 9, scope: !23)
!38 = !DILocation(line: 21, column: 13, scope: !23)
!39 = !DILocation(line: 21, column: 28, scope: !23)
!40 = !DILocation(line: 21, column: 23, scope: !23)
!41 = !DILocalVariable(name: "A", scope: !23, file: !2, line: 23, type: !26)
!42 = !DILocation(line: 23, column: 9, scope: !23)
!43 = !DILocation(line: 26, column: 15, scope: !44)
!44 = distinct !DILexicalBlock(scope: !23, file: !2, line: 26, column: 9)
!45 = !DILocation(line: 26, column: 9, scope: !44)
!46 = !DILocation(line: 27, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !2, line: 26, column: 19)
!48 = !DILocation(line: 28, column: 5, scope: !47)
!49 = !DILocation(line: 29, column: 19, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !2, line: 29, column: 13)
!51 = distinct !DILexicalBlock(scope: !44, file: !2, line: 28, column: 12)
!52 = !DILocation(line: 29, column: 13, scope: !50)
!53 = !DILocation(line: 30, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !2, line: 29, column: 23)
!55 = !DILocation(line: 30, column: 17, scope: !54)
!56 = !DILocation(line: 30, column: 15, scope: !54)
!57 = !DILocation(line: 31, column: 22, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !2, line: 31, column: 17)
!59 = !DILocation(line: 31, column: 17, scope: !58)
!60 = !DILocation(line: 32, column: 39, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !2, line: 31, column: 26)
!62 = !DILocation(line: 32, column: 42, scope: !61)
!63 = !DILocation(line: 32, column: 21, scope: !61)
!64 = !DILocation(line: 32, column: 19, scope: !61)
!65 = !DILocation(line: 33, column: 13, scope: !61)
!66 = !DILocation(line: 34, column: 41, scope: !67)
!67 = distinct !DILexicalBlock(scope: !58, file: !2, line: 33, column: 20)
!68 = !DILocation(line: 34, column: 44, scope: !67)
!69 = !DILocation(line: 34, column: 21, scope: !67)
!70 = !DILocation(line: 34, column: 19, scope: !67)
!71 = !DILocation(line: 36, column: 9, scope: !54)
!72 = !DILocation(line: 37, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !50, file: !2, line: 36, column: 16)
!74 = !DILocation(line: 40, column: 18, scope: !51)
!75 = !DILocation(line: 40, column: 9, scope: !51)
!76 = !DILocation(line: 43, column: 12, scope: !23)
!77 = !DILocation(line: 43, column: 5, scope: !23)
!78 = distinct !DISubprogram(name: "Cond0", scope: !2, file: !2, line: 47, type: !79, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !26}
!81 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!82 = !DILocalVariable(name: "var0", arg: 1, scope: !78, file: !2, line: 47, type: !26)
!83 = !DILocation(line: 47, column: 16, scope: !78)
!84 = !DILocation(line: 48, column: 12, scope: !78)
!85 = !DILocation(line: 48, column: 17, scope: !78)
!86 = !DILocation(line: 48, column: 5, scope: !78)
!87 = distinct !DISubprogram(name: "logMessage", scope: !2, file: !2, line: 75, type: !88, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!88 = !DISubroutineType(types: !89)
!89 = !{null, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!92 = !DILocalVariable(name: "message", arg: 1, scope: !87, file: !2, line: 75, type: !90)
!93 = !DILocation(line: 75, column: 29, scope: !87)
!94 = !DILocation(line: 77, column: 1, scope: !87)
!95 = distinct !DISubprogram(name: "Cond1", scope: !2, file: !2, line: 51, type: !79, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!96 = !DILocalVariable(name: "var0", arg: 1, scope: !95, file: !2, line: 51, type: !26)
!97 = !DILocation(line: 51, column: 16, scope: !95)
!98 = !DILocation(line: 52, column: 19, scope: !95)
!99 = !DILocation(line: 52, column: 12, scope: !95)
!100 = !DILocation(line: 52, column: 5, scope: !95)
!101 = distinct !DISubprogram(name: "AComputation", scope: !2, file: !2, line: 59, type: !102, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!102 = !DISubroutineType(types: !103)
!103 = !{!26, !26}
!104 = !DILocalVariable(name: "var0", arg: 1, scope: !101, file: !2, line: 59, type: !26)
!105 = !DILocation(line: 59, column: 22, scope: !101)
!106 = !DILocation(line: 60, column: 12, scope: !101)
!107 = !DILocation(line: 60, column: 17, scope: !101)
!108 = !DILocation(line: 60, column: 5, scope: !101)
!109 = distinct !DISubprogram(name: "Cond", scope: !2, file: !2, line: 63, type: !79, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!110 = !DILocalVariable(name: "var0", arg: 1, scope: !109, file: !2, line: 63, type: !26)
!111 = !DILocation(line: 63, column: 15, scope: !109)
!112 = !DILocation(line: 64, column: 12, scope: !109)
!113 = !DILocation(line: 64, column: 17, scope: !109)
!114 = !DILocation(line: 64, column: 5, scope: !109)
!115 = distinct !DISubprogram(name: "HeavyRComputation", scope: !2, file: !2, line: 67, type: !116, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!116 = !DISubroutineType(types: !117)
!117 = !{!26, !26, !26}
!118 = !DILocalVariable(name: "var0", arg: 1, scope: !115, file: !2, line: 67, type: !26)
!119 = !DILocation(line: 67, column: 27, scope: !115)
!120 = !DILocalVariable(name: "var1", arg: 2, scope: !115, file: !2, line: 67, type: !26)
!121 = !DILocation(line: 67, column: 37, scope: !115)
!122 = !DILocation(line: 68, column: 12, scope: !115)
!123 = !DILocation(line: 68, column: 19, scope: !115)
!124 = !DILocation(line: 68, column: 17, scope: !115)
!125 = !DILocation(line: 68, column: 5, scope: !115)
!126 = distinct !DISubprogram(name: "ChangedRComputation", scope: !2, file: !2, line: 71, type: !116, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!127 = !DILocalVariable(name: "var0", arg: 1, scope: !126, file: !2, line: 71, type: !26)
!128 = !DILocation(line: 71, column: 29, scope: !126)
!129 = !DILocalVariable(name: "var1", arg: 2, scope: !126, file: !2, line: 71, type: !26)
!130 = !DILocation(line: 71, column: 39, scope: !126)
!131 = !DILocation(line: 72, column: 12, scope: !126)
!132 = !DILocation(line: 72, column: 19, scope: !126)
!133 = !DILocation(line: 72, column: 17, scope: !126)
!134 = !DILocation(line: 72, column: 5, scope: !126)
!135 = distinct !DISubprogram(name: "logValue", scope: !2, file: !2, line: 79, type: !136, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!136 = !DISubroutineType(types: !137)
!137 = !{null, !26}
!138 = !DILocalVariable(name: "value", arg: 1, scope: !135, file: !2, line: 79, type: !26)
!139 = !DILocation(line: 79, column: 19, scope: !135)
!140 = !DILocation(line: 81, column: 1, scope: !135)
!141 = distinct !DISubprogram(name: "isEven", scope: !2, file: !2, line: 55, type: !79, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!142 = !DILocalVariable(name: "var0", arg: 1, scope: !141, file: !2, line: 55, type: !26)
!143 = !DILocation(line: 55, column: 17, scope: !141)
!144 = !DILocation(line: 56, column: 12, scope: !141)
!145 = !DILocation(line: 56, column: 17, scope: !141)
!146 = !DILocation(line: 56, column: 21, scope: !141)
!147 = !DILocation(line: 56, column: 5, scope: !141)
!148 = distinct !DISubprogram(name: "PredR", scope: !2, file: !2, line: 83, type: !149, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!149 = !DISubroutineType(types: !150)
!150 = !{!81, !26, !26}
!151 = !DILocalVariable(name: "var0", arg: 1, scope: !148, file: !2, line: 83, type: !26)
!152 = !DILocation(line: 83, column: 16, scope: !148)
!153 = !DILocalVariable(name: "var1", arg: 2, scope: !148, file: !2, line: 83, type: !26)
!154 = !DILocation(line: 83, column: 26, scope: !148)
!155 = !DILocation(line: 84, column: 12, scope: !148)
!156 = !DILocation(line: 84, column: 19, scope: !148)
!157 = !DILocation(line: 84, column: 17, scope: !148)
!158 = !DILocation(line: 84, column: 5, scope: !148)
