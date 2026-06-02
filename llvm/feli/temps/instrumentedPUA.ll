; ModuleID = '../../../llvm/feli/temps/programPUA.ll'
source_filename = "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/programPUA.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%AutomatonTransition = type { ptr, ptr }
%AutomatonNode = type { ptr, ptr, ptr, i1, ptr, i32 }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [21 x i8] c"usage: %s <integer>\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [9 x i8] c"finished\00", align 1, !dbg !7
@id.str.1 = private constant [2 x i8] c"1\00"
@verdict.str.1 = private constant [3 x i8] c"NV\00"
@condition.str.1 = private constant [1 x i8] zeroinitializer
@trans.type.1.cond = private constant [5 x i8] c"cond\00"
@trans.target.1.cond = private constant [2 x i8] c"2\00"
@transitions.array.1 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.1.cond, ptr @trans.target.1.cond }]
@id.str.2 = private constant [2 x i8] c"2\00"
@verdict.str.2 = private constant [3 x i8] c"NV\00"
@condition.str.2 = private constant [1 x i8] zeroinitializer
@trans.type.2.else = private constant [5 x i8] c"else\00"
@trans.target.2.else = private constant [2 x i8] c"3\00"
@trans.type.2.then = private constant [5 x i8] c"then\00"
@trans.target.2.then = private constant [2 x i8] c"6\00"
@transitions.array.2 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.2.else, ptr @trans.target.2.else }, %AutomatonTransition { ptr @trans.type.2.then, ptr @trans.target.2.then }]
@id.str.3 = private constant [2 x i8] c"3\00"
@verdict.str.3 = private constant [3 x i8] c"NV\00"
@condition.str.3 = private constant [1 x i8] zeroinitializer
@trans.type.3.cond = private constant [5 x i8] c"cond\00"
@trans.target.3.cond = private constant [2 x i8] c"5\00"
@transitions.array.3 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.3.cond, ptr @trans.target.3.cond }]
@id.str.5 = private constant [2 x i8] c"5\00"
@verdict.str.5 = private constant [3 x i8] c"NV\00"
@condition.str.5 = private constant [1 x i8] zeroinitializer
@trans.type.5.else = private constant [5 x i8] c"else\00"
@trans.target.5.else = private constant [2 x i8] c"7\00"
@trans.type.5.then = private constant [5 x i8] c"then\00"
@trans.target.5.then = private constant [2 x i8] c"6\00"
@transitions.array.5 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.5.else, ptr @trans.target.5.else }, %AutomatonTransition { ptr @trans.type.5.then, ptr @trans.target.5.then }]
@id.str.6 = private constant [2 x i8] c"6\00"
@verdict.str.6 = private constant [2 x i8] c"V\00"
@condition.str.6 = private constant [1 x i8] zeroinitializer
@transitions.array.6 = private constant [0 x %AutomatonTransition] zeroinitializer
@id.str.7 = private constant [2 x i8] c"7\00"
@verdict.str.7 = private constant [3 x i8] c"IV\00"
@condition.str.7 = private constant [1 x i8] zeroinitializer
@transitions.array.7 = private constant [0 x %AutomatonTransition] zeroinitializer
@automatonArray = internal constant [6 x %AutomatonNode] [%AutomatonNode { ptr @id.str.1, ptr @verdict.str.1, ptr @condition.str.1, i1 false, ptr @transitions.array.1, i32 1 }, %AutomatonNode { ptr @id.str.2, ptr @verdict.str.2, ptr @condition.str.2, i1 false, ptr @transitions.array.2, i32 2 }, %AutomatonNode { ptr @id.str.3, ptr @verdict.str.3, ptr @condition.str.3, i1 false, ptr @transitions.array.3, i32 1 }, %AutomatonNode { ptr @id.str.5, ptr @verdict.str.5, ptr @condition.str.5, i1 false, ptr @transitions.array.5, i32 2 }, %AutomatonNode { ptr @id.str.6, ptr @verdict.str.6, ptr @condition.str.6, i1 true, ptr @transitions.array.6, i32 0 }, %AutomatonNode { ptr @id.str.7, ptr @verdict.str.7, ptr @condition.str.7, i1 true, ptr @transitions.array.7, i32 0 }]
@0 = private unnamed_addr constant [8 x i8] c"stop-iv\00", align 1
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !23 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %8 = load i32, ptr %4, align 4, !dbg !34
  %9 = icmp slt i32 %8, 2, !dbg !36
  call void @monitorAction(ptr @.str.1.1), !dbg !37
  br i1 %9, label %monedge.then, label %monedge.else, !dbg !37

10:                                               ; preds = %monedge.then
  %11 = load ptr, ptr @stderr, align 8, !dbg !38
  %12 = load ptr, ptr %5, align 8, !dbg !40
  %13 = getelementptr inbounds ptr, ptr %12, i64 0, !dbg !40
  %14 = load ptr, ptr %13, align 8, !dbg !40
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str, ptr noundef %14), !dbg !41
  store i32 1, ptr %3, align 4, !dbg !42
  br label %37, !dbg !42

16:                                               ; preds = %monedge.else
  %17 = load ptr, ptr %5, align 8, !dbg !45
  %18 = getelementptr inbounds ptr, ptr %17, i64 1, !dbg !45
  %19 = load ptr, ptr %18, align 8, !dbg !45
  %20 = call i32 @atoi(ptr noundef %19) #3, !dbg !46
  store i32 %20, ptr %6, align 4, !dbg !44
  %21 = load i32, ptr %6, align 4, !dbg !49
  %22 = icmp slt i32 %21, 0, !dbg !51
  call void @monitorAction(ptr @.str.4), !dbg !52
  br i1 %22, label %monedge.then1, label %monedge.else2, !dbg !52

23:                                               ; preds = %monedge.then1
  store i32 -1, ptr %7, align 4, !dbg !53
  br label %35, !dbg !54

24:                                               ; preds = %monedge.else2
  %25 = load i32, ptr %6, align 4, !dbg !55
  %26 = icmp eq i32 %25, 0, !dbg !57
  call void @monitorAction(ptr @.str.7), !dbg !58
  br i1 %26, label %monedge.then3, label %monedge.else4, !dbg !58

27:                                               ; preds = %monedge.then3
  store i32 0, ptr %7, align 4, !dbg !59
  br label %34, !dbg !60

28:                                               ; preds = %monedge.else4
  %29 = load i32, ptr %6, align 4, !dbg !61
  %30 = icmp slt i32 %29, 128, !dbg !63
  call void @monitorAction(ptr @.str.10), !dbg !64
  br i1 %30, label %monedge.then5, label %monedge.else6, !dbg !64

31:                                               ; preds = %monedge.then5
  store i32 1, ptr %7, align 4, !dbg !65
  br label %33, !dbg !66

32:                                               ; preds = %monedge.else6
  store i32 2, ptr %7, align 4, !dbg !67
  br label %33

33:                                               ; preds = %32, %31
  br label %34

34:                                               ; preds = %33, %27
  br label %35

35:                                               ; preds = %34, %23
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.1), !dbg !68
  br label %37, !dbg !69

37:                                               ; preds = %35, %10
  %38 = load i32, ptr %3, align 4, !dbg !69
  ret i32 %38, !dbg !69

monedge.then:                                     ; preds = %2
  call void @monitorAction(ptr @.str.2)
  br label %10

monedge.else:                                     ; preds = %2
  call void @monitorAction(ptr @.str.3)
  br label %16

monedge.then1:                                    ; preds = %16
  call void @monitorAction(ptr @.str.5)
  br label %23

monedge.else2:                                    ; preds = %16
  call void @monitorAction(ptr @.str.6)
  br label %24

monedge.then3:                                    ; preds = %24
  call void @monitorAction(ptr @.str.8)
  br label %27

monedge.else4:                                    ; preds = %24
  call void @monitorAction(ptr @.str.9)
  br label %28

monedge.then5:                                    ; preds = %28
  call void @monitorAction(ptr @.str.11)
  br label %31

monedge.else6:                                    ; preds = %28
  call void @monitorAction(ptr @.str.12)
  br label %32
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #1

declare void @monitorAction(ptr)

declare void @initAutomaton(ptr, i32, ptr)

declare void @setMonitorPolicy(ptr)

define internal void @automaton.init() {
entry:
  call void @setMonitorPolicy(ptr @0)
  call void @initAutomaton(ptr @automatonArray, i32 6, ptr @1)
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 19, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "inputs/programPUA.c", directory: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli", checksumkind: CSK_MD5, checksum: "e182238dae2642a122bf1db7134981cf")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 168, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 21)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 9)
!12 = distinct !DICompileUnit(language: DW_LANG_C11, file: !13, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !14, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/programPUA.c", directory: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "e182238dae2642a122bf1db7134981cf")
!14 = !{!0, !7}
!15 = !{i32 7, !"Dwarf Version", i32 5}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 8, !"PIC Level", i32 2}
!19 = !{i32 7, !"PIE Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 2}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!23 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 15, type: !24, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !29)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !26, !27}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!29 = !{}
!30 = !DILocalVariable(name: "argc", arg: 1, scope: !23, file: !2, line: 15, type: !26)
!31 = !DILocation(line: 15, column: 14, scope: !23)
!32 = !DILocalVariable(name: "argv", arg: 2, scope: !23, file: !2, line: 15, type: !27)
!33 = !DILocation(line: 15, column: 26, scope: !23)
!34 = !DILocation(line: 17, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !23, file: !2, line: 17, column: 9)
!36 = !DILocation(line: 17, column: 14, scope: !35)
!37 = !DILocation(line: 17, column: 9, scope: !23)
!38 = !DILocation(line: 19, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !2, line: 18, column: 5)
!40 = !DILocation(line: 19, column: 50, scope: !39)
!41 = !DILocation(line: 19, column: 9, scope: !39)
!42 = !DILocation(line: 20, column: 9, scope: !39)
!43 = !DILocalVariable(name: "n", scope: !23, file: !2, line: 22, type: !26)
!44 = !DILocation(line: 22, column: 9, scope: !23)
!45 = !DILocation(line: 22, column: 18, scope: !23)
!46 = !DILocation(line: 22, column: 13, scope: !23)
!47 = !DILocalVariable(name: "result", scope: !23, file: !2, line: 23, type: !26)
!48 = !DILocation(line: 23, column: 9, scope: !23)
!49 = !DILocation(line: 24, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !23, file: !2, line: 24, column: 9)
!51 = !DILocation(line: 24, column: 11, scope: !50)
!52 = !DILocation(line: 24, column: 9, scope: !23)
!53 = !DILocation(line: 25, column: 16, scope: !50)
!54 = !DILocation(line: 25, column: 9, scope: !50)
!55 = !DILocation(line: 26, column: 14, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !2, line: 26, column: 14)
!57 = !DILocation(line: 26, column: 16, scope: !56)
!58 = !DILocation(line: 26, column: 14, scope: !50)
!59 = !DILocation(line: 27, column: 16, scope: !56)
!60 = !DILocation(line: 27, column: 9, scope: !56)
!61 = !DILocation(line: 28, column: 14, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !2, line: 28, column: 14)
!63 = !DILocation(line: 28, column: 16, scope: !62)
!64 = !DILocation(line: 28, column: 14, scope: !56)
!65 = !DILocation(line: 29, column: 16, scope: !62)
!66 = !DILocation(line: 29, column: 9, scope: !62)
!67 = !DILocation(line: 31, column: 16, scope: !62)
!68 = !DILocation(line: 32, column: 5, scope: !23)
!69 = !DILocation(line: 33, column: 1, scope: !23)
