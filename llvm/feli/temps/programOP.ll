; ModuleID = '/Users/felicitasgarcia/TESIS/mimicrymonitor/llvm/feli/inputs/programOP.c'
source_filename = "/Users/felicitasgarcia/TESIS/mimicrymonitor/llvm/feli/inputs/programOP.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
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
    #dbg_declare(ptr %4, !19, !DIExpression(), !20)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !21, !DIExpression(), !22)
    #dbg_declare(ptr %6, !23, !DIExpression(), !24)
  store i32 10, ptr %6, align 4, !dbg !24
    #dbg_declare(ptr %7, !25, !DIExpression(), !26)
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
    #dbg_declare(ptr %8, !30, !DIExpression(), !31)
  store i32 0, ptr %8, align 4, !dbg !31
  %21 = load i32, ptr %7, align 4, !dbg !32
  %22 = call zeroext i1 @Cond1(i32 noundef %21), !dbg !34
  br i1 %22, label %23, label %37, !dbg !34

23:                                               ; preds = %19
  %24 = load i32, ptr %7, align 4, !dbg !35
  %25 = call i32 @AComputation(i32 noundef %24), !dbg !37
  store i32 %25, ptr %8, align 4, !dbg !38
  %26 = load i32, ptr %8, align 4, !dbg !39
  %27 = call zeroext i1 @Cond(i32 noundef %26), !dbg !41
  br i1 %27, label %28, label %32, !dbg !41

28:                                               ; preds = %23
  %29 = load i32, ptr %7, align 4, !dbg !42
  %30 = load i32, ptr %8, align 4, !dbg !44
  %31 = call i32 @HeavyRComputation(i32 noundef %29, i32 noundef %30), !dbg !45
  store i32 %31, ptr %6, align 4, !dbg !46
  br label %36, !dbg !47

32:                                               ; preds = %23
  %33 = load i32, ptr %7, align 4, !dbg !48
  %34 = load i32, ptr %8, align 4, !dbg !50
  %35 = call i32 @RComputation(i32 noundef %33, i32 noundef %34), !dbg !51
  store i32 %35, ptr %6, align 4, !dbg !52
  br label %36

36:                                               ; preds = %32, %28
  br label %37, !dbg !53

37:                                               ; preds = %36, %19
  %38 = load i32, ptr %6, align 4, !dbg !54
  ret i32 %38, !dbg !55
}

declare i32 @atoi(ptr noundef) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond1(i32 noundef %0) #0 !dbg !56 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !60, !DIExpression(), !61)
  %3 = load i32, ptr %2, align 4, !dbg !62
  %4 = call zeroext i1 @isEven(i32 noundef %3), !dbg !63
  ret i1 %4, !dbg !64
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @AComputation(i32 noundef %0) #0 !dbg !65 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !68, !DIExpression(), !69)
  %3 = load i32, ptr %2, align 4, !dbg !70
  %4 = mul nsw i32 %3, 2, !dbg !71
  ret i32 %4, !dbg !72
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @Cond(i32 noundef %0) #0 !dbg !73 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !74, !DIExpression(), !75)
  %3 = load i32, ptr %2, align 4, !dbg !76
  %4 = icmp sgt i32 %3, 5, !dbg !77
  ret i1 %4, !dbg !78
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @HeavyRComputation(i32 noundef %0, i32 noundef %1) #0 !dbg !79 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !82, !DIExpression(), !83)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !84, !DIExpression(), !85)
  %5 = load i32, ptr %3, align 4, !dbg !86
  %6 = load i32, ptr %4, align 4, !dbg !87
  %7 = add nsw i32 %5, %6, !dbg !88
  ret i32 %7, !dbg !89
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @RComputation(i32 noundef %0, i32 noundef %1) #0 !dbg !90 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !91, !DIExpression(), !92)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !93, !DIExpression(), !94)
  %5 = load i32, ptr %3, align 4, !dbg !95
  %6 = load i32, ptr %4, align 4, !dbg !96
  %7 = sub nsw i32 %5, %6, !dbg !97
  ret i32 %7, !dbg !98
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @isEven(i32 noundef %0) #0 !dbg !99 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !100, !DIExpression(), !101)
  %3 = load i32, ptr %2, align 4, !dbg !102
  %4 = srem i32 %3, 2, !dbg !103
  %5 = icmp eq i32 %4, 0, !dbg !104
  ret i1 %5, !dbg !105
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @PredT(i32 noundef %0, i32 noundef %1) #0 !dbg !106 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !109, !DIExpression(), !110)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !111, !DIExpression(), !112)
  %5 = load i32, ptr %3, align 4, !dbg !113
  %6 = load i32, ptr %4, align 4, !dbg !114
  %7 = icmp slt i32 %5, %6, !dbg !115
  ret i1 %7, !dbg !116
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define zeroext i1 @PredR(i32 noundef %0, i32 noundef %1) #0 !dbg !117 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !118, !DIExpression(), !119)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !120, !DIExpression(), !121)
  %5 = load i32, ptr %3, align 4, !dbg !122
  %6 = load i32, ptr %4, align 4, !dbg !123
  %7 = icmp sgt i32 %5, %6, !dbg !124
  ret i1 %7, !dbg !125
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

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
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !8, producer: "Homebrew clang version 20.1.3", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!8 = !DIFile(filename: "/Users/felicitasgarcia/TESIS/mimicrymonitor/llvm/feli/inputs/programOP.c", directory: "/Users/felicitasgarcia/TESIS/mimicrymonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "72f30b87a992dbea066dc9839b25b54a")
!9 = !{!"Homebrew clang version 20.1.3"}
!10 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 18, type: !12, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!11 = !DIFile(filename: "inputs/programOP.c", directory: "/Users/felicitasgarcia/TESIS/mimicrymonitor/llvm/feli", checksumkind: CSK_MD5, checksum: "72f30b87a992dbea066dc9839b25b54a")
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
!35 = !DILocation(line: 25, column: 30, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !11, line: 24, column: 19)
!37 = !DILocation(line: 25, column: 17, scope: !36)
!38 = !DILocation(line: 25, column: 15, scope: !36)
!39 = !DILocation(line: 26, column: 22, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !11, line: 26, column: 17)
!41 = !DILocation(line: 26, column: 17, scope: !40)
!42 = !DILocation(line: 27, column: 39, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !11, line: 26, column: 26)
!44 = !DILocation(line: 27, column: 42, scope: !43)
!45 = !DILocation(line: 27, column: 21, scope: !43)
!46 = !DILocation(line: 27, column: 19, scope: !43)
!47 = !DILocation(line: 28, column: 13, scope: !43)
!48 = !DILocation(line: 29, column: 34, scope: !49)
!49 = distinct !DILexicalBlock(scope: !40, file: !11, line: 28, column: 20)
!50 = !DILocation(line: 29, column: 37, scope: !49)
!51 = !DILocation(line: 29, column: 21, scope: !49)
!52 = !DILocation(line: 29, column: 19, scope: !49)
!53 = !DILocation(line: 31, column: 5, scope: !36)
!54 = !DILocation(line: 33, column: 12, scope: !10)
!55 = !DILocation(line: 33, column: 5, scope: !10)
!56 = distinct !DISubprogram(name: "Cond1", scope: !11, file: !11, line: 37, type: !57, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !14}
!59 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!60 = !DILocalVariable(name: "var0", arg: 1, scope: !56, file: !11, line: 37, type: !14)
!61 = !DILocation(line: 37, column: 16, scope: !56)
!62 = !DILocation(line: 38, column: 19, scope: !56)
!63 = !DILocation(line: 38, column: 12, scope: !56)
!64 = !DILocation(line: 38, column: 5, scope: !56)
!65 = distinct !DISubprogram(name: "AComputation", scope: !11, file: !11, line: 45, type: !66, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!66 = !DISubroutineType(types: !67)
!67 = !{!14, !14}
!68 = !DILocalVariable(name: "var0", arg: 1, scope: !65, file: !11, line: 45, type: !14)
!69 = !DILocation(line: 45, column: 22, scope: !65)
!70 = !DILocation(line: 46, column: 12, scope: !65)
!71 = !DILocation(line: 46, column: 17, scope: !65)
!72 = !DILocation(line: 46, column: 5, scope: !65)
!73 = distinct !DISubprogram(name: "Cond", scope: !11, file: !11, line: 49, type: !57, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!74 = !DILocalVariable(name: "var0", arg: 1, scope: !73, file: !11, line: 49, type: !14)
!75 = !DILocation(line: 49, column: 15, scope: !73)
!76 = !DILocation(line: 50, column: 12, scope: !73)
!77 = !DILocation(line: 50, column: 17, scope: !73)
!78 = !DILocation(line: 50, column: 5, scope: !73)
!79 = distinct !DISubprogram(name: "HeavyRComputation", scope: !11, file: !11, line: 53, type: !80, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!80 = !DISubroutineType(types: !81)
!81 = !{!14, !14, !14}
!82 = !DILocalVariable(name: "var0", arg: 1, scope: !79, file: !11, line: 53, type: !14)
!83 = !DILocation(line: 53, column: 27, scope: !79)
!84 = !DILocalVariable(name: "var1", arg: 2, scope: !79, file: !11, line: 53, type: !14)
!85 = !DILocation(line: 53, column: 37, scope: !79)
!86 = !DILocation(line: 54, column: 12, scope: !79)
!87 = !DILocation(line: 54, column: 19, scope: !79)
!88 = !DILocation(line: 54, column: 17, scope: !79)
!89 = !DILocation(line: 54, column: 5, scope: !79)
!90 = distinct !DISubprogram(name: "RComputation", scope: !11, file: !11, line: 57, type: !80, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!91 = !DILocalVariable(name: "var0", arg: 1, scope: !90, file: !11, line: 57, type: !14)
!92 = !DILocation(line: 57, column: 22, scope: !90)
!93 = !DILocalVariable(name: "var1", arg: 2, scope: !90, file: !11, line: 57, type: !14)
!94 = !DILocation(line: 57, column: 32, scope: !90)
!95 = !DILocation(line: 58, column: 12, scope: !90)
!96 = !DILocation(line: 58, column: 19, scope: !90)
!97 = !DILocation(line: 58, column: 17, scope: !90)
!98 = !DILocation(line: 58, column: 5, scope: !90)
!99 = distinct !DISubprogram(name: "isEven", scope: !11, file: !11, line: 41, type: !57, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!100 = !DILocalVariable(name: "var0", arg: 1, scope: !99, file: !11, line: 41, type: !14)
!101 = !DILocation(line: 41, column: 17, scope: !99)
!102 = !DILocation(line: 42, column: 12, scope: !99)
!103 = !DILocation(line: 42, column: 17, scope: !99)
!104 = !DILocation(line: 42, column: 21, scope: !99)
!105 = !DILocation(line: 42, column: 5, scope: !99)
!106 = distinct !DISubprogram(name: "PredT", scope: !11, file: !11, line: 61, type: !107, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!107 = !DISubroutineType(types: !108)
!108 = !{!59, !14, !14}
!109 = !DILocalVariable(name: "var0", arg: 1, scope: !106, file: !11, line: 61, type: !14)
!110 = !DILocation(line: 61, column: 16, scope: !106)
!111 = !DILocalVariable(name: "var1", arg: 2, scope: !106, file: !11, line: 61, type: !14)
!112 = !DILocation(line: 61, column: 26, scope: !106)
!113 = !DILocation(line: 62, column: 12, scope: !106)
!114 = !DILocation(line: 62, column: 19, scope: !106)
!115 = !DILocation(line: 62, column: 17, scope: !106)
!116 = !DILocation(line: 62, column: 5, scope: !106)
!117 = distinct !DISubprogram(name: "PredR", scope: !11, file: !11, line: 65, type: !107, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !18)
!118 = !DILocalVariable(name: "var0", arg: 1, scope: !117, file: !11, line: 65, type: !14)
!119 = !DILocation(line: 65, column: 16, scope: !117)
!120 = !DILocalVariable(name: "var1", arg: 2, scope: !117, file: !11, line: 65, type: !14)
!121 = !DILocation(line: 65, column: 26, scope: !117)
!122 = !DILocation(line: 66, column: 12, scope: !117)
!123 = !DILocation(line: 66, column: 19, scope: !117)
!124 = !DILocation(line: 66, column: 17, scope: !117)
!125 = !DILocation(line: 66, column: 5, scope: !117)
