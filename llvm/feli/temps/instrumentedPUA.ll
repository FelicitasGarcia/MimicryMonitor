; ModuleID = '../../../llvm/feli/temps/programPUA.ll'
source_filename = "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/inputs/programPUA.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

%AutomatonTransition = type { ptr, ptr }
%AutomatonNode = type { ptr, ptr, ptr, i1, ptr, i32 }

@__stderrp = external global ptr, align 8
@.str = private unnamed_addr constant [21 x i8] c"usage: %s <integer>\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1, !dbg !7
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
@trans.target.2.then = private constant [2 x i8] c"8\00"
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
@trans.target.5.else = private constant [2 x i8] c"6\00"
@trans.type.5.then = private constant [5 x i8] c"then\00"
@trans.target.5.then = private constant [2 x i8] c"8\00"
@transitions.array.5 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.5.else, ptr @trans.target.5.else }, %AutomatonTransition { ptr @trans.type.5.then, ptr @trans.target.5.then }]
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
@trans.target.7.else = private constant [2 x i8] c"8\00"
@trans.type.7.then = private constant [5 x i8] c"then\00"
@trans.target.7.then = private constant [2 x i8] c"9\00"
@transitions.array.7 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.7.else, ptr @trans.target.7.else }, %AutomatonTransition { ptr @trans.type.7.then, ptr @trans.target.7.then }]
@id.str.8 = private constant [2 x i8] c"8\00"
@verdict.str.8 = private constant [2 x i8] c"V\00"
@condition.str.8 = private constant [1 x i8] zeroinitializer
@transitions.array.8 = private constant [0 x %AutomatonTransition] zeroinitializer
@id.str.9 = private constant [2 x i8] c"9\00"
@verdict.str.9 = private constant [3 x i8] c"IV\00"
@condition.str.9 = private constant [1 x i8] zeroinitializer
@transitions.array.9 = private constant [0 x %AutomatonTransition] zeroinitializer
@automatonArray = internal constant [8 x %AutomatonNode] [%AutomatonNode { ptr @id.str.1, ptr @verdict.str.1, ptr @condition.str.1, i1 false, ptr @transitions.array.1, i32 1 }, %AutomatonNode { ptr @id.str.2, ptr @verdict.str.2, ptr @condition.str.2, i1 false, ptr @transitions.array.2, i32 2 }, %AutomatonNode { ptr @id.str.3, ptr @verdict.str.3, ptr @condition.str.3, i1 false, ptr @transitions.array.3, i32 1 }, %AutomatonNode { ptr @id.str.5, ptr @verdict.str.5, ptr @condition.str.5, i1 false, ptr @transitions.array.5, i32 2 }, %AutomatonNode { ptr @id.str.6, ptr @verdict.str.6, ptr @condition.str.6, i1 false, ptr @transitions.array.6, i32 1 }, %AutomatonNode { ptr @id.str.7, ptr @verdict.str.7, ptr @condition.str.7, i1 false, ptr @transitions.array.7, i32 2 }, %AutomatonNode { ptr @id.str.8, ptr @verdict.str.8, ptr @condition.str.8, i1 true, ptr @transitions.array.8, i32 0 }, %AutomatonNode { ptr @id.str.9, ptr @verdict.str.9, ptr @condition.str.9, i1 true, ptr @transitions.array.9, i32 0 }]
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
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %8 = load i32, ptr %4, align 4, !dbg !34
  %9 = icmp slt i32 %8, 2, !dbg !36
  call void @monitorAction(ptr @.str.1.1), !dbg !37
  br i1 %9, label %monedge.then, label %monedge.else, !dbg !37

10:                                               ; preds = %monedge.then
  %11 = load ptr, ptr @__stderrp, align 8, !dbg !38
  %12 = load ptr, ptr %5, align 8, !dbg !40
  %13 = getelementptr inbounds ptr, ptr %12, i64 0, !dbg !40
  %14 = load ptr, ptr %13, align 8, !dbg !40
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str, ptr noundef %14), !dbg !41
  store i32 1, ptr %3, align 4, !dbg !42
  br label %38, !dbg !42

16:                                               ; preds = %monedge.else
  %17 = load ptr, ptr %5, align 8, !dbg !45
  %18 = getelementptr inbounds ptr, ptr %17, i64 1, !dbg !45
  %19 = load ptr, ptr %18, align 8, !dbg !45
  %20 = call i32 @atoi(ptr noundef %19), !dbg !46
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
  %30 = icmp slt i32 %29, 127, !dbg !63
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
  %36 = load i32, ptr %7, align 4, !dbg !68
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %36), !dbg !69
  store i32 0, ptr %3, align 4, !dbg !70
  br label %38, !dbg !70

38:                                               ; preds = %35, %10
  %39 = load i32, ptr %3, align 4, !dbg !71
  ret i32 %39, !dbg !71

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

declare i32 @atoi(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare void @monitorAction(ptr)

declare void @initAutomaton(ptr, i32, ptr)

declare void @setMonitorPolicy(ptr)

define internal void @automaton.init() {
entry:
  call void @setMonitorPolicy(ptr @0)
  call void @initAutomaton(ptr @automatonArray, i32 8, ptr @1)
  ret void
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.dbg.cu = !{!19}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 18, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "inputs/programPUA.c", directory: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli", checksumkind: CSK_MD5, checksum: "302d832180a5490277fc244a3ce29208")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 168, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 21)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 4)
!12 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!13 = !{i32 7, !"Dwarf Version", i32 5}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 8, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 1}
!19 = distinct !DICompileUnit(language: DW_LANG_C11, file: !20, producer: "Apple clang version 16.0.0 (clang-1600.0.26.6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !21, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk", sdk: "MacOSX.sdk")
!20 = !DIFile(filename: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/inputs/programPUA.c", directory: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "302d832180a5490277fc244a3ce29208")
!21 = !{!0, !7}
!22 = !{!"Apple clang version 16.0.0 (clang-1600.0.26.6)"}
!23 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 15, type: !24, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
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
!34 = !DILocation(line: 16, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !23, file: !2, line: 16, column: 9)
!36 = !DILocation(line: 16, column: 14, scope: !35)
!37 = !DILocation(line: 16, column: 9, scope: !23)
!38 = !DILocation(line: 18, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !2, line: 17, column: 5)
!40 = !DILocation(line: 18, column: 50, scope: !39)
!41 = !DILocation(line: 18, column: 9, scope: !39)
!42 = !DILocation(line: 19, column: 9, scope: !39)
!43 = !DILocalVariable(name: "n", scope: !23, file: !2, line: 21, type: !26)
!44 = !DILocation(line: 21, column: 9, scope: !23)
!45 = !DILocation(line: 21, column: 18, scope: !23)
!46 = !DILocation(line: 21, column: 13, scope: !23)
!47 = !DILocalVariable(name: "result", scope: !23, file: !2, line: 22, type: !26)
!48 = !DILocation(line: 22, column: 9, scope: !23)
!49 = !DILocation(line: 23, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !23, file: !2, line: 23, column: 9)
!51 = !DILocation(line: 23, column: 11, scope: !50)
!52 = !DILocation(line: 23, column: 9, scope: !23)
!53 = !DILocation(line: 24, column: 16, scope: !50)
!54 = !DILocation(line: 24, column: 9, scope: !50)
!55 = !DILocation(line: 25, column: 14, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !2, line: 25, column: 14)
!57 = !DILocation(line: 25, column: 16, scope: !56)
!58 = !DILocation(line: 25, column: 14, scope: !50)
!59 = !DILocation(line: 26, column: 16, scope: !56)
!60 = !DILocation(line: 26, column: 9, scope: !56)
!61 = !DILocation(line: 27, column: 14, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !2, line: 27, column: 14)
!63 = !DILocation(line: 27, column: 16, scope: !62)
!64 = !DILocation(line: 27, column: 14, scope: !56)
!65 = !DILocation(line: 28, column: 16, scope: !62)
!66 = !DILocation(line: 28, column: 9, scope: !62)
!67 = !DILocation(line: 30, column: 16, scope: !62)
!68 = !DILocation(line: 31, column: 20, scope: !23)
!69 = !DILocation(line: 31, column: 5, scope: !23)
!70 = !DILocation(line: 32, column: 5, scope: !23)
!71 = !DILocation(line: 33, column: 1, scope: !23)
