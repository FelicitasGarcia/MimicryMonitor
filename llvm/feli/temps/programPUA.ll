; ModuleID = '/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/programPUA.c'
source_filename = "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/programPUA.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [21 x i8] c"usage: %s <integer>\0A\00", align 1, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !18 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !25, metadata !DIExpression()), !dbg !26
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !27, metadata !DIExpression()), !dbg !28
  %8 = load i32, ptr %4, align 4, !dbg !29
  %9 = icmp slt i32 %8, 2, !dbg !31
  br i1 %9, label %10, label %16, !dbg !32

10:                                               ; preds = %2
  %11 = load ptr, ptr @stderr, align 8, !dbg !33
  %12 = load ptr, ptr %5, align 8, !dbg !35
  %13 = getelementptr inbounds ptr, ptr %12, i64 0, !dbg !35
  %14 = load ptr, ptr %13, align 8, !dbg !35
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str, ptr noundef %14), !dbg !36
  store i32 1, ptr %3, align 4, !dbg !37
  br label %38, !dbg !37

16:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata ptr %6, metadata !38, metadata !DIExpression()), !dbg !39
  %17 = load ptr, ptr %5, align 8, !dbg !40
  %18 = getelementptr inbounds ptr, ptr %17, i64 1, !dbg !40
  %19 = load ptr, ptr %18, align 8, !dbg !40
  %20 = call i32 @atoi(ptr noundef %19) #4, !dbg !41
  store i32 %20, ptr %6, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata ptr %7, metadata !42, metadata !DIExpression()), !dbg !43
  %21 = load i32, ptr %6, align 4, !dbg !44
  %22 = icmp slt i32 %21, 0, !dbg !46
  br i1 %22, label %23, label %24, !dbg !47

23:                                               ; preds = %16
  store i32 -1, ptr %7, align 4, !dbg !48
  br label %35, !dbg !49

24:                                               ; preds = %16
  %25 = load i32, ptr %6, align 4, !dbg !50
  %26 = icmp eq i32 %25, 0, !dbg !52
  br i1 %26, label %27, label %28, !dbg !53

27:                                               ; preds = %24
  store i32 0, ptr %7, align 4, !dbg !54
  br label %34, !dbg !55

28:                                               ; preds = %24
  %29 = load i32, ptr %6, align 4, !dbg !56
  %30 = icmp slt i32 %29, 128, !dbg !58
  br i1 %30, label %31, label %32, !dbg !59

31:                                               ; preds = %28
  store i32 1, ptr %7, align 4, !dbg !60
  br label %33, !dbg !61

32:                                               ; preds = %28
  store i32 2, ptr %7, align 4, !dbg !62
  br label %33

33:                                               ; preds = %32, %31
  br label %34

34:                                               ; preds = %33, %27
  br label %35

35:                                               ; preds = %34, %23
  %36 = load i32, ptr %7, align 4, !dbg !63
  %37 = sdiv i32 10, %36, !dbg !64
  store i32 %37, ptr %3, align 4, !dbg !65
  br label %38, !dbg !65

38:                                               ; preds = %35, %10
  %39 = load i32, ptr %3, align 4, !dbg !66
  ret i32 %39, !dbg !66
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 18, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "inputs/programPUA.c", directory: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli", checksumkind: CSK_MD5, checksum: "3bd309d9f294e5989556974ac63b5e03")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 168, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 21)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !8, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/programPUA.c", directory: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "3bd309d9f294e5989556974ac63b5e03")
!9 = !{!0}
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 8, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 2}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!18 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 14, type: !19, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !24)
!19 = !DISubroutineType(types: !20)
!20 = !{!21, !21, !22}
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !{}
!25 = !DILocalVariable(name: "argc", arg: 1, scope: !18, file: !2, line: 14, type: !21)
!26 = !DILocation(line: 14, column: 14, scope: !18)
!27 = !DILocalVariable(name: "argv", arg: 2, scope: !18, file: !2, line: 14, type: !22)
!28 = !DILocation(line: 14, column: 26, scope: !18)
!29 = !DILocation(line: 16, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !2, line: 16, column: 9)
!31 = !DILocation(line: 16, column: 14, scope: !30)
!32 = !DILocation(line: 16, column: 9, scope: !18)
!33 = !DILocation(line: 18, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !2, line: 17, column: 5)
!35 = !DILocation(line: 18, column: 50, scope: !34)
!36 = !DILocation(line: 18, column: 9, scope: !34)
!37 = !DILocation(line: 19, column: 9, scope: !34)
!38 = !DILocalVariable(name: "n", scope: !18, file: !2, line: 21, type: !21)
!39 = !DILocation(line: 21, column: 9, scope: !18)
!40 = !DILocation(line: 21, column: 18, scope: !18)
!41 = !DILocation(line: 21, column: 13, scope: !18)
!42 = !DILocalVariable(name: "result", scope: !18, file: !2, line: 22, type: !21)
!43 = !DILocation(line: 22, column: 9, scope: !18)
!44 = !DILocation(line: 23, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !18, file: !2, line: 23, column: 9)
!46 = !DILocation(line: 23, column: 11, scope: !45)
!47 = !DILocation(line: 23, column: 9, scope: !18)
!48 = !DILocation(line: 24, column: 16, scope: !45)
!49 = !DILocation(line: 24, column: 9, scope: !45)
!50 = !DILocation(line: 25, column: 14, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !2, line: 25, column: 14)
!52 = !DILocation(line: 25, column: 16, scope: !51)
!53 = !DILocation(line: 25, column: 14, scope: !45)
!54 = !DILocation(line: 26, column: 16, scope: !51)
!55 = !DILocation(line: 26, column: 9, scope: !51)
!56 = !DILocation(line: 27, column: 14, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !2, line: 27, column: 14)
!58 = !DILocation(line: 27, column: 16, scope: !57)
!59 = !DILocation(line: 27, column: 14, scope: !51)
!60 = !DILocation(line: 28, column: 16, scope: !57)
!61 = !DILocation(line: 28, column: 9, scope: !57)
!62 = !DILocation(line: 30, column: 16, scope: !57)
!63 = !DILocation(line: 31, column: 17, scope: !18)
!64 = !DILocation(line: 31, column: 15, scope: !18)
!65 = !DILocation(line: 31, column: 5, scope: !18)
!66 = !DILocation(line: 32, column: 1, scope: !18)
