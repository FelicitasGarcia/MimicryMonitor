; ModuleID = '/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/programPUA.c'
source_filename = "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/programPUA.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [21 x i8] c"usage: %s <integer>\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [9 x i8] c"finished\00", align 1, !dbg !7

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !23 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !30, metadata !DIExpression()), !dbg !31
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !32, metadata !DIExpression()), !dbg !33
  %8 = load i32, ptr %4, align 4, !dbg !34
  %9 = icmp slt i32 %8, 2, !dbg !36
  br i1 %9, label %10, label %16, !dbg !37

10:                                               ; preds = %2
  %11 = load ptr, ptr @stderr, align 8, !dbg !38
  %12 = load ptr, ptr %5, align 8, !dbg !40
  %13 = getelementptr inbounds ptr, ptr %12, i64 0, !dbg !40
  %14 = load ptr, ptr %13, align 8, !dbg !40
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str, ptr noundef %14), !dbg !41
  store i32 1, ptr %3, align 4, !dbg !42
  br label %37, !dbg !42

16:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata ptr %6, metadata !43, metadata !DIExpression()), !dbg !44
  %17 = load ptr, ptr %5, align 8, !dbg !45
  %18 = getelementptr inbounds ptr, ptr %17, i64 1, !dbg !45
  %19 = load ptr, ptr %18, align 8, !dbg !45
  %20 = call i32 @atoi(ptr noundef %19) #4, !dbg !46
  store i32 %20, ptr %6, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata ptr %7, metadata !47, metadata !DIExpression()), !dbg !48
  %21 = load i32, ptr %6, align 4, !dbg !49
  %22 = icmp slt i32 %21, 0, !dbg !51
  br i1 %22, label %23, label %24, !dbg !52

23:                                               ; preds = %16
  store i32 -1, ptr %7, align 4, !dbg !53
  br label %35, !dbg !54

24:                                               ; preds = %16
  %25 = load i32, ptr %6, align 4, !dbg !55
  %26 = icmp eq i32 %25, 0, !dbg !57
  br i1 %26, label %27, label %28, !dbg !58

27:                                               ; preds = %24
  store i32 0, ptr %7, align 4, !dbg !59
  br label %34, !dbg !60

28:                                               ; preds = %24
  %29 = load i32, ptr %6, align 4, !dbg !61
  %30 = icmp slt i32 %29, 128, !dbg !63
  br i1 %30, label %31, label %32, !dbg !64

31:                                               ; preds = %28
  store i32 1, ptr %7, align 4, !dbg !65
  br label %33, !dbg !66

32:                                               ; preds = %28
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
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }

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
