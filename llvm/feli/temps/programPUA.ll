; ModuleID = '/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/inputs/programPUA.c'
source_filename = "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/inputs/programPUA.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

@.str = private unnamed_addr constant [7 x i8] c"Error0\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [6 x i8] c"Error\00", align 1, !dbg !7

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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !30, metadata !DIExpression()), !dbg !31
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata ptr %6, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 10, ptr %6, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata ptr %7, metadata !36, metadata !DIExpression()), !dbg !37
  %9 = load ptr, ptr %5, align 8, !dbg !38
  %10 = getelementptr inbounds ptr, ptr %9, i64 1, !dbg !38
  %11 = load ptr, ptr %10, align 8, !dbg !38
  %12 = icmp ne ptr %11, null, !dbg !38
  br i1 %12, label %13, label %18, !dbg !38

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8, !dbg !39
  %15 = getelementptr inbounds ptr, ptr %14, i64 1, !dbg !39
  %16 = load ptr, ptr %15, align 8, !dbg !39
  %17 = call i32 @atoi(ptr noundef %16), !dbg !40
  br label %19, !dbg !38

18:                                               ; preds = %2
  br label %19, !dbg !38

19:                                               ; preds = %18, %13
  %20 = phi i32 [ %17, %13 ], [ 0, %18 ], !dbg !38
  store i32 %20, ptr %7, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata ptr %8, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 0, ptr %8, align 4, !dbg !42
  %21 = load i32, ptr %7, align 4, !dbg !43
  %22 = call zeroext i1 @Cond0(i32 noundef %21), !dbg !45
  br i1 %22, label %23, label %24, !dbg !46

23:                                               ; preds = %19
  call void @logMessage(ptr noundef @.str), !dbg !47
  br label %44, !dbg !49

24:                                               ; preds = %19
  %25 = load i32, ptr %7, align 4, !dbg !50
  %26 = call zeroext i1 @Cond1(i32 noundef %25), !dbg !53
  br i1 %26, label %27, label %41, !dbg !54

27:                                               ; preds = %24
  %28 = load i32, ptr %7, align 4, !dbg !55
  %29 = call i32 @AComputation(i32 noundef %28), !dbg !57
  store i32 %29, ptr %8, align 4, !dbg !58
  %30 = load i32, ptr %8, align 4, !dbg !59
  %31 = call zeroext i1 @Cond(i32 noundef %30), !dbg !61
  br i1 %31, label %32, label %36, !dbg !62

32:                                               ; preds = %27
  %33 = load i32, ptr %7, align 4, !dbg !63
  %34 = load i32, ptr %8, align 4, !dbg !65
  %35 = call i32 @HeavyRComputation(i32 noundef %33, i32 noundef %34), !dbg !66
  store i32 %35, ptr %6, align 4, !dbg !67
  br label %40, !dbg !68

36:                                               ; preds = %27
  %37 = load i32, ptr %7, align 4, !dbg !69
  %38 = load i32, ptr %8, align 4, !dbg !71
  %39 = call i32 @ChangedRComputation(i32 noundef %37, i32 noundef %38), !dbg !72
  store i32 %39, ptr %6, align 4, !dbg !73
  br label %40

40:                                               ; preds = %36, %32
  br label %42, !dbg !74

41:                                               ; preds = %24
  call void @logMessage(ptr noundef @.str.1), !dbg !75
  br label %42

42:                                               ; preds = %41, %40
  %43 = load i32, ptr %6, align 4, !dbg !77
  call void @logValue(i32 noundef %43), !dbg !78
  br label %44

44:                                               ; preds = %42, %23
  %45 = load i32, ptr %6, align 4, !dbg !79
  ret i32 %45, !dbg !80
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @atoi(ptr noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond0(i32 noundef %0) #0 !dbg !81 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !85, metadata !DIExpression()), !dbg !86
  %3 = load i32, ptr %2, align 4, !dbg !87
  %4 = icmp sgt i32 %3, 0, !dbg !88
  ret i1 %4, !dbg !89
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @logMessage(ptr noundef %0) #0 !dbg !90 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !95, metadata !DIExpression()), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond1(i32 noundef %0) #0 !dbg !98 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !99, metadata !DIExpression()), !dbg !100
  %3 = load i32, ptr %2, align 4, !dbg !101
  %4 = call zeroext i1 @isEven(i32 noundef %3), !dbg !102
  ret i1 %4, !dbg !103
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @AComputation(i32 noundef %0) #0 !dbg !104 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !107, metadata !DIExpression()), !dbg !108
  %3 = load i32, ptr %2, align 4, !dbg !109
  %4 = mul nsw i32 %3, 2, !dbg !110
  ret i32 %4, !dbg !111
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond(i32 noundef %0) #0 !dbg !112 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !113, metadata !DIExpression()), !dbg !114
  %3 = load i32, ptr %2, align 4, !dbg !115
  %4 = icmp slt i32 %3, 0, !dbg !116
  ret i1 %4, !dbg !117
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @HeavyRComputation(i32 noundef %0, i32 noundef %1) #0 !dbg !118 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !121, metadata !DIExpression()), !dbg !122
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !123, metadata !DIExpression()), !dbg !124
  %5 = load i32, ptr %3, align 4, !dbg !125
  %6 = load i32, ptr %4, align 4, !dbg !126
  %7 = add nsw i32 %5, %6, !dbg !127
  ret i32 %7, !dbg !128
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @ChangedRComputation(i32 noundef %0, i32 noundef %1) #0 !dbg !129 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !130, metadata !DIExpression()), !dbg !131
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !132, metadata !DIExpression()), !dbg !133
  %5 = load i32, ptr %3, align 4, !dbg !134
  %6 = load i32, ptr %4, align 4, !dbg !135
  %7 = sub nsw i32 %5, %6, !dbg !136
  ret i32 %7, !dbg !137
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @logValue(i32 noundef %0) #0 !dbg !138 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !141, metadata !DIExpression()), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @isEven(i32 noundef %0) #0 !dbg !144 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !145, metadata !DIExpression()), !dbg !146
  %3 = load i32, ptr %2, align 4, !dbg !147
  %4 = srem i32 %3, 2, !dbg !148
  %5 = icmp eq i32 %4, 0, !dbg !149
  ret i1 %5, !dbg !150
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @PredR(i32 noundef %0, i32 noundef %1) #0 !dbg !151 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !154, metadata !DIExpression()), !dbg !155
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !156, metadata !DIExpression()), !dbg !157
  %5 = load i32, ptr %3, align 4, !dbg !158
  %6 = load i32, ptr %4, align 4, !dbg !159
  %7 = icmp sgt i32 %5, %6, !dbg !160
  ret i1 %7, !dbg !161
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.dbg.cu = !{!19}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "inputs/programPUA.c", directory: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli", checksumkind: CSK_MD5, checksum: "abcb0053acb7df581a7e58968bb3ee81")
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
!19 = distinct !DICompileUnit(language: DW_LANG_C11, file: !20, producer: "Apple clang version 16.0.0 (clang-1600.0.26.6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !21, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk", sdk: "MacOSX.sdk")
!20 = !DIFile(filename: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/inputs/programPUA.c", directory: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "abcb0053acb7df581a7e58968bb3ee81")
!21 = !{!0, !7}
!22 = !{!"Apple clang version 16.0.0 (clang-1600.0.26.6)"}
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
!46 = !DILocation(line: 26, column: 9, scope: !23)
!47 = !DILocation(line: 27, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !2, line: 26, column: 19)
!49 = !DILocation(line: 28, column: 5, scope: !48)
!50 = !DILocation(line: 29, column: 19, scope: !51)
!51 = distinct !DILexicalBlock(scope: !52, file: !2, line: 29, column: 13)
!52 = distinct !DILexicalBlock(scope: !44, file: !2, line: 28, column: 12)
!53 = !DILocation(line: 29, column: 13, scope: !51)
!54 = !DILocation(line: 29, column: 13, scope: !52)
!55 = !DILocation(line: 30, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !2, line: 29, column: 23)
!57 = !DILocation(line: 30, column: 17, scope: !56)
!58 = !DILocation(line: 30, column: 15, scope: !56)
!59 = !DILocation(line: 31, column: 22, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !2, line: 31, column: 17)
!61 = !DILocation(line: 31, column: 17, scope: !60)
!62 = !DILocation(line: 31, column: 17, scope: !56)
!63 = !DILocation(line: 32, column: 39, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !2, line: 31, column: 26)
!65 = !DILocation(line: 32, column: 42, scope: !64)
!66 = !DILocation(line: 32, column: 21, scope: !64)
!67 = !DILocation(line: 32, column: 19, scope: !64)
!68 = !DILocation(line: 33, column: 13, scope: !64)
!69 = !DILocation(line: 34, column: 41, scope: !70)
!70 = distinct !DILexicalBlock(scope: !60, file: !2, line: 33, column: 20)
!71 = !DILocation(line: 34, column: 44, scope: !70)
!72 = !DILocation(line: 34, column: 21, scope: !70)
!73 = !DILocation(line: 34, column: 19, scope: !70)
!74 = !DILocation(line: 36, column: 9, scope: !56)
!75 = !DILocation(line: 37, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !51, file: !2, line: 36, column: 16)
!77 = !DILocation(line: 40, column: 18, scope: !52)
!78 = !DILocation(line: 40, column: 9, scope: !52)
!79 = !DILocation(line: 43, column: 12, scope: !23)
!80 = !DILocation(line: 43, column: 5, scope: !23)
!81 = distinct !DISubprogram(name: "Cond0", scope: !2, file: !2, line: 47, type: !82, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !26}
!84 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!85 = !DILocalVariable(name: "var0", arg: 1, scope: !81, file: !2, line: 47, type: !26)
!86 = !DILocation(line: 47, column: 16, scope: !81)
!87 = !DILocation(line: 48, column: 12, scope: !81)
!88 = !DILocation(line: 48, column: 17, scope: !81)
!89 = !DILocation(line: 48, column: 5, scope: !81)
!90 = distinct !DISubprogram(name: "logMessage", scope: !2, file: !2, line: 75, type: !91, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!91 = !DISubroutineType(types: !92)
!92 = !{null, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!95 = !DILocalVariable(name: "message", arg: 1, scope: !90, file: !2, line: 75, type: !93)
!96 = !DILocation(line: 75, column: 29, scope: !90)
!97 = !DILocation(line: 77, column: 1, scope: !90)
!98 = distinct !DISubprogram(name: "Cond1", scope: !2, file: !2, line: 51, type: !82, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!99 = !DILocalVariable(name: "var0", arg: 1, scope: !98, file: !2, line: 51, type: !26)
!100 = !DILocation(line: 51, column: 16, scope: !98)
!101 = !DILocation(line: 52, column: 19, scope: !98)
!102 = !DILocation(line: 52, column: 12, scope: !98)
!103 = !DILocation(line: 52, column: 5, scope: !98)
!104 = distinct !DISubprogram(name: "AComputation", scope: !2, file: !2, line: 59, type: !105, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!105 = !DISubroutineType(types: !106)
!106 = !{!26, !26}
!107 = !DILocalVariable(name: "var0", arg: 1, scope: !104, file: !2, line: 59, type: !26)
!108 = !DILocation(line: 59, column: 22, scope: !104)
!109 = !DILocation(line: 60, column: 12, scope: !104)
!110 = !DILocation(line: 60, column: 17, scope: !104)
!111 = !DILocation(line: 60, column: 5, scope: !104)
!112 = distinct !DISubprogram(name: "Cond", scope: !2, file: !2, line: 63, type: !82, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!113 = !DILocalVariable(name: "var0", arg: 1, scope: !112, file: !2, line: 63, type: !26)
!114 = !DILocation(line: 63, column: 15, scope: !112)
!115 = !DILocation(line: 64, column: 12, scope: !112)
!116 = !DILocation(line: 64, column: 17, scope: !112)
!117 = !DILocation(line: 64, column: 5, scope: !112)
!118 = distinct !DISubprogram(name: "HeavyRComputation", scope: !2, file: !2, line: 67, type: !119, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!119 = !DISubroutineType(types: !120)
!120 = !{!26, !26, !26}
!121 = !DILocalVariable(name: "var0", arg: 1, scope: !118, file: !2, line: 67, type: !26)
!122 = !DILocation(line: 67, column: 27, scope: !118)
!123 = !DILocalVariable(name: "var1", arg: 2, scope: !118, file: !2, line: 67, type: !26)
!124 = !DILocation(line: 67, column: 37, scope: !118)
!125 = !DILocation(line: 68, column: 12, scope: !118)
!126 = !DILocation(line: 68, column: 19, scope: !118)
!127 = !DILocation(line: 68, column: 17, scope: !118)
!128 = !DILocation(line: 68, column: 5, scope: !118)
!129 = distinct !DISubprogram(name: "ChangedRComputation", scope: !2, file: !2, line: 71, type: !119, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!130 = !DILocalVariable(name: "var0", arg: 1, scope: !129, file: !2, line: 71, type: !26)
!131 = !DILocation(line: 71, column: 29, scope: !129)
!132 = !DILocalVariable(name: "var1", arg: 2, scope: !129, file: !2, line: 71, type: !26)
!133 = !DILocation(line: 71, column: 39, scope: !129)
!134 = !DILocation(line: 72, column: 12, scope: !129)
!135 = !DILocation(line: 72, column: 19, scope: !129)
!136 = !DILocation(line: 72, column: 17, scope: !129)
!137 = !DILocation(line: 72, column: 5, scope: !129)
!138 = distinct !DISubprogram(name: "logValue", scope: !2, file: !2, line: 79, type: !139, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!139 = !DISubroutineType(types: !140)
!140 = !{null, !26}
!141 = !DILocalVariable(name: "value", arg: 1, scope: !138, file: !2, line: 79, type: !26)
!142 = !DILocation(line: 79, column: 19, scope: !138)
!143 = !DILocation(line: 81, column: 1, scope: !138)
!144 = distinct !DISubprogram(name: "isEven", scope: !2, file: !2, line: 55, type: !82, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!145 = !DILocalVariable(name: "var0", arg: 1, scope: !144, file: !2, line: 55, type: !26)
!146 = !DILocation(line: 55, column: 17, scope: !144)
!147 = !DILocation(line: 56, column: 12, scope: !144)
!148 = !DILocation(line: 56, column: 17, scope: !144)
!149 = !DILocation(line: 56, column: 21, scope: !144)
!150 = !DILocation(line: 56, column: 5, scope: !144)
!151 = distinct !DISubprogram(name: "PredR", scope: !2, file: !2, line: 83, type: !152, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !29)
!152 = !DISubroutineType(types: !153)
!153 = !{!84, !26, !26}
!154 = !DILocalVariable(name: "var0", arg: 1, scope: !151, file: !2, line: 83, type: !26)
!155 = !DILocation(line: 83, column: 16, scope: !151)
!156 = !DILocalVariable(name: "var1", arg: 2, scope: !151, file: !2, line: 83, type: !26)
!157 = !DILocation(line: 83, column: 26, scope: !151)
!158 = !DILocation(line: 84, column: 12, scope: !151)
!159 = !DILocation(line: 84, column: 19, scope: !151)
!160 = !DILocation(line: 84, column: 17, scope: !151)
!161 = !DILocation(line: 84, column: 5, scope: !151)
