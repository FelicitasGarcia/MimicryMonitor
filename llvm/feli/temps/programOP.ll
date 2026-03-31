; ModuleID = '/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/inputs/programOP.c'
source_filename = "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/inputs/programOP.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !10 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !19, metadata !DIExpression()), !dbg !20
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata ptr %6, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 10, ptr %6, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata ptr %7, metadata !25, metadata !DIExpression()), !dbg !26
  %9 = load ptr, ptr %5, align 8, !dbg !27
  %10 = getelementptr inbounds ptr, ptr %9, i64 1, !dbg !27
  %11 = load ptr, ptr %10, align 8, !dbg !27
  %12 = icmp ne ptr %11, null, !dbg !27
  br i1 %12, label %13, label %18, !dbg !27

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8, !dbg !28
  %15 = getelementptr inbounds ptr, ptr %14, i64 1, !dbg !28
  %16 = load ptr, ptr %15, align 8, !dbg !28
  %17 = call i32 @atoi(ptr noundef %16), !dbg !29
  br label %19, !dbg !27

18:                                               ; preds = %2
  br label %19, !dbg !27

19:                                               ; preds = %18, %13
  %20 = phi i32 [ %17, %13 ], [ 0, %18 ], !dbg !27
  store i32 %20, ptr %7, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata ptr %8, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 0, ptr %8, align 4, !dbg !31
  %21 = load i32, ptr %7, align 4, !dbg !32
  %22 = call zeroext i1 @Cond1(i32 noundef %21), !dbg !34
  br i1 %22, label %23, label %37, !dbg !35

23:                                               ; preds = %19
  %24 = load i32, ptr %7, align 4, !dbg !36
  %25 = call i32 @AComputation(i32 noundef %24), !dbg !38
  store i32 %25, ptr %8, align 4, !dbg !39
  %26 = load i32, ptr %8, align 4, !dbg !40
  %27 = call zeroext i1 @Cond(i32 noundef %26), !dbg !42
  br i1 %27, label %28, label %32, !dbg !43

28:                                               ; preds = %23
  %29 = load i32, ptr %7, align 4, !dbg !44
  %30 = load i32, ptr %8, align 4, !dbg !46
  %31 = call i32 @HeavyRComputation(i32 noundef %29, i32 noundef %30), !dbg !47
  store i32 %31, ptr %6, align 4, !dbg !48
  br label %36, !dbg !49

32:                                               ; preds = %23
  %33 = load i32, ptr %7, align 4, !dbg !50
  %34 = load i32, ptr %8, align 4, !dbg !52
  %35 = call i32 @RComputation(i32 noundef %33, i32 noundef %34), !dbg !53
  store i32 %35, ptr %6, align 4, !dbg !54
  br label %36

36:                                               ; preds = %32, %28
  br label %37, !dbg !55

37:                                               ; preds = %36, %19
  %38 = load i32, ptr %6, align 4, !dbg !56
  ret i32 %38, !dbg !57
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @atoi(ptr noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond1(i32 noundef %0) #0 !dbg !58 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !62, metadata !DIExpression()), !dbg !63
  %3 = load i32, ptr %2, align 4, !dbg !64
  %4 = call zeroext i1 @isEven(i32 noundef %3), !dbg !65
  ret i1 %4, !dbg !66
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @AComputation(i32 noundef %0) #0 !dbg !67 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !70, metadata !DIExpression()), !dbg !71
  %3 = load i32, ptr %2, align 4, !dbg !72
  %4 = mul nsw i32 %3, 2, !dbg !73
  ret i32 %4, !dbg !74
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond(i32 noundef %0) #0 !dbg !75 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !76, metadata !DIExpression()), !dbg !77
  %3 = load i32, ptr %2, align 4, !dbg !78
  %4 = icmp sgt i32 %3, 5, !dbg !79
  ret i1 %4, !dbg !80
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @HeavyRComputation(i32 noundef %0, i32 noundef %1) #0 !dbg !81 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !86, metadata !DIExpression()), !dbg !87
  %5 = load i32, ptr %3, align 4, !dbg !88
  %6 = load i32, ptr %4, align 4, !dbg !89
  %7 = add nsw i32 %5, %6, !dbg !90
  ret i32 %7, !dbg !91
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @RComputation(i32 noundef %0, i32 noundef %1) #0 !dbg !92 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !93, metadata !DIExpression()), !dbg !94
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !95, metadata !DIExpression()), !dbg !96
  %5 = load i32, ptr %3, align 4, !dbg !97
  %6 = load i32, ptr %4, align 4, !dbg !98
  %7 = sub nsw i32 %5, %6, !dbg !99
  ret i32 %7, !dbg !100
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @isEven(i32 noundef %0) #0 !dbg !101 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !102, metadata !DIExpression()), !dbg !103
  %3 = load i32, ptr %2, align 4, !dbg !104
  %4 = srem i32 %3, 2, !dbg !105
  %5 = icmp eq i32 %4, 0, !dbg !106
  ret i1 %5, !dbg !107
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @PredT(i32 noundef %0, i32 noundef %1) #0 !dbg !108 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !113, metadata !DIExpression()), !dbg !114
  %5 = load i32, ptr %3, align 4, !dbg !115
  %6 = load i32, ptr %4, align 4, !dbg !116
  %7 = icmp slt i32 %5, %6, !dbg !117
  ret i1 %7, !dbg !118
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @PredR(i32 noundef %0, i32 noundef %1) #0 !dbg !119 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !120, metadata !DIExpression()), !dbg !121
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !122, metadata !DIExpression()), !dbg !123
  %5 = load i32, ptr %3, align 4, !dbg !124
  %6 = load i32, ptr %4, align 4, !dbg !125
  %7 = icmp sgt i32 %5, %6, !dbg !126
  ret i1 %7, !dbg !127
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6}
!llvm.dbg.cu = !{!7}
!llvm.ident = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!1 = !{i32 7, !"Dwarf Version", i32 5}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 1}
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !8, producer: "Apple clang version 16.0.0 (clang-1600.0.26.6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk", sdk: "MacOSX.sdk")
!8 = !DIFile(filename: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/inputs/programOP.c", directory: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "72f30b87a992dbea066dc9839b25b54a")
!9 = !{!"Apple clang version 16.0.0 (clang-1600.0.26.6)"}
!10 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 18, type: !12, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!11 = !DIFile(filename: "inputs/programOP.c", directory: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli", checksumkind: CSK_MD5, checksum: "72f30b87a992dbea066dc9839b25b54a")
!12 = !DISubroutineType(types: !13)
!13 = !{!14, !14, !15}
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{}
!19 = !DILocalVariable(name: "argc", arg: 1, scope: !10, file: !11, line: 18, type: !14)
!20 = !DILocation(line: 18, column: 14, scope: !10)
!21 = !DILocalVariable(name: "argv", arg: 2, scope: !10, file: !11, line: 18, type: !15)
!22 = !DILocation(line: 18, column: 26, scope: !10)
!23 = !DILocalVariable(name: "R", scope: !10, file: !11, line: 19, type: !14)
!24 = !DILocation(line: 19, column: 9, scope: !10)
!25 = !DILocalVariable(name: "P", scope: !10, file: !11, line: 20, type: !14)
!26 = !DILocation(line: 20, column: 9, scope: !10)
!27 = !DILocation(line: 20, column: 13, scope: !10)
!28 = !DILocation(line: 20, column: 28, scope: !10)
!29 = !DILocation(line: 20, column: 23, scope: !10)
!30 = !DILocalVariable(name: "A", scope: !10, file: !11, line: 21, type: !14)
!31 = !DILocation(line: 21, column: 9, scope: !10)
!32 = !DILocation(line: 24, column: 15, scope: !33)
!33 = distinct !DILexicalBlock(scope: !10, file: !11, line: 24, column: 9)
!34 = !DILocation(line: 24, column: 9, scope: !33)
!35 = !DILocation(line: 24, column: 9, scope: !10)
!36 = !DILocation(line: 25, column: 30, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 24, column: 19)
!38 = !DILocation(line: 25, column: 17, scope: !37)
!39 = !DILocation(line: 25, column: 15, scope: !37)
!40 = !DILocation(line: 26, column: 22, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !11, line: 26, column: 17)
!42 = !DILocation(line: 26, column: 17, scope: !41)
!43 = !DILocation(line: 26, column: 17, scope: !37)
!44 = !DILocation(line: 27, column: 39, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !11, line: 26, column: 26)
!46 = !DILocation(line: 27, column: 42, scope: !45)
!47 = !DILocation(line: 27, column: 21, scope: !45)
!48 = !DILocation(line: 27, column: 19, scope: !45)
!49 = !DILocation(line: 28, column: 13, scope: !45)
!50 = !DILocation(line: 29, column: 34, scope: !51)
!51 = distinct !DILexicalBlock(scope: !41, file: !11, line: 28, column: 20)
!52 = !DILocation(line: 29, column: 37, scope: !51)
!53 = !DILocation(line: 29, column: 21, scope: !51)
!54 = !DILocation(line: 29, column: 19, scope: !51)
!55 = !DILocation(line: 31, column: 5, scope: !37)
!56 = !DILocation(line: 33, column: 12, scope: !10)
!57 = !DILocation(line: 33, column: 5, scope: !10)
!58 = distinct !DISubprogram(name: "Cond1", scope: !11, file: !11, line: 37, type: !59, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !14}
!61 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!62 = !DILocalVariable(name: "var0", arg: 1, scope: !58, file: !11, line: 37, type: !14)
!63 = !DILocation(line: 37, column: 16, scope: !58)
!64 = !DILocation(line: 38, column: 19, scope: !58)
!65 = !DILocation(line: 38, column: 12, scope: !58)
!66 = !DILocation(line: 38, column: 5, scope: !58)
!67 = distinct !DISubprogram(name: "AComputation", scope: !11, file: !11, line: 45, type: !68, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!68 = !DISubroutineType(types: !69)
!69 = !{!14, !14}
!70 = !DILocalVariable(name: "var0", arg: 1, scope: !67, file: !11, line: 45, type: !14)
!71 = !DILocation(line: 45, column: 22, scope: !67)
!72 = !DILocation(line: 46, column: 12, scope: !67)
!73 = !DILocation(line: 46, column: 17, scope: !67)
!74 = !DILocation(line: 46, column: 5, scope: !67)
!75 = distinct !DISubprogram(name: "Cond", scope: !11, file: !11, line: 49, type: !59, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!76 = !DILocalVariable(name: "var0", arg: 1, scope: !75, file: !11, line: 49, type: !14)
!77 = !DILocation(line: 49, column: 15, scope: !75)
!78 = !DILocation(line: 50, column: 12, scope: !75)
!79 = !DILocation(line: 50, column: 17, scope: !75)
!80 = !DILocation(line: 50, column: 5, scope: !75)
!81 = distinct !DISubprogram(name: "HeavyRComputation", scope: !11, file: !11, line: 53, type: !82, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!82 = !DISubroutineType(types: !83)
!83 = !{!14, !14, !14}
!84 = !DILocalVariable(name: "var0", arg: 1, scope: !81, file: !11, line: 53, type: !14)
!85 = !DILocation(line: 53, column: 27, scope: !81)
!86 = !DILocalVariable(name: "var1", arg: 2, scope: !81, file: !11, line: 53, type: !14)
!87 = !DILocation(line: 53, column: 37, scope: !81)
!88 = !DILocation(line: 54, column: 12, scope: !81)
!89 = !DILocation(line: 54, column: 19, scope: !81)
!90 = !DILocation(line: 54, column: 17, scope: !81)
!91 = !DILocation(line: 54, column: 5, scope: !81)
!92 = distinct !DISubprogram(name: "RComputation", scope: !11, file: !11, line: 57, type: !82, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!93 = !DILocalVariable(name: "var0", arg: 1, scope: !92, file: !11, line: 57, type: !14)
!94 = !DILocation(line: 57, column: 22, scope: !92)
!95 = !DILocalVariable(name: "var1", arg: 2, scope: !92, file: !11, line: 57, type: !14)
!96 = !DILocation(line: 57, column: 32, scope: !92)
!97 = !DILocation(line: 58, column: 12, scope: !92)
!98 = !DILocation(line: 58, column: 19, scope: !92)
!99 = !DILocation(line: 58, column: 17, scope: !92)
!100 = !DILocation(line: 58, column: 5, scope: !92)
!101 = distinct !DISubprogram(name: "isEven", scope: !11, file: !11, line: 41, type: !59, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!102 = !DILocalVariable(name: "var0", arg: 1, scope: !101, file: !11, line: 41, type: !14)
!103 = !DILocation(line: 41, column: 17, scope: !101)
!104 = !DILocation(line: 42, column: 12, scope: !101)
!105 = !DILocation(line: 42, column: 17, scope: !101)
!106 = !DILocation(line: 42, column: 21, scope: !101)
!107 = !DILocation(line: 42, column: 5, scope: !101)
!108 = distinct !DISubprogram(name: "PredT", scope: !11, file: !11, line: 61, type: !109, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!109 = !DISubroutineType(types: !110)
!110 = !{!61, !14, !14}
!111 = !DILocalVariable(name: "var0", arg: 1, scope: !108, file: !11, line: 61, type: !14)
!112 = !DILocation(line: 61, column: 16, scope: !108)
!113 = !DILocalVariable(name: "var1", arg: 2, scope: !108, file: !11, line: 61, type: !14)
!114 = !DILocation(line: 61, column: 26, scope: !108)
!115 = !DILocation(line: 62, column: 12, scope: !108)
!116 = !DILocation(line: 62, column: 19, scope: !108)
!117 = !DILocation(line: 62, column: 17, scope: !108)
!118 = !DILocation(line: 62, column: 5, scope: !108)
!119 = distinct !DISubprogram(name: "PredR", scope: !11, file: !11, line: 65, type: !109, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!120 = !DILocalVariable(name: "var0", arg: 1, scope: !119, file: !11, line: 65, type: !14)
!121 = !DILocation(line: 65, column: 16, scope: !119)
!122 = !DILocalVariable(name: "var1", arg: 2, scope: !119, file: !11, line: 65, type: !14)
!123 = !DILocation(line: 65, column: 26, scope: !119)
!124 = !DILocation(line: 66, column: 12, scope: !119)
!125 = !DILocation(line: 66, column: 19, scope: !119)
!126 = !DILocation(line: 66, column: 17, scope: !119)
!127 = !DILocation(line: 66, column: 5, scope: !119)
