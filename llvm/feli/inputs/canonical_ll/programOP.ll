; ModuleID = '/Users/felicitasgarcia/MM/coreutils/src/catOP.c'
source_filename = "/Users/felicitasgarcia/MM/coreutils/src/catOP.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

%struct.option = type { ptr, i32, ptr, i32 }
%struct.infomap = type { ptr, ptr }
%struct.stat = type { i32, i16, i16, i64, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64, i32, i32, i32, i32, [2 x i64] }
%struct.timespec = type { i64, i64 }
%struct.__sFILE = type { ptr, i32, i32, i16, i16, %struct.__sbuf, i32, ptr, ptr, ptr, ptr, ptr, %struct.__sbuf, ptr, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { ptr, i32 }

@__stderrp = external global ptr, align 8
@.str = private unnamed_addr constant [39 x i8] c"Try '%s --help' for more information.\0A\00", align 1, !dbg !0
@program_name = external global ptr, align 8
@.str.1 = private unnamed_addr constant [39 x i8] c"   Usage: %s [OPTION]... [FILE]...\0A   \00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [47 x i8] c"   Concatenate FILE(s) to standard output.\0A   \00", align 1, !dbg !9
@__stdoutp = external global ptr, align 8
@.str.3 = private unnamed_addr constant [359 x i8] c"   \0A     -A, --show-all           equivalent to -vET\0A     -b, --number-nonblank    number nonempty output lines, overrides -n\0A     -e                       equivalent to -vE\0A     -E, --show-ends          display $ at end of each line\0A     -n, --number             number all output lines\0A     -s, --squeeze-blank      suppress repeated empty output lines\0A   \00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [227 x i8] c"     -t                       equivalent to -vT\0A     -T, --show-tabs          display TAB characters as ^I\0A     -u                       (ignored)\0A     -v, --show-nonprinting   use ^ and M- notation, except for LFD and TAB\0A   \00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [48 x i8] c"      --help        display this help and exit\0A\00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [57 x i8] c"      --version     output version information and exit\0A\00", align 1, !dbg !29
@.str.7 = private unnamed_addr constant [152 x i8] c"   \0A   Examples:\0A     %s f - g  Output f's contents, then standard input, then g's contents.\0A     %s        Copy standard input to standard output.\0A   \00", align 1, !dbg !34
@.str.8 = private unnamed_addr constant [4 x i8] c"cat\00", align 1, !dbg !39
@main.long_options = internal constant [10 x %struct.option] [%struct.option { ptr @.str.9, i32 0, ptr null, i32 98 }, %struct.option { ptr @.str.10, i32 0, ptr null, i32 110 }, %struct.option { ptr @.str.11, i32 0, ptr null, i32 115 }, %struct.option { ptr @.str.12, i32 0, ptr null, i32 118 }, %struct.option { ptr @.str.13, i32 0, ptr null, i32 69 }, %struct.option { ptr @.str.14, i32 0, ptr null, i32 84 }, %struct.option { ptr @.str.15, i32 0, ptr null, i32 65 }, %struct.option { ptr @.str.16, i32 0, ptr null, i32 -130 }, %struct.option { ptr @.str.17, i32 0, ptr null, i32 -131 }, %struct.option zeroinitializer], align 8, !dbg !44
@.str.9 = private unnamed_addr constant [16 x i8] c"number-nonblank\00", align 1, !dbg !100
@.str.10 = private unnamed_addr constant [7 x i8] c"number\00", align 1, !dbg !105
@.str.11 = private unnamed_addr constant [14 x i8] c"squeeze-blank\00", align 1, !dbg !110
@.str.12 = private unnamed_addr constant [17 x i8] c"show-nonprinting\00", align 1, !dbg !115
@.str.13 = private unnamed_addr constant [10 x i8] c"show-ends\00", align 1, !dbg !120
@.str.14 = private unnamed_addr constant [10 x i8] c"show-tabs\00", align 1, !dbg !125
@.str.15 = private unnamed_addr constant [9 x i8] c"show-all\00", align 1, !dbg !127
@.str.16 = private unnamed_addr constant [5 x i8] c"help\00", align 1, !dbg !132
@.str.17 = private unnamed_addr constant [8 x i8] c"version\00", align 1, !dbg !137
@.str.18 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1, !dbg !142
@.str.19 = private unnamed_addr constant [11 x i8] c"benstuvAET\00", align 1, !dbg !147
@.str.20 = private unnamed_addr constant [14 x i8] c"GNU coreutils\00", align 1, !dbg !152
@Version = external global ptr, align 8
@.str.21 = private unnamed_addr constant [18 x i8] c"Torbjorn Granlund\00", align 1, !dbg !154
@.str.22 = private unnamed_addr constant [19 x i8] c"Torbj\C3\B6rn Granlund\00", align 1, !dbg !159
@.str.23 = private unnamed_addr constant [20 x i8] c"Richard M. Stallman\00", align 1, !dbg !164
@.str.24 = private unnamed_addr constant [16 x i8] c"standard output\00", align 1, !dbg !169
@.str.25 = private unnamed_addr constant [2 x i8] c"-\00", align 1, !dbg !171
@infile = internal global ptr null, align 8, !dbg !193
@rpl_optind = external global i32, align 4
@input_desc = internal global i32 0, align 4, !dbg !195
@.str.26 = private unnamed_addr constant [3 x i8] c"%s\00", align 1, !dbg !176
@.str.27 = private unnamed_addr constant [30 x i8] c"%s: input file is output file\00", align 1, !dbg !181
@pending_cr = internal global i8 0, align 1, !dbg !267
@.str.28 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1, !dbg !186
@.str.29 = private unnamed_addr constant [23 x i8] c"closing standard input\00", align 1, !dbg !188
@.str.30 = private unnamed_addr constant [56 x i8] c"\0AWith no FILE, or when FILE is -, read standard input.\0A\00", align 1, !dbg !197
@.str.31 = private unnamed_addr constant [2 x i8] c"[\00", align 1, !dbg !202
@.str.32 = private unnamed_addr constant [16 x i8] c"test invocation\00", align 1, !dbg !204
@.str.33 = private unnamed_addr constant [10 x i8] c"coreutils\00", align 1, !dbg !206
@.str.34 = private unnamed_addr constant [22 x i8] c"Multi-call invocation\00", align 1, !dbg !208
@.str.35 = private unnamed_addr constant [10 x i8] c"sha224sum\00", align 1, !dbg !213
@.str.36 = private unnamed_addr constant [15 x i8] c"sha2 utilities\00", align 1, !dbg !215
@.str.37 = private unnamed_addr constant [10 x i8] c"sha256sum\00", align 1, !dbg !220
@.str.38 = private unnamed_addr constant [10 x i8] c"sha384sum\00", align 1, !dbg !222
@.str.39 = private unnamed_addr constant [10 x i8] c"sha512sum\00", align 1, !dbg !224
@__const.emit_ancillary_info.infomap = private unnamed_addr constant [7 x %struct.infomap] [%struct.infomap { ptr @.str.31, ptr @.str.32 }, %struct.infomap { ptr @.str.33, ptr @.str.34 }, %struct.infomap { ptr @.str.35, ptr @.str.36 }, %struct.infomap { ptr @.str.37, ptr @.str.36 }, %struct.infomap { ptr @.str.38, ptr @.str.36 }, %struct.infomap { ptr @.str.39, ptr @.str.36 }, %struct.infomap zeroinitializer], align 8
@.str.40 = private unnamed_addr constant [4 x i8] c"en_\00", align 1, !dbg !226
@.str.41 = private unnamed_addr constant [71 x i8] c"Report any translation bugs to <https://translationproject.org/team/>\0A\00", align 1, !dbg !228
@.str.42 = private unnamed_addr constant [5 x i8] c"test\00", align 1, !dbg !233
@.str.43 = private unnamed_addr constant [27 x i8] c"Full documentation <%s%s>\0A\00", align 1, !dbg !235
@.str.44 = private unnamed_addr constant [40 x i8] c"https://www.gnu.org/software/coreutils/\00", align 1, !dbg !240
@.str.45 = private unnamed_addr constant [51 x i8] c"or available locally via: info '(coreutils) %s%s'\0A\00", align 1, !dbg !245
@.str.46 = private unnamed_addr constant [12 x i8] c" invocation\00", align 1, !dbg !250
@newlines2 = internal global i32 0, align 4, !dbg !257
@.str.47 = private unnamed_addr constant [22 x i8] c"cannot do ioctl on %s\00", align 1, !dbg !255
@line_num_print = internal global ptr getelementptr (i8, ptr @line_buf, i64 12), align 8, !dbg !265
@line_num_end = internal global ptr getelementptr (i8, ptr @line_buf, i64 17), align 8, !dbg !259
@line_num_start = internal global ptr getelementptr (i8, ptr @line_buf, i64 17), align 8, !dbg !261
@line_buf = internal global [20 x i8] c"                 0\09\00", align 1, !dbg !263
@.str.48 = private unnamed_addr constant [12 x i8] c"write error\00", align 1, !dbg !269

; Function Attrs: noinline noreturn nounwind ssp uwtable(sync)
define void @usage(i32 noundef %0) #0 !dbg !290 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !293, metadata !DIExpression()), !dbg !294
  %3 = load i32, ptr %2, align 4, !dbg !295
  %4 = icmp ne i32 %3, 0, !dbg !297
  br i1 %4, label %5, label %11, !dbg !298

5:                                                ; preds = %1
  br label %6, !dbg !299

6:                                                ; preds = %5
  %7 = load ptr, ptr @__stderrp, align 8, !dbg !300
  %8 = load ptr, ptr @program_name, align 8, !dbg !300
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str, ptr noundef %8), !dbg !300
  br label %10, !dbg !300

10:                                               ; preds = %6
  br label %27, !dbg !300

11:                                               ; preds = %1
  %12 = load ptr, ptr @program_name, align 8, !dbg !302
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %12), !dbg !304
  %14 = load ptr, ptr @__stdoutp, align 8, !dbg !305
  %15 = call i32 @"\01_fputs"(ptr noundef @.str.2, ptr noundef %14), !dbg !306
  call void @emit_stdin_note(), !dbg !307
  %16 = load ptr, ptr @__stdoutp, align 8, !dbg !308
  %17 = call i32 @"\01_fputs"(ptr noundef @.str.3, ptr noundef %16), !dbg !309
  %18 = load ptr, ptr @__stdoutp, align 8, !dbg !310
  %19 = call i32 @"\01_fputs"(ptr noundef @.str.4, ptr noundef %18), !dbg !311
  %20 = load ptr, ptr @__stdoutp, align 8, !dbg !312
  %21 = call i32 @"\01_fputs"(ptr noundef @.str.5, ptr noundef %20), !dbg !313
  %22 = load ptr, ptr @__stdoutp, align 8, !dbg !314
  %23 = call i32 @"\01_fputs"(ptr noundef @.str.6, ptr noundef %22), !dbg !315
  %24 = load ptr, ptr @program_name, align 8, !dbg !316
  %25 = load ptr, ptr @program_name, align 8, !dbg !317
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %24, ptr noundef %25), !dbg !318
  call void @emit_ancillary_info(ptr noundef @.str.8), !dbg !319
  br label %27

27:                                               ; preds = %11, %10
  %28 = load i32, ptr %2, align 4, !dbg !320
  call void @exit(i32 noundef %28) #10, !dbg !321
  unreachable, !dbg !321
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @"\01_fputs"(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @emit_stdin_note() #3 !dbg !322 {
  %1 = load ptr, ptr @__stdoutp, align 8, !dbg !325
  %2 = call i32 @"\01_fputs"(ptr noundef @.str.30, ptr noundef %1), !dbg !326
  ret void, !dbg !327
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @emit_ancillary_info(ptr noundef %0) #3 !dbg !328 {
  %2 = alloca ptr, align 8
  %3 = alloca [7 x %struct.infomap], align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !331, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata ptr %3, metadata !333, metadata !DIExpression()), !dbg !340
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 @__const.emit_ancillary_info.infomap, i64 112, i1 false), !dbg !340
  call void @llvm.dbg.declare(metadata ptr %4, metadata !341, metadata !DIExpression()), !dbg !342
  %8 = load ptr, ptr %2, align 8, !dbg !343
  store ptr %8, ptr %4, align 8, !dbg !342
  call void @llvm.dbg.declare(metadata ptr %5, metadata !344, metadata !DIExpression()), !dbg !346
  %9 = getelementptr inbounds [7 x %struct.infomap], ptr %3, i64 0, i64 0, !dbg !347
  store ptr %9, ptr %5, align 8, !dbg !346
  br label %10, !dbg !348

10:                                               ; preds = %25, %1
  %11 = load ptr, ptr %5, align 8, !dbg !349
  %12 = getelementptr inbounds %struct.infomap, ptr %11, i32 0, i32 0, !dbg !350
  %13 = load ptr, ptr %12, align 8, !dbg !350
  %14 = icmp ne ptr %13, null, !dbg !349
  br i1 %14, label %15, label %23, !dbg !351

15:                                               ; preds = %10
  %16 = load ptr, ptr %2, align 8, !dbg !352
  %17 = load ptr, ptr %5, align 8, !dbg !352
  %18 = getelementptr inbounds %struct.infomap, ptr %17, i32 0, i32 0, !dbg !352
  %19 = load ptr, ptr %18, align 8, !dbg !352
  %20 = call i32 @strcmp(ptr noundef %16, ptr noundef %19), !dbg !352
  %21 = icmp eq i32 %20, 0, !dbg !352
  %22 = xor i1 %21, true, !dbg !353
  br label %23

23:                                               ; preds = %15, %10
  %24 = phi i1 [ false, %10 ], [ %22, %15 ], !dbg !354
  br i1 %24, label %25, label %28, !dbg !348

25:                                               ; preds = %23
  %26 = load ptr, ptr %5, align 8, !dbg !355
  %27 = getelementptr inbounds %struct.infomap, ptr %26, i32 1, !dbg !355
  store ptr %27, ptr %5, align 8, !dbg !355
  br label %10, !dbg !348, !llvm.loop !356

28:                                               ; preds = %23
  %29 = load ptr, ptr %5, align 8, !dbg !358
  %30 = getelementptr inbounds %struct.infomap, ptr %29, i32 0, i32 1, !dbg !360
  %31 = load ptr, ptr %30, align 8, !dbg !360
  %32 = icmp ne ptr %31, null, !dbg !358
  br i1 %32, label %33, label %37, !dbg !361

33:                                               ; preds = %28
  %34 = load ptr, ptr %5, align 8, !dbg !362
  %35 = getelementptr inbounds %struct.infomap, ptr %34, i32 0, i32 1, !dbg !363
  %36 = load ptr, ptr %35, align 8, !dbg !363
  store ptr %36, ptr %4, align 8, !dbg !364
  br label %37, !dbg !365

37:                                               ; preds = %33, %28
  call void @emit_bug_reporting_address(), !dbg !366
  call void @llvm.dbg.declare(metadata ptr %6, metadata !367, metadata !DIExpression()), !dbg !368
  %38 = call ptr @setlocale(i32 noundef 6, ptr noundef null), !dbg !369
  store ptr %38, ptr %6, align 8, !dbg !368
  %39 = load ptr, ptr %6, align 8, !dbg !370
  %40 = icmp ne ptr %39, null, !dbg !370
  br i1 %40, label %41, label %48, !dbg !372

41:                                               ; preds = %37
  %42 = load ptr, ptr %6, align 8, !dbg !373
  %43 = call i32 @strncmp(ptr noundef %42, ptr noundef @.str.40, i64 noundef 3), !dbg !373
  %44 = icmp ne i32 %43, 0, !dbg !373
  br i1 %44, label %45, label %48, !dbg !374

45:                                               ; preds = %41
  %46 = load ptr, ptr @__stdoutp, align 8, !dbg !375
  %47 = call i32 @"\01_fputs"(ptr noundef @.str.41, ptr noundef %46), !dbg !377
  br label %48, !dbg !378

48:                                               ; preds = %45, %41, %37
  call void @llvm.dbg.declare(metadata ptr %7, metadata !379, metadata !DIExpression()), !dbg !380
  %49 = load ptr, ptr %2, align 8, !dbg !381
  %50 = call i32 @strcmp(ptr noundef %49, ptr noundef @.str.31), !dbg !381
  %51 = icmp eq i32 %50, 0, !dbg !381
  br i1 %51, label %52, label %53, !dbg !381

52:                                               ; preds = %48
  br label %55, !dbg !381

53:                                               ; preds = %48
  %54 = load ptr, ptr %2, align 8, !dbg !382
  br label %55, !dbg !381

55:                                               ; preds = %53, %52
  %56 = phi ptr [ @.str.42, %52 ], [ %54, %53 ], !dbg !381
  store ptr %56, ptr %7, align 8, !dbg !380
  %57 = load ptr, ptr %7, align 8, !dbg !383
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.43, ptr noundef @.str.44, ptr noundef %57), !dbg !384
  %59 = load ptr, ptr %4, align 8, !dbg !385
  %60 = load ptr, ptr %4, align 8, !dbg !386
  %61 = load ptr, ptr %2, align 8, !dbg !387
  %62 = icmp eq ptr %60, %61, !dbg !388
  %63 = zext i1 %62 to i64, !dbg !386
  %64 = select i1 %62, ptr @.str.46, ptr @.str.18, !dbg !386
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.45, ptr noundef %59, ptr noundef %64), !dbg !389
  ret void, !dbg !390
}

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #3 !dbg !46 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca %struct.stat, align 8
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
  %18 = alloca i64, align 8
  %19 = alloca i32, align 4
  %20 = alloca i8, align 1
  %21 = alloca i8, align 1
  %22 = alloca i32, align 4
  %23 = alloca i8, align 1
  %24 = alloca i64, align 8
  %25 = alloca i8, align 1
  %26 = alloca i64, align 8
  %27 = alloca i64, align 8
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca i32, align 4
  %31 = alloca i64, align 8
  %32 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !391, metadata !DIExpression()), !dbg !392
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !393, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.declare(metadata ptr %6, metadata !395, metadata !DIExpression()), !dbg !396
  store i8 0, ptr %6, align 1, !dbg !396
  call void @llvm.dbg.declare(metadata ptr %7, metadata !397, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.declare(metadata ptr %8, metadata !460, metadata !DIExpression()), !dbg !461
  store i8 0, ptr %8, align 1, !dbg !461
  call void @llvm.dbg.declare(metadata ptr %9, metadata !462, metadata !DIExpression()), !dbg !463
  store i8 0, ptr %9, align 1, !dbg !463
  call void @llvm.dbg.declare(metadata ptr %10, metadata !464, metadata !DIExpression()), !dbg !465
  store i8 0, ptr %10, align 1, !dbg !465
  call void @llvm.dbg.declare(metadata ptr %11, metadata !466, metadata !DIExpression()), !dbg !467
  store i8 0, ptr %11, align 1, !dbg !467
  call void @llvm.dbg.declare(metadata ptr %12, metadata !468, metadata !DIExpression()), !dbg !469
  store i8 0, ptr %12, align 1, !dbg !469
  call void @llvm.dbg.declare(metadata ptr %13, metadata !470, metadata !DIExpression()), !dbg !471
  store i8 0, ptr %13, align 1, !dbg !471
  call void @llvm.dbg.declare(metadata ptr %14, metadata !472, metadata !DIExpression()), !dbg !473
  store i32 0, ptr %14, align 4, !dbg !473
  %33 = load ptr, ptr %5, align 8, !dbg !474
  %34 = getelementptr inbounds ptr, ptr %33, i64 0, !dbg !474
  %35 = load ptr, ptr %34, align 8, !dbg !474
  call void @set_program_name(ptr noundef %35), !dbg !475
  %36 = call ptr @setlocale(i32 noundef 0, ptr noundef @.str.18), !dbg !476
  %37 = call i32 @atexit(ptr noundef @close_stdout), !dbg !477
  call void @llvm.dbg.declare(metadata ptr %15, metadata !478, metadata !DIExpression()), !dbg !479
  br label %38, !dbg !480

38:                                               ; preds = %62, %2
  %39 = load i32, ptr %4, align 4, !dbg !481
  %40 = load ptr, ptr %5, align 8, !dbg !482
  %41 = call i32 @rpl_getopt_long(i32 noundef %39, ptr noundef %40, ptr noundef @.str.19, ptr noundef @main.long_options, ptr noundef null), !dbg !483
  store i32 %41, ptr %15, align 4, !dbg !484
  %42 = icmp ne i32 %41, -1, !dbg !485
  br i1 %42, label %43, label %63, !dbg !480

43:                                               ; preds = %38
  %44 = load i32, ptr %15, align 4, !dbg !486
  switch i32 %44, label %61 [
    i32 98, label %45
    i32 101, label %46
    i32 110, label %47
    i32 115, label %48
    i32 116, label %49
    i32 117, label %50
    i32 118, label %51
    i32 65, label %52
    i32 69, label %53
    i32 84, label %54
    i32 -130, label %55
    i32 -131, label %56
  ], !dbg !488

45:                                               ; preds = %43
  store i8 1, ptr %8, align 1, !dbg !489
  store i8 1, ptr %9, align 1, !dbg !491
  br label %62, !dbg !492

46:                                               ; preds = %43
  store i8 1, ptr %11, align 1, !dbg !493
  store i8 1, ptr %12, align 1, !dbg !494
  br label %62, !dbg !495

47:                                               ; preds = %43
  store i8 1, ptr %8, align 1, !dbg !496
  br label %62, !dbg !497

48:                                               ; preds = %43
  store i8 1, ptr %10, align 1, !dbg !498
  br label %62, !dbg !499

49:                                               ; preds = %43
  store i8 1, ptr %13, align 1, !dbg !500
  store i8 1, ptr %12, align 1, !dbg !501
  br label %62, !dbg !502

50:                                               ; preds = %43
  br label %62, !dbg !503

51:                                               ; preds = %43
  store i8 1, ptr %12, align 1, !dbg !504
  br label %62, !dbg !505

52:                                               ; preds = %43
  store i8 1, ptr %12, align 1, !dbg !506
  store i8 1, ptr %11, align 1, !dbg !507
  store i8 1, ptr %13, align 1, !dbg !508
  br label %62, !dbg !509

53:                                               ; preds = %43
  store i8 1, ptr %11, align 1, !dbg !510
  br label %62, !dbg !511

54:                                               ; preds = %43
  store i8 1, ptr %13, align 1, !dbg !512
  br label %62, !dbg !513

55:                                               ; preds = %43
  call void @usage(i32 noundef 0) #10, !dbg !514
  unreachable, !dbg !514

56:                                               ; preds = %43
  %57 = load ptr, ptr @__stdoutp, align 8, !dbg !515
  %58 = load ptr, ptr @Version, align 8, !dbg !515
  %59 = call ptr @proper_name_lite(ptr noundef @.str.21, ptr noundef @.str.22), !dbg !515
  %60 = call ptr @proper_name_lite(ptr noundef @.str.23, ptr noundef @.str.23), !dbg !515
  call void (ptr, ptr, ptr, ptr, ...) @version_etc(ptr noundef %57, ptr noundef @.str.8, ptr noundef @.str.20, ptr noundef %58, ptr noundef %59, ptr noundef %60, ptr noundef null), !dbg !515
  call void @exit(i32 noundef 0) #10, !dbg !515
  unreachable, !dbg !515

61:                                               ; preds = %43
  call void @usage(i32 noundef 1) #10, !dbg !516
  unreachable, !dbg !516

62:                                               ; preds = %54, %53, %52, %51, %50, %49, %48, %47, %46, %45
  br label %38, !dbg !480, !llvm.loop !517

63:                                               ; preds = %38
  %64 = call i32 @rpl_fstat(i32 noundef 1, ptr noundef %7), !dbg !519
  %65 = icmp slt i32 %64, 0, !dbg !521
  br i1 %65, label %66, label %69, !dbg !522

66:                                               ; preds = %63
  %67 = call ptr @__error(), !dbg !523
  %68 = load i32, ptr %67, align 4, !dbg !523
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %68, ptr noundef @.str.24) #11, !dbg !523
  unreachable, !dbg !523

69:                                               ; preds = %63
  call void @llvm.dbg.declare(metadata ptr %16, metadata !524, metadata !DIExpression()), !dbg !529
  %70 = call i64 @io_blksize(ptr noundef %7), !dbg !530
  store i64 %70, ptr %16, align 8, !dbg !529
  call void @llvm.dbg.declare(metadata ptr %17, metadata !531, metadata !DIExpression()), !dbg !532
  call void @llvm.dbg.declare(metadata ptr %18, metadata !533, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.declare(metadata ptr %19, metadata !538, metadata !DIExpression()), !dbg !539
  store i32 -2, ptr %19, align 4, !dbg !539
  call void @llvm.dbg.declare(metadata ptr %20, metadata !540, metadata !DIExpression()), !dbg !541
  store i8 1, ptr %20, align 1, !dbg !541
  %71 = load i8, ptr %20, align 1, !dbg !542
  %72 = trunc i8 %71 to i1, !dbg !542
  br i1 %72, label %73, label %78, !dbg !544

73:                                               ; preds = %69
  %74 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 0, !dbg !545
  %75 = load i32, ptr %74, align 8, !dbg !545
  store i32 %75, ptr %17, align 4, !dbg !547
  %76 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !548
  %77 = load i64, ptr %76, align 8, !dbg !548
  store i64 %77, ptr %18, align 8, !dbg !549
  br label %78, !dbg !550

78:                                               ; preds = %73, %69
  call void @llvm.dbg.declare(metadata ptr %21, metadata !551, metadata !DIExpression()), !dbg !552
  %79 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !553
  %80 = load i16, ptr %79, align 4, !dbg !553
  %81 = zext i16 %80 to i32, !dbg !553
  %82 = and i32 %81, 61440, !dbg !553
  %83 = icmp eq i32 %82, 32768, !dbg !553
  %84 = zext i1 %83 to i32, !dbg !553
  %85 = icmp ne i32 %84, 0, !dbg !554
  %86 = zext i1 %85 to i8, !dbg !552
  store i8 %86, ptr %21, align 1, !dbg !552
  %87 = load i8, ptr %8, align 1, !dbg !555
  %88 = trunc i8 %87 to i1, !dbg !555
  br i1 %88, label %98, label %89, !dbg !557

89:                                               ; preds = %78
  %90 = load i8, ptr %11, align 1, !dbg !558
  %91 = trunc i8 %90 to i1, !dbg !558
  br i1 %91, label %98, label %92, !dbg !559

92:                                               ; preds = %89
  %93 = load i8, ptr %10, align 1, !dbg !560
  %94 = trunc i8 %93 to i1, !dbg !560
  br i1 %94, label %98, label %95, !dbg !561

95:                                               ; preds = %92
  %96 = load i32, ptr %14, align 4, !dbg !562
  %97 = or i32 %96, 0, !dbg !562
  store i32 %97, ptr %14, align 4, !dbg !562
  call void @xset_binary_mode(i32 noundef 1, i32 noundef 0), !dbg !564
  br label %98, !dbg !565

98:                                               ; preds = %95, %92, %89, %78
  store ptr @.str.25, ptr @infile, align 8, !dbg !566
  call void @llvm.dbg.declare(metadata ptr %22, metadata !567, metadata !DIExpression()), !dbg !568
  %99 = load i32, ptr @rpl_optind, align 4, !dbg !569
  store i32 %99, ptr %22, align 4, !dbg !568
  call void @llvm.dbg.declare(metadata ptr %23, metadata !570, metadata !DIExpression()), !dbg !571
  store i8 1, ptr %23, align 1, !dbg !571
  call void @llvm.dbg.declare(metadata ptr %24, metadata !572, metadata !DIExpression()), !dbg !573
  %100 = call i32 @getpagesize() #12, !dbg !574
  %101 = sext i32 %100 to i64, !dbg !574
  store i64 %101, ptr %24, align 8, !dbg !573
  br label %102, !dbg !575

102:                                              ; preds = %333, %98
  %103 = load i32, ptr %22, align 4, !dbg !576
  %104 = load i32, ptr %4, align 4, !dbg !579
  %105 = icmp slt i32 %103, %104, !dbg !580
  br i1 %105, label %106, label %112, !dbg !581

106:                                              ; preds = %102
  %107 = load ptr, ptr %5, align 8, !dbg !582
  %108 = load i32, ptr %22, align 4, !dbg !583
  %109 = sext i32 %108 to i64, !dbg !582
  %110 = getelementptr inbounds ptr, ptr %107, i64 %109, !dbg !582
  %111 = load ptr, ptr %110, align 8, !dbg !582
  store ptr %111, ptr @infile, align 8, !dbg !584
  br label %112, !dbg !585

112:                                              ; preds = %106, %102
  call void @llvm.dbg.declare(metadata ptr %25, metadata !586, metadata !DIExpression()), !dbg !587
  %113 = load ptr, ptr @infile, align 8, !dbg !588
  %114 = call i32 @strcmp(ptr noundef %113, ptr noundef @.str.25), !dbg !588
  %115 = icmp eq i32 %114, 0, !dbg !588
  %116 = zext i1 %115 to i8, !dbg !587
  store i8 %116, ptr %25, align 1, !dbg !587
  %117 = load i8, ptr %25, align 1, !dbg !589
  %118 = trunc i8 %117 to i1, !dbg !589
  br i1 %118, label %119, label %125, !dbg !591

119:                                              ; preds = %112
  store i8 1, ptr %6, align 1, !dbg !592
  store i32 0, ptr @input_desc, align 4, !dbg !594
  %120 = load i32, ptr %14, align 4, !dbg !595
  %121 = and i32 %120, 0, !dbg !597
  %122 = icmp ne i32 %121, 0, !dbg !597
  br i1 %122, label %123, label %124, !dbg !598

123:                                              ; preds = %119
  call void @xset_binary_mode(i32 noundef 0, i32 noundef 0), !dbg !599
  br label %124, !dbg !599

124:                                              ; preds = %123, %119
  br label %137, !dbg !600

125:                                              ; preds = %112
  %126 = load ptr, ptr @infile, align 8, !dbg !601
  %127 = load i32, ptr %14, align 4, !dbg !603
  %128 = call i32 (ptr, i32, ...) @rpl_open(ptr noundef %126, i32 noundef %127), !dbg !604
  store i32 %128, ptr @input_desc, align 4, !dbg !605
  %129 = load i32, ptr @input_desc, align 4, !dbg !606
  %130 = icmp slt i32 %129, 0, !dbg !608
  br i1 %130, label %131, label %136, !dbg !609

131:                                              ; preds = %125
  %132 = call ptr @__error(), !dbg !610
  %133 = load i32, ptr %132, align 4, !dbg !610
  %134 = load ptr, ptr @infile, align 8, !dbg !610
  %135 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %134), !dbg !610
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %133, ptr noundef @.str.26, ptr noundef %135) #11, !dbg !610
  store i8 0, ptr %23, align 1, !dbg !612
  br label %333, !dbg !613

136:                                              ; preds = %125
  br label %137

137:                                              ; preds = %136, %124
  %138 = load i32, ptr @input_desc, align 4, !dbg !614
  %139 = call i32 @rpl_fstat(i32 noundef %138, ptr noundef %7), !dbg !616
  %140 = icmp slt i32 %139, 0, !dbg !617
  br i1 %140, label %141, label %146, !dbg !618

141:                                              ; preds = %137
  %142 = call ptr @__error(), !dbg !619
  %143 = load i32, ptr %142, align 4, !dbg !619
  %144 = load ptr, ptr @infile, align 8, !dbg !619
  %145 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %144), !dbg !619
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %143, ptr noundef @.str.26, ptr noundef %145) #11, !dbg !619
  store i8 0, ptr %23, align 1, !dbg !621
  br label %320, !dbg !622

146:                                              ; preds = %137
  call void @llvm.dbg.declare(metadata ptr %26, metadata !623, metadata !DIExpression()), !dbg !624
  %147 = call i64 @io_blksize(ptr noundef %7), !dbg !625
  store i64 %147, ptr %26, align 8, !dbg !624
  %148 = load i32, ptr @input_desc, align 4, !dbg !626
  call void @fdadvise(i32 noundef %148, i64 noundef 0, i64 noundef 0, i32 noundef 1), !dbg !627
  %149 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !628
  %150 = load i16, ptr %149, align 4, !dbg !628
  %151 = zext i16 %150 to i32, !dbg !628
  %152 = and i32 %151, 61440, !dbg !628
  %153 = icmp eq i32 %152, 4096, !dbg !628
  br i1 %153, label %203, label %154, !dbg !630

154:                                              ; preds = %146
  %155 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !631
  %156 = load i16, ptr %155, align 4, !dbg !631
  %157 = zext i16 %156 to i32, !dbg !631
  %158 = and i32 %157, 61440, !dbg !631
  %159 = icmp eq i32 %158, 49152, !dbg !631
  br i1 %159, label %203, label %160, !dbg !632

160:                                              ; preds = %154
  %161 = load i8, ptr %20, align 1, !dbg !633
  %162 = trunc i8 %161 to i1, !dbg !633
  br i1 %162, label %163, label %203, !dbg !634

163:                                              ; preds = %160
  %164 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 0, !dbg !635
  %165 = load i32, ptr %164, align 8, !dbg !635
  %166 = load i32, ptr %17, align 4, !dbg !636
  %167 = icmp eq i32 %165, %166, !dbg !637
  br i1 %167, label %168, label %203, !dbg !638

168:                                              ; preds = %163
  %169 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !639
  %170 = load i64, ptr %169, align 8, !dbg !639
  %171 = load i64, ptr %18, align 8, !dbg !640
  %172 = icmp eq i64 %170, %171, !dbg !641
  br i1 %172, label %173, label %203, !dbg !642

173:                                              ; preds = %168
  call void @llvm.dbg.declare(metadata ptr %27, metadata !643, metadata !DIExpression()), !dbg !645
  %174 = load i32, ptr @input_desc, align 4, !dbg !646
  %175 = call i64 @lseek(i32 noundef %174, i64 noundef 0, i32 noundef 1), !dbg !647
  store i64 %175, ptr %27, align 8, !dbg !645
  %176 = load i64, ptr %27, align 8, !dbg !648
  %177 = icmp sle i64 0, %176, !dbg !650
  br i1 %177, label %178, label %202, !dbg !651

178:                                              ; preds = %173
  %179 = load i32, ptr %19, align 4, !dbg !652
  %180 = icmp slt i32 %179, -1, !dbg !655
  br i1 %180, label %181, label %183, !dbg !656

181:                                              ; preds = %178
  %182 = call i32 (i32, i32, ...) @"\01_fcntl"(i32 noundef 1, i32 noundef 3), !dbg !657
  store i32 %182, ptr %19, align 4, !dbg !658
  br label %183, !dbg !659

183:                                              ; preds = %181, %178
  call void @llvm.dbg.declare(metadata ptr %28, metadata !660, metadata !DIExpression()), !dbg !661
  %184 = load i32, ptr %19, align 4, !dbg !662
  %185 = icmp sle i32 0, %184, !dbg !663
  br i1 %185, label %186, label %190, !dbg !664

186:                                              ; preds = %183
  %187 = load i32, ptr %19, align 4, !dbg !665
  %188 = and i32 %187, 8, !dbg !666
  %189 = icmp ne i32 %188, 0, !dbg !664
  br label %190

190:                                              ; preds = %186, %183
  %191 = phi i1 [ false, %183 ], [ %189, %186 ], !dbg !667
  %192 = zext i1 %191 to i64, !dbg !668
  %193 = select i1 %191, i32 2, i32 1, !dbg !668
  store i32 %193, ptr %28, align 4, !dbg !661
  %194 = load i64, ptr %27, align 8, !dbg !669
  %195 = load i32, ptr %28, align 4, !dbg !671
  %196 = call i64 @lseek(i32 noundef 1, i64 noundef 0, i32 noundef %195), !dbg !672
  %197 = icmp slt i64 %194, %196, !dbg !673
  br i1 %197, label %198, label %201, !dbg !674

198:                                              ; preds = %190
  %199 = load ptr, ptr @infile, align 8, !dbg !675
  %200 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %199), !dbg !675
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef 0, ptr noundef @.str.27, ptr noundef %200) #11, !dbg !675
  store i8 0, ptr %23, align 1, !dbg !677
  br label %320, !dbg !678

201:                                              ; preds = %190
  br label %202, !dbg !679

202:                                              ; preds = %201, %173
  br label %203, !dbg !680

203:                                              ; preds = %202, %168, %163, %160, %154, %146
  call void @llvm.dbg.declare(metadata ptr %29, metadata !681, metadata !DIExpression()), !dbg !682
  %204 = load i8, ptr %8, align 1, !dbg !683
  %205 = trunc i8 %204 to i1, !dbg !683
  br i1 %205, label %268, label %206, !dbg !685

206:                                              ; preds = %203
  %207 = load i8, ptr %11, align 1, !dbg !686
  %208 = trunc i8 %207 to i1, !dbg !686
  br i1 %208, label %268, label %209, !dbg !687

209:                                              ; preds = %206
  %210 = load i8, ptr %12, align 1, !dbg !688
  %211 = trunc i8 %210 to i1, !dbg !688
  br i1 %211, label %268, label %212, !dbg !689

212:                                              ; preds = %209
  %213 = load i8, ptr %13, align 1, !dbg !690
  %214 = trunc i8 %213 to i1, !dbg !690
  br i1 %214, label %268, label %215, !dbg !691

215:                                              ; preds = %212
  %216 = load i8, ptr %10, align 1, !dbg !692
  %217 = trunc i8 %216 to i1, !dbg !692
  br i1 %217, label %268, label %218, !dbg !693

218:                                              ; preds = %215
  call void @llvm.dbg.declare(metadata ptr %30, metadata !694, metadata !DIExpression()), !dbg !696
  %219 = load i8, ptr %21, align 1, !dbg !697
  %220 = trunc i8 %219 to i1, !dbg !697
  br i1 %220, label %221, label %229, !dbg !698

221:                                              ; preds = %218
  %222 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !699
  %223 = load i16, ptr %222, align 4, !dbg !699
  %224 = zext i16 %223 to i32, !dbg !699
  %225 = and i32 %224, 61440, !dbg !699
  %226 = icmp eq i32 %225, 32768, !dbg !699
  br i1 %226, label %227, label %229, !dbg !697

227:                                              ; preds = %221
  %228 = call i32 @copy_cat(), !dbg !700
  br label %230, !dbg !697

229:                                              ; preds = %221, %218
  br label %230, !dbg !697

230:                                              ; preds = %229, %227
  %231 = phi i32 [ %228, %227 ], [ 0, %229 ], !dbg !697
  store i32 %231, ptr %30, align 4, !dbg !696
  %232 = load i32, ptr %30, align 4, !dbg !701
  %233 = icmp ne i32 %232, 0, !dbg !703
  br i1 %233, label %234, label %244, !dbg !704

234:                                              ; preds = %230
  store ptr null, ptr %29, align 8, !dbg !705
  %235 = load i32, ptr %30, align 4, !dbg !707
  %236 = icmp slt i32 0, %235, !dbg !708
  %237 = zext i1 %236 to i32, !dbg !708
  %238 = load i8, ptr %23, align 1, !dbg !709
  %239 = trunc i8 %238 to i1, !dbg !709
  %240 = zext i1 %239 to i32, !dbg !709
  %241 = and i32 %240, %237, !dbg !709
  %242 = icmp ne i32 %241, 0, !dbg !709
  %243 = zext i1 %242 to i8, !dbg !709
  store i8 %243, ptr %23, align 1, !dbg !709
  br label %267, !dbg !710

244:                                              ; preds = %230
  %245 = load i64, ptr %26, align 8, !dbg !711
  %246 = load i64, ptr %16, align 8, !dbg !711
  %247 = icmp sgt i64 %245, %246, !dbg !711
  br i1 %247, label %248, label %250, !dbg !711

248:                                              ; preds = %244
  %249 = load i64, ptr %26, align 8, !dbg !711
  br label %252, !dbg !711

250:                                              ; preds = %244
  %251 = load i64, ptr %16, align 8, !dbg !711
  br label %252, !dbg !711

252:                                              ; preds = %250, %248
  %253 = phi i64 [ %249, %248 ], [ %251, %250 ], !dbg !711
  store i64 %253, ptr %26, align 8, !dbg !713
  %254 = load i64, ptr %24, align 8, !dbg !714
  %255 = load i64, ptr %26, align 8, !dbg !715
  %256 = call noalias nonnull ptr @xalignalloc(i64 noundef %254, i64 noundef %255) #13, !dbg !716
  store ptr %256, ptr %29, align 8, !dbg !717
  %257 = load ptr, ptr %29, align 8, !dbg !718
  %258 = load i64, ptr %26, align 8, !dbg !719
  %259 = call zeroext i1 @simple_cat(ptr noundef %257, i64 noundef %258), !dbg !720
  %260 = zext i1 %259 to i32, !dbg !720
  %261 = load i8, ptr %23, align 1, !dbg !721
  %262 = trunc i8 %261 to i1, !dbg !721
  %263 = zext i1 %262 to i32, !dbg !721
  %264 = and i32 %263, %260, !dbg !721
  %265 = icmp ne i32 %264, 0, !dbg !721
  %266 = zext i1 %265 to i8, !dbg !721
  store i8 %266, ptr %23, align 1, !dbg !721
  br label %267

267:                                              ; preds = %252, %234
  br label %318, !dbg !722

268:                                              ; preds = %215, %212, %209, %206, %203
  %269 = load i64, ptr %24, align 8, !dbg !723
  %270 = load i64, ptr %26, align 8, !dbg !725
  %271 = add nsw i64 %270, 1, !dbg !726
  %272 = call noalias nonnull ptr @xalignalloc(i64 noundef %269, i64 noundef %271) #13, !dbg !727
  store ptr %272, ptr %29, align 8, !dbg !728
  call void @llvm.dbg.declare(metadata ptr %31, metadata !729, metadata !DIExpression()), !dbg !730
  %273 = load i64, ptr %26, align 8, !dbg !731
  %274 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %273, i64 4), !dbg !731
  %275 = extractvalue { i64, i1 } %274, 1, !dbg !731
  %276 = extractvalue { i64, i1 } %274, 0, !dbg !731
  store i64 %276, ptr %31, align 8, !dbg !731
  br i1 %275, label %288, label %277, !dbg !733

277:                                              ; preds = %268
  %278 = load i64, ptr %31, align 8, !dbg !734
  %279 = load i64, ptr %16, align 8, !dbg !734
  %280 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %278, i64 %279), !dbg !734
  %281 = extractvalue { i64, i1 } %280, 1, !dbg !734
  %282 = extractvalue { i64, i1 } %280, 0, !dbg !734
  store i64 %282, ptr %31, align 8, !dbg !734
  br i1 %281, label %288, label %283, !dbg !735

283:                                              ; preds = %277
  %284 = load i64, ptr %31, align 8, !dbg !736
  %285 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %284, i64 19), !dbg !736
  %286 = extractvalue { i64, i1 } %285, 1, !dbg !736
  %287 = extractvalue { i64, i1 } %285, 0, !dbg !736
  store i64 %287, ptr %31, align 8, !dbg !736
  br i1 %286, label %288, label %289, !dbg !737

288:                                              ; preds = %283, %277, %268
  call void @xalloc_die() #10, !dbg !738
  unreachable, !dbg !738

289:                                              ; preds = %283
  call void @llvm.dbg.declare(metadata ptr %32, metadata !739, metadata !DIExpression()), !dbg !740
  %290 = load i64, ptr %24, align 8, !dbg !741
  %291 = load i64, ptr %31, align 8, !dbg !742
  %292 = call noalias nonnull ptr @xalignalloc(i64 noundef %290, i64 noundef %291) #13, !dbg !743
  store ptr %292, ptr %32, align 8, !dbg !740
  %293 = load ptr, ptr %29, align 8, !dbg !744
  %294 = load i64, ptr %26, align 8, !dbg !745
  %295 = load ptr, ptr %32, align 8, !dbg !746
  %296 = load i64, ptr %16, align 8, !dbg !747
  %297 = load i8, ptr %12, align 1, !dbg !748
  %298 = trunc i8 %297 to i1, !dbg !748
  %299 = load i8, ptr %13, align 1, !dbg !749
  %300 = trunc i8 %299 to i1, !dbg !749
  %301 = load i8, ptr %8, align 1, !dbg !750
  %302 = trunc i8 %301 to i1, !dbg !750
  %303 = load i8, ptr %9, align 1, !dbg !751
  %304 = trunc i8 %303 to i1, !dbg !751
  %305 = load i8, ptr %11, align 1, !dbg !752
  %306 = trunc i8 %305 to i1, !dbg !752
  %307 = load i8, ptr %10, align 1, !dbg !753
  %308 = trunc i8 %307 to i1, !dbg !753
  %309 = call zeroext i1 @cat(ptr noundef %293, i64 noundef %294, ptr noundef %295, i64 noundef %296, i1 noundef zeroext %298, i1 noundef zeroext %300, i1 noundef zeroext %302, i1 noundef zeroext %304, i1 noundef zeroext %306, i1 noundef zeroext %308), !dbg !754
  %310 = zext i1 %309 to i32, !dbg !754
  %311 = load i8, ptr %23, align 1, !dbg !755
  %312 = trunc i8 %311 to i1, !dbg !755
  %313 = zext i1 %312 to i32, !dbg !755
  %314 = and i32 %313, %310, !dbg !755
  %315 = icmp ne i32 %314, 0, !dbg !755
  %316 = zext i1 %315 to i8, !dbg !755
  store i8 %316, ptr %23, align 1, !dbg !755
  %317 = load ptr, ptr %32, align 8, !dbg !756
  call void @alignfree(ptr noundef %317), !dbg !757
  br label %318

318:                                              ; preds = %289, %267
  %319 = load ptr, ptr %29, align 8, !dbg !758
  call void @alignfree(ptr noundef %319), !dbg !759
  br label %320, !dbg !759

320:                                              ; preds = %318, %198, %141
  call void @llvm.dbg.label(metadata !760), !dbg !761
  %321 = load i8, ptr %25, align 1, !dbg !762
  %322 = trunc i8 %321 to i1, !dbg !762
  br i1 %322, label %332, label %323, !dbg !764

323:                                              ; preds = %320
  %324 = load i32, ptr @input_desc, align 4, !dbg !765
  %325 = call i32 @"\01_close"(i32 noundef %324), !dbg !766
  %326 = icmp slt i32 %325, 0, !dbg !767
  br i1 %326, label %327, label %332, !dbg !768

327:                                              ; preds = %323
  %328 = call ptr @__error(), !dbg !769
  %329 = load i32, ptr %328, align 4, !dbg !769
  %330 = load ptr, ptr @infile, align 8, !dbg !769
  %331 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %330), !dbg !769
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %329, ptr noundef @.str.26, ptr noundef %331) #11, !dbg !769
  store i8 0, ptr %23, align 1, !dbg !771
  br label %332, !dbg !772

332:                                              ; preds = %327, %323, %320
  br label %333, !dbg !773

333:                                              ; preds = %332, %131
  %334 = load i32, ptr %22, align 4, !dbg !774
  %335 = add nsw i32 %334, 1, !dbg !774
  store i32 %335, ptr %22, align 4, !dbg !774
  %336 = load i32, ptr %4, align 4, !dbg !775
  %337 = icmp slt i32 %335, %336, !dbg !776
  br i1 %337, label %102, label %338, !dbg !773, !llvm.loop !777

338:                                              ; preds = %333
  %339 = load i8, ptr @pending_cr, align 1, !dbg !779
  %340 = trunc i8 %339 to i1, !dbg !779
  br i1 %340, label %341, label %346, !dbg !781

341:                                              ; preds = %338
  %342 = call i64 @full_write(i32 noundef 1, ptr noundef @.str.28, i64 noundef 1), !dbg !782
  %343 = icmp ne i64 %342, 1, !dbg !785
  br i1 %343, label %344, label %345, !dbg !786

344:                                              ; preds = %341
  call void @write_error(), !dbg !787
  br label %345, !dbg !787

345:                                              ; preds = %344, %341
  br label %346, !dbg !788

346:                                              ; preds = %345, %338
  %347 = load i8, ptr %6, align 1, !dbg !789
  %348 = trunc i8 %347 to i1, !dbg !789
  br i1 %348, label %349, label %355, !dbg !791

349:                                              ; preds = %346
  %350 = call i32 @"\01_close"(i32 noundef 0), !dbg !792
  %351 = icmp slt i32 %350, 0, !dbg !793
  br i1 %351, label %352, label %355, !dbg !794

352:                                              ; preds = %349
  %353 = call ptr @__error(), !dbg !795
  %354 = load i32, ptr %353, align 4, !dbg !795
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %354, ptr noundef @.str.29) #11, !dbg !795
  unreachable, !dbg !795

355:                                              ; preds = %349, %346
  %356 = load i8, ptr %23, align 1, !dbg !796
  %357 = trunc i8 %356 to i1, !dbg !796
  %358 = zext i1 %357 to i64, !dbg !796
  %359 = select i1 %357, i32 0, i32 1, !dbg !796
  ret i32 %359, !dbg !797
}

declare void @set_program_name(ptr noundef) #2

declare ptr @setlocale(i32 noundef, ptr noundef) #2

declare i32 @atexit(ptr noundef) #2

declare void @close_stdout() #2

declare i32 @rpl_getopt_long(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare void @version_etc(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ...) #2

declare ptr @proper_name_lite(ptr noundef, ptr noundef) #2

declare i32 @rpl_fstat(i32 noundef, ptr noundef) #2

; Function Attrs: cold
declare void @error(i32 noundef, i32 noundef, ptr noundef, ...) #5

declare ptr @__error() #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal i64 @io_blksize(ptr noundef %0) #3 !dbg !798 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !803, metadata !DIExpression()), !dbg !804
  call void @llvm.dbg.declare(metadata ptr %3, metadata !805, metadata !DIExpression()), !dbg !806
  %6 = load ptr, ptr %2, align 8, !dbg !807
  %7 = getelementptr inbounds %struct.stat, ptr %6, i32 0, i32 13, !dbg !807
  %8 = load i32, ptr %7, align 8, !dbg !807
  %9 = icmp slt i32 0, %8, !dbg !807
  br i1 %9, label %10, label %20, !dbg !807

10:                                               ; preds = %1
  %11 = load ptr, ptr %2, align 8, !dbg !807
  %12 = getelementptr inbounds %struct.stat, ptr %11, i32 0, i32 13, !dbg !807
  %13 = load i32, ptr %12, align 8, !dbg !807
  %14 = sext i32 %13 to i64, !dbg !807
  %15 = icmp ule i64 %14, 2305843009213693952, !dbg !807
  br i1 %15, label %16, label %20, !dbg !807

16:                                               ; preds = %10
  %17 = load ptr, ptr %2, align 8, !dbg !807
  %18 = getelementptr inbounds %struct.stat, ptr %17, i32 0, i32 13, !dbg !807
  %19 = load i32, ptr %18, align 8, !dbg !807
  br label %21, !dbg !807

20:                                               ; preds = %10, %1
  br label %21, !dbg !807

21:                                               ; preds = %20, %16
  %22 = phi i32 [ %19, %16 ], [ 512, %20 ], !dbg !807
  %23 = icmp sle i32 %22, 0, !dbg !808
  br i1 %23, label %24, label %25, !dbg !807

24:                                               ; preds = %21
  br label %43, !dbg !807

25:                                               ; preds = %21
  %26 = load ptr, ptr %2, align 8, !dbg !809
  %27 = getelementptr inbounds %struct.stat, ptr %26, i32 0, i32 13, !dbg !809
  %28 = load i32, ptr %27, align 8, !dbg !809
  %29 = icmp slt i32 0, %28, !dbg !809
  br i1 %29, label %30, label %40, !dbg !809

30:                                               ; preds = %25
  %31 = load ptr, ptr %2, align 8, !dbg !809
  %32 = getelementptr inbounds %struct.stat, ptr %31, i32 0, i32 13, !dbg !809
  %33 = load i32, ptr %32, align 8, !dbg !809
  %34 = sext i32 %33 to i64, !dbg !809
  %35 = icmp ule i64 %34, 2305843009213693952, !dbg !809
  br i1 %35, label %36, label %40, !dbg !809

36:                                               ; preds = %30
  %37 = load ptr, ptr %2, align 8, !dbg !809
  %38 = getelementptr inbounds %struct.stat, ptr %37, i32 0, i32 13, !dbg !809
  %39 = load i32, ptr %38, align 8, !dbg !809
  br label %41, !dbg !809

40:                                               ; preds = %30, %25
  br label %41, !dbg !809

41:                                               ; preds = %40, %36
  %42 = phi i32 [ %39, %36 ], [ 512, %40 ], !dbg !809
  br label %43, !dbg !807

43:                                               ; preds = %41, %24
  %44 = phi i32 [ 262144, %24 ], [ %42, %41 ], !dbg !807
  %45 = sext i32 %44 to i64, !dbg !807
  store i64 %45, ptr %3, align 8, !dbg !806
  %46 = load i64, ptr %3, align 8, !dbg !810
  %47 = srem i64 262143, %46, !dbg !811
  %48 = sub nsw i64 262143, %47, !dbg !812
  %49 = load i64, ptr %3, align 8, !dbg !813
  %50 = add nsw i64 %49, %48, !dbg !813
  store i64 %50, ptr %3, align 8, !dbg !813
  %51 = load ptr, ptr %2, align 8, !dbg !814
  %52 = getelementptr inbounds %struct.stat, ptr %51, i32 0, i32 1, !dbg !814
  %53 = load i16, ptr %52, align 4, !dbg !814
  %54 = zext i16 %53 to i32, !dbg !814
  %55 = and i32 %54, 61440, !dbg !814
  %56 = icmp eq i32 %55, 32768, !dbg !814
  br i1 %56, label %57, label %75, !dbg !816

57:                                               ; preds = %43
  %58 = load i64, ptr %3, align 8, !dbg !817
  %59 = load i64, ptr %3, align 8, !dbg !818
  %60 = sub nsw i64 %59, 1, !dbg !819
  %61 = and i64 %58, %60, !dbg !820
  %62 = icmp ne i64 %61, 0, !dbg !820
  br i1 %62, label %63, label %75, !dbg !821

63:                                               ; preds = %57
  call void @llvm.dbg.declare(metadata ptr %4, metadata !822, metadata !DIExpression()), !dbg !824
  %64 = load i64, ptr %3, align 8, !dbg !825
  %65 = call i32 @stdc_leading_zeros_ull(i64 noundef %64), !dbg !826
  store i32 %65, ptr %4, align 4, !dbg !824
  call void @llvm.dbg.declare(metadata ptr %5, metadata !827, metadata !DIExpression()), !dbg !830
  %66 = load i32, ptr %4, align 4, !dbg !831
  %67 = sub nsw i32 64, %66, !dbg !832
  %68 = zext i32 %67 to i64, !dbg !833
  %69 = shl i64 1, %68, !dbg !833
  store i64 %69, ptr %5, align 8, !dbg !830
  %70 = load i64, ptr %5, align 8, !dbg !834
  %71 = icmp ule i64 %70, 9223372036854775807, !dbg !836
  br i1 %71, label %72, label %74, !dbg !837

72:                                               ; preds = %63
  %73 = load i64, ptr %5, align 8, !dbg !838
  store i64 %73, ptr %3, align 8, !dbg !839
  br label %74, !dbg !840

74:                                               ; preds = %72, %63
  br label %75, !dbg !841

75:                                               ; preds = %74, %57, %43
  %76 = load i64, ptr %3, align 8, !dbg !842
  %77 = icmp ult i64 4611686018427387904, %76, !dbg !842
  br i1 %77, label %78, label %79, !dbg !842

78:                                               ; preds = %75
  br label %81, !dbg !842

79:                                               ; preds = %75
  %80 = load i64, ptr %3, align 8, !dbg !842
  br label %81, !dbg !842

81:                                               ; preds = %79, %78
  %82 = phi i64 [ 4611686018427387904, %78 ], [ %80, %79 ], !dbg !842
  ret i64 %82, !dbg !843
}

declare void @xset_binary_mode(i32 noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare i32 @getpagesize() #6

declare i32 @strcmp(ptr noundef, ptr noundef) #2

declare i32 @rpl_open(ptr noundef, i32 noundef, ...) #2

declare ptr @quotearg_n_style_colon(i32 noundef, i32 noundef, ptr noundef) #2

declare void @fdadvise(i32 noundef, i64 noundef, i64 noundef, i32 noundef) #2

declare i64 @lseek(i32 noundef, i64 noundef, i32 noundef) #2

declare i32 @"\01_fcntl"(i32 noundef, i32 noundef, ...) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal i32 @copy_cat() #3 !dbg !844 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  call void @llvm.dbg.declare(metadata ptr %2, metadata !847, metadata !DIExpression()), !dbg !851
  store i64 9223372035781033984, ptr %2, align 8, !dbg !851
  call void @llvm.dbg.declare(metadata ptr %3, metadata !852, metadata !DIExpression()), !dbg !854
  store i8 0, ptr %3, align 1, !dbg !854
  br label %4, !dbg !855

4:                                                ; preds = %47, %0
  %5 = load i32, ptr @input_desc, align 4, !dbg !856
  %6 = load i64, ptr %2, align 8, !dbg !858
  %7 = call i64 @copy_file_range(i32 noundef %5, ptr noundef null, i32 noundef 1, ptr noundef null, i64 noundef %6, i32 noundef 0), !dbg !859
  switch i64 %7, label %46 [
    i64 0, label %8
    i64 -1, label %12
  ], !dbg !860

8:                                                ; preds = %4
  %9 = load i8, ptr %3, align 1, !dbg !861
  %10 = trunc i8 %9 to i1, !dbg !861
  %11 = zext i1 %10 to i32, !dbg !861
  store i32 %11, ptr %1, align 4, !dbg !863
  br label %48, !dbg !863

12:                                               ; preds = %4
  %13 = call ptr @__error(), !dbg !864
  %14 = load i32, ptr %13, align 4, !dbg !864
  %15 = icmp eq i32 %14, 78, !dbg !866
  br i1 %15, label %40, label %16, !dbg !867

16:                                               ; preds = %12
  %17 = call ptr @__error(), !dbg !868
  %18 = load i32, ptr %17, align 4, !dbg !868
  %19 = call zeroext i1 @is_ENOTSUP(i32 noundef %18), !dbg !869
  br i1 %19, label %40, label %20, !dbg !870

20:                                               ; preds = %16
  %21 = call ptr @__error(), !dbg !871
  %22 = load i32, ptr %21, align 4, !dbg !871
  %23 = icmp eq i32 %22, 22, !dbg !872
  br i1 %23, label %40, label %24, !dbg !873

24:                                               ; preds = %20
  %25 = call ptr @__error(), !dbg !874
  %26 = load i32, ptr %25, align 4, !dbg !874
  %27 = icmp eq i32 %26, 9, !dbg !875
  br i1 %27, label %40, label %28, !dbg !876

28:                                               ; preds = %24
  %29 = call ptr @__error(), !dbg !877
  %30 = load i32, ptr %29, align 4, !dbg !877
  %31 = icmp eq i32 %30, 18, !dbg !878
  br i1 %31, label %40, label %32, !dbg !879

32:                                               ; preds = %28
  %33 = call ptr @__error(), !dbg !880
  %34 = load i32, ptr %33, align 4, !dbg !880
  %35 = icmp eq i32 %34, 26, !dbg !881
  br i1 %35, label %40, label %36, !dbg !882

36:                                               ; preds = %32
  %37 = call ptr @__error(), !dbg !883
  %38 = load i32, ptr %37, align 4, !dbg !883
  %39 = icmp eq i32 %38, 1, !dbg !884
  br i1 %39, label %40, label %41, !dbg !885

40:                                               ; preds = %36, %32, %28, %24, %20, %16, %12
  store i32 0, ptr %1, align 4, !dbg !886
  br label %48, !dbg !886

41:                                               ; preds = %36
  %42 = call ptr @__error(), !dbg !887
  %43 = load i32, ptr %42, align 4, !dbg !887
  %44 = load ptr, ptr @infile, align 8, !dbg !887
  %45 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %44), !dbg !887
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %43, ptr noundef @.str.26, ptr noundef %45) #11, !dbg !887
  store i32 -1, ptr %1, align 4, !dbg !888
  br label %48, !dbg !888

46:                                               ; preds = %4
  br label %47, !dbg !889

47:                                               ; preds = %46
  store i8 1, ptr %3, align 1, !dbg !890
  br label %4, !dbg !891, !llvm.loop !892

48:                                               ; preds = %41, %40, %8
  %49 = load i32, ptr %1, align 4, !dbg !895
  ret i32 %49, !dbg !895
}

; Function Attrs: allocsize(1)
declare noalias nonnull ptr @xalignalloc(i64 noundef, i64 noundef) #7

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal zeroext i1 @simple_cat(ptr noundef %0, i64 noundef %1) #3 !dbg !896 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !899, metadata !DIExpression()), !dbg !900
  store i64 %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !901, metadata !DIExpression()), !dbg !902
  br label %7, !dbg !903

7:                                                ; preds = %2, %30
  call void @llvm.dbg.declare(metadata ptr %6, metadata !904, metadata !DIExpression()), !dbg !906
  %8 = load i32, ptr @input_desc, align 4, !dbg !907
  %9 = load ptr, ptr %4, align 8, !dbg !908
  %10 = load i64, ptr %5, align 8, !dbg !909
  %11 = call i64 @safe_read(i32 noundef %8, ptr noundef %9, i64 noundef %10), !dbg !910
  store i64 %11, ptr %6, align 8, !dbg !906
  %12 = load i64, ptr %6, align 8, !dbg !911
  %13 = icmp slt i64 %12, 0, !dbg !913
  br i1 %13, label %14, label %19, !dbg !914

14:                                               ; preds = %7
  %15 = call ptr @__error(), !dbg !915
  %16 = load i32, ptr %15, align 4, !dbg !915
  %17 = load ptr, ptr @infile, align 8, !dbg !915
  %18 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %17), !dbg !915
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %16, ptr noundef @.str.26, ptr noundef %18) #11, !dbg !915
  store i1 false, ptr %3, align 1, !dbg !917
  br label %31, !dbg !917

19:                                               ; preds = %7
  %20 = load i64, ptr %6, align 8, !dbg !918
  %21 = icmp eq i64 %20, 0, !dbg !920
  br i1 %21, label %22, label %23, !dbg !921

22:                                               ; preds = %19
  store i1 true, ptr %3, align 1, !dbg !922
  br label %31, !dbg !922

23:                                               ; preds = %19
  %24 = load ptr, ptr %4, align 8, !dbg !923
  %25 = load i64, ptr %6, align 8, !dbg !925
  %26 = call i64 @full_write(i32 noundef 1, ptr noundef %24, i64 noundef %25), !dbg !926
  %27 = load i64, ptr %6, align 8, !dbg !927
  %28 = icmp ne i64 %26, %27, !dbg !928
  br i1 %28, label %29, label %30, !dbg !929

29:                                               ; preds = %23
  call void @write_error(), !dbg !930
  br label %30, !dbg !930

30:                                               ; preds = %29, %23
  br label %7, !dbg !903, !llvm.loop !931

31:                                               ; preds = %22, %14
  %32 = load i1, ptr %3, align 1, !dbg !933
  ret i1 %32, !dbg !933
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: noreturn
declare void @xalloc_die() #4

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal zeroext i1 @cat(ptr noundef %0, i64 noundef %1, ptr noundef %2, i64 noundef %3, i1 noundef zeroext %4, i1 noundef zeroext %5, i1 noundef zeroext %6, i1 noundef zeroext %7, i1 noundef zeroext %8, i1 noundef zeroext %9) #3 !dbg !934 {
  %11 = alloca i1, align 1
  %12 = alloca ptr, align 8
  %13 = alloca i64, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i64, align 8
  %16 = alloca i8, align 1
  %17 = alloca i8, align 1
  %18 = alloca i8, align 1
  %19 = alloca i8, align 1
  %20 = alloca i8, align 1
  %21 = alloca i8, align 1
  %22 = alloca i8, align 1
  %23 = alloca i32, align 4
  %24 = alloca i8, align 1
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca i64, align 8
  %30 = alloca i8, align 1
  %31 = alloca i32, align 4
  %32 = alloca i64, align 8
  store ptr %0, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %12, metadata !937, metadata !DIExpression()), !dbg !938
  store i64 %1, ptr %13, align 8
  call void @llvm.dbg.declare(metadata ptr %13, metadata !939, metadata !DIExpression()), !dbg !940
  store ptr %2, ptr %14, align 8
  call void @llvm.dbg.declare(metadata ptr %14, metadata !941, metadata !DIExpression()), !dbg !942
  store i64 %3, ptr %15, align 8
  call void @llvm.dbg.declare(metadata ptr %15, metadata !943, metadata !DIExpression()), !dbg !944
  %33 = zext i1 %4 to i8
  store i8 %33, ptr %16, align 1
  call void @llvm.dbg.declare(metadata ptr %16, metadata !945, metadata !DIExpression()), !dbg !946
  %34 = zext i1 %5 to i8
  store i8 %34, ptr %17, align 1
  call void @llvm.dbg.declare(metadata ptr %17, metadata !947, metadata !DIExpression()), !dbg !948
  %35 = zext i1 %6 to i8
  store i8 %35, ptr %18, align 1
  call void @llvm.dbg.declare(metadata ptr %18, metadata !949, metadata !DIExpression()), !dbg !950
  %36 = zext i1 %7 to i8
  store i8 %36, ptr %19, align 1
  call void @llvm.dbg.declare(metadata ptr %19, metadata !951, metadata !DIExpression()), !dbg !952
  %37 = zext i1 %8 to i8
  store i8 %37, ptr %20, align 1
  call void @llvm.dbg.declare(metadata ptr %20, metadata !953, metadata !DIExpression()), !dbg !954
  %38 = zext i1 %9 to i8
  store i8 %38, ptr %21, align 1
  call void @llvm.dbg.declare(metadata ptr %21, metadata !955, metadata !DIExpression()), !dbg !956
  call void @llvm.dbg.declare(metadata ptr %22, metadata !957, metadata !DIExpression()), !dbg !959
  call void @llvm.dbg.declare(metadata ptr %23, metadata !960, metadata !DIExpression()), !dbg !961
  %39 = load i32, ptr @newlines2, align 4, !dbg !962
  store i32 %39, ptr %23, align 4, !dbg !961
  call void @llvm.dbg.declare(metadata ptr %24, metadata !963, metadata !DIExpression()), !dbg !964
  store i8 1, ptr %24, align 1, !dbg !964
  call void @llvm.dbg.declare(metadata ptr %25, metadata !965, metadata !DIExpression()), !dbg !966
  %40 = load ptr, ptr %12, align 8, !dbg !967
  store ptr %40, ptr %25, align 8, !dbg !966
  call void @llvm.dbg.declare(metadata ptr %26, metadata !968, metadata !DIExpression()), !dbg !969
  %41 = load ptr, ptr %25, align 8, !dbg !970
  %42 = getelementptr inbounds i8, ptr %41, i64 1, !dbg !971
  store ptr %42, ptr %26, align 8, !dbg !969
  call void @llvm.dbg.declare(metadata ptr %27, metadata !972, metadata !DIExpression()), !dbg !973
  %43 = load ptr, ptr %14, align 8, !dbg !974
  store ptr %43, ptr %27, align 8, !dbg !973
  br label %44, !dbg !975

44:                                               ; preds = %10, %378
  br label %45, !dbg !976

45:                                               ; preds = %206, %44
  %46 = load ptr, ptr %14, align 8, !dbg !978
  %47 = load i64, ptr %15, align 8, !dbg !981
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !982
  %49 = load ptr, ptr %27, align 8, !dbg !983
  %50 = icmp ule ptr %48, %49, !dbg !984
  br i1 %50, label %51, label %83, !dbg !985

51:                                               ; preds = %45
  call void @llvm.dbg.declare(metadata ptr %28, metadata !986, metadata !DIExpression()), !dbg !988
  %52 = load ptr, ptr %14, align 8, !dbg !989
  store ptr %52, ptr %28, align 8, !dbg !988
  call void @llvm.dbg.declare(metadata ptr %29, metadata !990, metadata !DIExpression()), !dbg !991
  br label %53, !dbg !992

53:                                               ; preds = %69, %51
  %54 = load ptr, ptr %28, align 8, !dbg !993
  %55 = load i64, ptr %15, align 8, !dbg !996
  %56 = call i64 @full_write(i32 noundef 1, ptr noundef %54, i64 noundef %55), !dbg !997
  %57 = load i64, ptr %15, align 8, !dbg !998
  %58 = icmp ne i64 %56, %57, !dbg !999
  br i1 %58, label %59, label %60, !dbg !1000

59:                                               ; preds = %53
  call void @write_error(), !dbg !1001
  br label %60, !dbg !1001

60:                                               ; preds = %59, %53
  %61 = load i64, ptr %15, align 8, !dbg !1002
  %62 = load ptr, ptr %28, align 8, !dbg !1003
  %63 = getelementptr inbounds i8, ptr %62, i64 %61, !dbg !1003
  store ptr %63, ptr %28, align 8, !dbg !1003
  %64 = load ptr, ptr %27, align 8, !dbg !1004
  %65 = load ptr, ptr %28, align 8, !dbg !1005
  %66 = ptrtoint ptr %64 to i64, !dbg !1006
  %67 = ptrtoint ptr %65 to i64, !dbg !1006
  %68 = sub i64 %66, %67, !dbg !1006
  store i64 %68, ptr %29, align 8, !dbg !1007
  br label %69, !dbg !1008

69:                                               ; preds = %60
  %70 = load i64, ptr %15, align 8, !dbg !1009
  %71 = load i64, ptr %29, align 8, !dbg !1010
  %72 = icmp sle i64 %70, %71, !dbg !1011
  br i1 %72, label %53, label %73, !dbg !1008, !llvm.loop !1012

73:                                               ; preds = %69
  %74 = load ptr, ptr %14, align 8, !dbg !1014
  %75 = load ptr, ptr %28, align 8, !dbg !1014
  %76 = load i64, ptr %29, align 8, !dbg !1014
  %77 = load ptr, ptr %14, align 8, !dbg !1014
  %78 = call i64 @llvm.objectsize.i64.p0(ptr %77, i1 false, i1 true, i1 false), !dbg !1014
  %79 = call ptr @__memmove_chk(ptr noundef %74, ptr noundef %75, i64 noundef %76, i64 noundef %78) #14, !dbg !1014
  %80 = load ptr, ptr %14, align 8, !dbg !1015
  %81 = load i64, ptr %29, align 8, !dbg !1016
  %82 = getelementptr inbounds i8, ptr %80, i64 %81, !dbg !1017
  store ptr %82, ptr %27, align 8, !dbg !1018
  br label %83, !dbg !1019

83:                                               ; preds = %73, %45
  %84 = load ptr, ptr %26, align 8, !dbg !1020
  %85 = load ptr, ptr %25, align 8, !dbg !1022
  %86 = icmp ugt ptr %84, %85, !dbg !1023
  br i1 %86, label %87, label %157, !dbg !1024

87:                                               ; preds = %83
  call void @llvm.dbg.declare(metadata ptr %30, metadata !1025, metadata !DIExpression()), !dbg !1027
  store i8 0, ptr %30, align 1, !dbg !1027
  call void @llvm.dbg.declare(metadata ptr %31, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i32 0, ptr %31, align 4, !dbg !1029
  %88 = load i8, ptr %24, align 1, !dbg !1030
  %89 = trunc i8 %88 to i1, !dbg !1030
  br i1 %89, label %90, label %122, !dbg !1032

90:                                               ; preds = %87
  %91 = load i32, ptr @input_desc, align 4, !dbg !1033
  %92 = call i32 (i32, i64, ...) @ioctl(i32 noundef %91, i64 noundef 1074030207, ptr noundef %31), !dbg !1034
  %93 = icmp slt i32 %92, 0, !dbg !1035
  br i1 %93, label %94, label %122, !dbg !1036

94:                                               ; preds = %90
  %95 = call ptr @__error(), !dbg !1037
  %96 = load i32, ptr %95, align 4, !dbg !1037
  %97 = icmp eq i32 %96, 102, !dbg !1040
  br i1 %97, label %114, label %98, !dbg !1041

98:                                               ; preds = %94
  %99 = call ptr @__error(), !dbg !1042
  %100 = load i32, ptr %99, align 4, !dbg !1042
  %101 = icmp eq i32 %100, 25, !dbg !1043
  br i1 %101, label %114, label %102, !dbg !1044

102:                                              ; preds = %98
  %103 = call ptr @__error(), !dbg !1045
  %104 = load i32, ptr %103, align 4, !dbg !1045
  %105 = icmp eq i32 %104, 22, !dbg !1046
  br i1 %105, label %114, label %106, !dbg !1047

106:                                              ; preds = %102
  %107 = call ptr @__error(), !dbg !1048
  %108 = load i32, ptr %107, align 4, !dbg !1048
  %109 = icmp eq i32 %108, 19, !dbg !1049
  br i1 %109, label %114, label %110, !dbg !1050

110:                                              ; preds = %106
  %111 = call ptr @__error(), !dbg !1051
  %112 = load i32, ptr %111, align 4, !dbg !1051
  %113 = icmp eq i32 %112, 78, !dbg !1052
  br i1 %113, label %114, label %115, !dbg !1053

114:                                              ; preds = %110, %106, %102, %98, %94
  store i8 0, ptr %24, align 1, !dbg !1054
  br label %121, !dbg !1055

115:                                              ; preds = %110
  %116 = call ptr @__error(), !dbg !1056
  %117 = load i32, ptr %116, align 4, !dbg !1056
  %118 = load ptr, ptr @infile, align 8, !dbg !1056
  %119 = call ptr @quotearg_style(i32 noundef 4, ptr noundef %118), !dbg !1056
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %117, ptr noundef @.str.47, ptr noundef %119) #11, !dbg !1056
  %120 = load i32, ptr %23, align 4, !dbg !1058
  store i32 %120, ptr @newlines2, align 4, !dbg !1059
  store i1 false, ptr %11, align 1, !dbg !1060
  br label %379, !dbg !1060

121:                                              ; preds = %114
  br label %122, !dbg !1061

122:                                              ; preds = %121, %90, %87
  %123 = load i32, ptr %31, align 4, !dbg !1062
  %124 = icmp ne i32 %123, 0, !dbg !1064
  br i1 %124, label %125, label %126, !dbg !1065

125:                                              ; preds = %122
  store i8 1, ptr %30, align 1, !dbg !1066
  br label %126, !dbg !1067

126:                                              ; preds = %125, %122
  %127 = load i8, ptr %30, align 1, !dbg !1068
  %128 = trunc i8 %127 to i1, !dbg !1068
  br i1 %128, label %131, label %129, !dbg !1070

129:                                              ; preds = %126
  %130 = load ptr, ptr %14, align 8, !dbg !1071
  call void @write_pending(ptr noundef %130, ptr noundef %27), !dbg !1072
  br label %131, !dbg !1072

131:                                              ; preds = %129, %126
  call void @llvm.dbg.declare(metadata ptr %32, metadata !1073, metadata !DIExpression()), !dbg !1074
  %132 = load i32, ptr @input_desc, align 4, !dbg !1075
  %133 = load ptr, ptr %12, align 8, !dbg !1076
  %134 = load i64, ptr %13, align 8, !dbg !1077
  %135 = call i64 @safe_read(i32 noundef %132, ptr noundef %133, i64 noundef %134), !dbg !1078
  store i64 %135, ptr %32, align 8, !dbg !1074
  %136 = load i64, ptr %32, align 8, !dbg !1079
  %137 = icmp slt i64 %136, 0, !dbg !1081
  br i1 %137, label %138, label %145, !dbg !1082

138:                                              ; preds = %131
  %139 = call ptr @__error(), !dbg !1083
  %140 = load i32, ptr %139, align 4, !dbg !1083
  %141 = load ptr, ptr @infile, align 8, !dbg !1083
  %142 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %141), !dbg !1083
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %140, ptr noundef @.str.26, ptr noundef %142) #11, !dbg !1083
  %143 = load ptr, ptr %14, align 8, !dbg !1085
  call void @write_pending(ptr noundef %143, ptr noundef %27), !dbg !1086
  %144 = load i32, ptr %23, align 4, !dbg !1087
  store i32 %144, ptr @newlines2, align 4, !dbg !1088
  store i1 false, ptr %11, align 1, !dbg !1089
  br label %379, !dbg !1089

145:                                              ; preds = %131
  %146 = load i64, ptr %32, align 8, !dbg !1090
  %147 = icmp eq i64 %146, 0, !dbg !1092
  br i1 %147, label %148, label %151, !dbg !1093

148:                                              ; preds = %145
  %149 = load ptr, ptr %14, align 8, !dbg !1094
  call void @write_pending(ptr noundef %149, ptr noundef %27), !dbg !1096
  %150 = load i32, ptr %23, align 4, !dbg !1097
  store i32 %150, ptr @newlines2, align 4, !dbg !1098
  store i1 true, ptr %11, align 1, !dbg !1099
  br label %379, !dbg !1099

151:                                              ; preds = %145
  %152 = load ptr, ptr %12, align 8, !dbg !1100
  store ptr %152, ptr %26, align 8, !dbg !1101
  %153 = load ptr, ptr %26, align 8, !dbg !1102
  %154 = load i64, ptr %32, align 8, !dbg !1103
  %155 = getelementptr inbounds i8, ptr %153, i64 %154, !dbg !1104
  store ptr %155, ptr %25, align 8, !dbg !1105
  %156 = load ptr, ptr %25, align 8, !dbg !1106
  store i8 10, ptr %156, align 1, !dbg !1107
  br label %202, !dbg !1108

157:                                              ; preds = %83
  %158 = load i32, ptr %23, align 4, !dbg !1109
  %159 = add nsw i32 %158, 1, !dbg !1109
  store i32 %159, ptr %23, align 4, !dbg !1109
  %160 = icmp sgt i32 %159, 0, !dbg !1112
  br i1 %160, label %161, label %185, !dbg !1113

161:                                              ; preds = %157
  %162 = load i32, ptr %23, align 4, !dbg !1114
  %163 = icmp sge i32 %162, 2, !dbg !1117
  br i1 %163, label %164, label %172, !dbg !1118

164:                                              ; preds = %161
  store i32 2, ptr %23, align 4, !dbg !1119
  %165 = load i8, ptr %21, align 1, !dbg !1121
  %166 = trunc i8 %165 to i1, !dbg !1121
  br i1 %166, label %167, label %171, !dbg !1123

167:                                              ; preds = %164
  %168 = load ptr, ptr %26, align 8, !dbg !1124
  %169 = getelementptr inbounds i8, ptr %168, i32 1, !dbg !1124
  store ptr %169, ptr %26, align 8, !dbg !1124
  %170 = load i8, ptr %168, align 1, !dbg !1126
  store i8 %170, ptr %22, align 1, !dbg !1127
  br label %206, !dbg !1128

171:                                              ; preds = %164
  br label %172, !dbg !1129

172:                                              ; preds = %171, %161
  %173 = load i8, ptr %18, align 1, !dbg !1130
  %174 = trunc i8 %173 to i1, !dbg !1130
  br i1 %174, label %175, label %184, !dbg !1132

175:                                              ; preds = %172
  %176 = load i8, ptr %19, align 1, !dbg !1133
  %177 = trunc i8 %176 to i1, !dbg !1133
  br i1 %177, label %184, label %178, !dbg !1134

178:                                              ; preds = %175
  call void @next_line_num(), !dbg !1135
  %179 = load ptr, ptr %27, align 8, !dbg !1137
  %180 = load ptr, ptr @line_num_print, align 8, !dbg !1137
  %181 = load ptr, ptr %27, align 8, !dbg !1137
  %182 = call i64 @llvm.objectsize.i64.p0(ptr %181, i1 false, i1 true, i1 false), !dbg !1137
  %183 = call ptr @__stpcpy_chk(ptr noundef %179, ptr noundef %180, i64 noundef %182) #14, !dbg !1137
  store ptr %183, ptr %27, align 8, !dbg !1138
  br label %184, !dbg !1139

184:                                              ; preds = %178, %175, %172
  br label %185, !dbg !1140

185:                                              ; preds = %184, %157
  %186 = load i8, ptr %20, align 1, !dbg !1141
  %187 = trunc i8 %186 to i1, !dbg !1141
  br i1 %187, label %188, label %199, !dbg !1143

188:                                              ; preds = %185
  %189 = load i8, ptr @pending_cr, align 1, !dbg !1144
  %190 = trunc i8 %189 to i1, !dbg !1144
  br i1 %190, label %191, label %196, !dbg !1147

191:                                              ; preds = %188
  %192 = load ptr, ptr %27, align 8, !dbg !1148
  %193 = getelementptr inbounds i8, ptr %192, i32 1, !dbg !1148
  store ptr %193, ptr %27, align 8, !dbg !1148
  store i8 94, ptr %192, align 1, !dbg !1150
  %194 = load ptr, ptr %27, align 8, !dbg !1151
  %195 = getelementptr inbounds i8, ptr %194, i32 1, !dbg !1151
  store ptr %195, ptr %27, align 8, !dbg !1151
  store i8 77, ptr %194, align 1, !dbg !1152
  store i8 0, ptr @pending_cr, align 1, !dbg !1153
  br label %196, !dbg !1154

196:                                              ; preds = %191, %188
  %197 = load ptr, ptr %27, align 8, !dbg !1155
  %198 = getelementptr inbounds i8, ptr %197, i32 1, !dbg !1155
  store ptr %198, ptr %27, align 8, !dbg !1155
  store i8 36, ptr %197, align 1, !dbg !1156
  br label %199, !dbg !1157

199:                                              ; preds = %196, %185
  %200 = load ptr, ptr %27, align 8, !dbg !1158
  %201 = getelementptr inbounds i8, ptr %200, i32 1, !dbg !1158
  store ptr %201, ptr %27, align 8, !dbg !1158
  store i8 10, ptr %200, align 1, !dbg !1159
  br label %202

202:                                              ; preds = %199, %151
  %203 = load ptr, ptr %26, align 8, !dbg !1160
  %204 = getelementptr inbounds i8, ptr %203, i32 1, !dbg !1160
  store ptr %204, ptr %26, align 8, !dbg !1160
  %205 = load i8, ptr %203, align 1, !dbg !1161
  store i8 %205, ptr %22, align 1, !dbg !1162
  br label %206, !dbg !1163

206:                                              ; preds = %202, %167
  %207 = load i8, ptr %22, align 1, !dbg !1164
  %208 = zext i8 %207 to i32, !dbg !1164
  %209 = icmp eq i32 %208, 10, !dbg !1165
  br i1 %209, label %45, label %210, !dbg !1163, !llvm.loop !1166

210:                                              ; preds = %206
  %211 = load i8, ptr @pending_cr, align 1, !dbg !1168
  %212 = trunc i8 %211 to i1, !dbg !1168
  br i1 %212, label %213, label %216, !dbg !1170

213:                                              ; preds = %210
  %214 = load ptr, ptr %27, align 8, !dbg !1171
  %215 = getelementptr inbounds i8, ptr %214, i32 1, !dbg !1171
  store ptr %215, ptr %27, align 8, !dbg !1171
  store i8 13, ptr %214, align 1, !dbg !1173
  store i8 0, ptr @pending_cr, align 1, !dbg !1174
  br label %216, !dbg !1175

216:                                              ; preds = %213, %210
  %217 = load i32, ptr %23, align 4, !dbg !1176
  %218 = icmp sge i32 %217, 0, !dbg !1178
  br i1 %218, label %219, label %228, !dbg !1179

219:                                              ; preds = %216
  %220 = load i8, ptr %18, align 1, !dbg !1180
  %221 = trunc i8 %220 to i1, !dbg !1180
  br i1 %221, label %222, label %228, !dbg !1181

222:                                              ; preds = %219
  call void @next_line_num(), !dbg !1182
  %223 = load ptr, ptr %27, align 8, !dbg !1184
  %224 = load ptr, ptr @line_num_print, align 8, !dbg !1184
  %225 = load ptr, ptr %27, align 8, !dbg !1184
  %226 = call i64 @llvm.objectsize.i64.p0(ptr %225, i1 false, i1 true, i1 false), !dbg !1184
  %227 = call ptr @__stpcpy_chk(ptr noundef %223, ptr noundef %224, i64 noundef %226) #14, !dbg !1184
  store ptr %227, ptr %27, align 8, !dbg !1185
  br label %228, !dbg !1186

228:                                              ; preds = %222, %219, %216
  %229 = load i8, ptr %16, align 1, !dbg !1187
  %230 = trunc i8 %229 to i1, !dbg !1187
  br i1 %230, label %231, label %322, !dbg !1189

231:                                              ; preds = %228
  br label %232, !dbg !1190

232:                                              ; preds = %231, %317
  %233 = load i8, ptr %22, align 1, !dbg !1192
  %234 = zext i8 %233 to i32, !dbg !1192
  %235 = icmp sge i32 %234, 32, !dbg !1195
  br i1 %235, label %236, label %291, !dbg !1196

236:                                              ; preds = %232
  %237 = load i8, ptr %22, align 1, !dbg !1197
  %238 = zext i8 %237 to i32, !dbg !1197
  %239 = icmp slt i32 %238, 127, !dbg !1200
  br i1 %239, label %240, label %244, !dbg !1201

240:                                              ; preds = %236
  %241 = load i8, ptr %22, align 1, !dbg !1202
  %242 = load ptr, ptr %27, align 8, !dbg !1203
  %243 = getelementptr inbounds i8, ptr %242, i32 1, !dbg !1203
  store ptr %243, ptr %27, align 8, !dbg !1203
  store i8 %241, ptr %242, align 1, !dbg !1204
  br label %290, !dbg !1205

244:                                              ; preds = %236
  %245 = load i8, ptr %22, align 1, !dbg !1206
  %246 = zext i8 %245 to i32, !dbg !1206
  %247 = icmp eq i32 %246, 127, !dbg !1208
  br i1 %247, label %248, label %253, !dbg !1209

248:                                              ; preds = %244
  %249 = load ptr, ptr %27, align 8, !dbg !1210
  %250 = getelementptr inbounds i8, ptr %249, i32 1, !dbg !1210
  store ptr %250, ptr %27, align 8, !dbg !1210
  store i8 94, ptr %249, align 1, !dbg !1212
  %251 = load ptr, ptr %27, align 8, !dbg !1213
  %252 = getelementptr inbounds i8, ptr %251, i32 1, !dbg !1213
  store ptr %252, ptr %27, align 8, !dbg !1213
  store i8 63, ptr %251, align 1, !dbg !1214
  br label %289, !dbg !1215

253:                                              ; preds = %244
  %254 = load ptr, ptr %27, align 8, !dbg !1216
  %255 = getelementptr inbounds i8, ptr %254, i32 1, !dbg !1216
  store ptr %255, ptr %27, align 8, !dbg !1216
  store i8 77, ptr %254, align 1, !dbg !1218
  %256 = load ptr, ptr %27, align 8, !dbg !1219
  %257 = getelementptr inbounds i8, ptr %256, i32 1, !dbg !1219
  store ptr %257, ptr %27, align 8, !dbg !1219
  store i8 45, ptr %256, align 1, !dbg !1220
  %258 = load i8, ptr %22, align 1, !dbg !1221
  %259 = zext i8 %258 to i32, !dbg !1221
  %260 = icmp sge i32 %259, 160, !dbg !1223
  br i1 %260, label %261, label %278, !dbg !1224

261:                                              ; preds = %253
  %262 = load i8, ptr %22, align 1, !dbg !1225
  %263 = zext i8 %262 to i32, !dbg !1225
  %264 = icmp slt i32 %263, 255, !dbg !1228
  br i1 %264, label %265, label %272, !dbg !1229

265:                                              ; preds = %261
  %266 = load i8, ptr %22, align 1, !dbg !1230
  %267 = zext i8 %266 to i32, !dbg !1230
  %268 = sub nsw i32 %267, 128, !dbg !1231
  %269 = trunc i32 %268 to i8, !dbg !1230
  %270 = load ptr, ptr %27, align 8, !dbg !1232
  %271 = getelementptr inbounds i8, ptr %270, i32 1, !dbg !1232
  store ptr %271, ptr %27, align 8, !dbg !1232
  store i8 %269, ptr %270, align 1, !dbg !1233
  br label %277, !dbg !1234

272:                                              ; preds = %261
  %273 = load ptr, ptr %27, align 8, !dbg !1235
  %274 = getelementptr inbounds i8, ptr %273, i32 1, !dbg !1235
  store ptr %274, ptr %27, align 8, !dbg !1235
  store i8 94, ptr %273, align 1, !dbg !1237
  %275 = load ptr, ptr %27, align 8, !dbg !1238
  %276 = getelementptr inbounds i8, ptr %275, i32 1, !dbg !1238
  store ptr %276, ptr %27, align 8, !dbg !1238
  store i8 63, ptr %275, align 1, !dbg !1239
  br label %277

277:                                              ; preds = %272, %265
  br label %288, !dbg !1240

278:                                              ; preds = %253
  %279 = load ptr, ptr %27, align 8, !dbg !1241
  %280 = getelementptr inbounds i8, ptr %279, i32 1, !dbg !1241
  store ptr %280, ptr %27, align 8, !dbg !1241
  store i8 94, ptr %279, align 1, !dbg !1243
  %281 = load i8, ptr %22, align 1, !dbg !1244
  %282 = zext i8 %281 to i32, !dbg !1244
  %283 = sub nsw i32 %282, 128, !dbg !1245
  %284 = add nsw i32 %283, 64, !dbg !1246
  %285 = trunc i32 %284 to i8, !dbg !1244
  %286 = load ptr, ptr %27, align 8, !dbg !1247
  %287 = getelementptr inbounds i8, ptr %286, i32 1, !dbg !1247
  store ptr %287, ptr %27, align 8, !dbg !1247
  store i8 %285, ptr %286, align 1, !dbg !1248
  br label %288

288:                                              ; preds = %278, %277
  br label %289

289:                                              ; preds = %288, %248
  br label %290

290:                                              ; preds = %289, %240
  br label %317, !dbg !1249

291:                                              ; preds = %232
  %292 = load i8, ptr %22, align 1, !dbg !1250
  %293 = zext i8 %292 to i32, !dbg !1250
  %294 = icmp eq i32 %293, 9, !dbg !1252
  br i1 %294, label %295, label %301, !dbg !1253

295:                                              ; preds = %291
  %296 = load i8, ptr %17, align 1, !dbg !1254
  %297 = trunc i8 %296 to i1, !dbg !1254
  br i1 %297, label %301, label %298, !dbg !1255

298:                                              ; preds = %295
  %299 = load ptr, ptr %27, align 8, !dbg !1256
  %300 = getelementptr inbounds i8, ptr %299, i32 1, !dbg !1256
  store ptr %300, ptr %27, align 8, !dbg !1256
  store i8 9, ptr %299, align 1, !dbg !1257
  br label %316, !dbg !1258

301:                                              ; preds = %295, %291
  %302 = load i8, ptr %22, align 1, !dbg !1259
  %303 = zext i8 %302 to i32, !dbg !1259
  %304 = icmp eq i32 %303, 10, !dbg !1261
  br i1 %304, label %305, label %306, !dbg !1262

305:                                              ; preds = %301
  store i32 -1, ptr %23, align 4, !dbg !1263
  br label %321, !dbg !1265

306:                                              ; preds = %301
  %307 = load ptr, ptr %27, align 8, !dbg !1266
  %308 = getelementptr inbounds i8, ptr %307, i32 1, !dbg !1266
  store ptr %308, ptr %27, align 8, !dbg !1266
  store i8 94, ptr %307, align 1, !dbg !1268
  %309 = load i8, ptr %22, align 1, !dbg !1269
  %310 = zext i8 %309 to i32, !dbg !1269
  %311 = add nsw i32 %310, 64, !dbg !1270
  %312 = trunc i32 %311 to i8, !dbg !1269
  %313 = load ptr, ptr %27, align 8, !dbg !1271
  %314 = getelementptr inbounds i8, ptr %313, i32 1, !dbg !1271
  store ptr %314, ptr %27, align 8, !dbg !1271
  store i8 %312, ptr %313, align 1, !dbg !1272
  br label %315

315:                                              ; preds = %306
  br label %316

316:                                              ; preds = %315, %298
  br label %317

317:                                              ; preds = %316, %290
  %318 = load ptr, ptr %26, align 8, !dbg !1273
  %319 = getelementptr inbounds i8, ptr %318, i32 1, !dbg !1273
  store ptr %319, ptr %26, align 8, !dbg !1273
  %320 = load i8, ptr %318, align 1, !dbg !1274
  store i8 %320, ptr %22, align 1, !dbg !1275
  br label %232, !dbg !1190, !llvm.loop !1276

321:                                              ; preds = %305
  br label %378, !dbg !1278

322:                                              ; preds = %228
  br label %323, !dbg !1279

323:                                              ; preds = %322, %373
  %324 = load i8, ptr %22, align 1, !dbg !1281
  %325 = zext i8 %324 to i32, !dbg !1281
  %326 = icmp eq i32 %325, 9, !dbg !1284
  br i1 %326, label %327, label %339, !dbg !1285

327:                                              ; preds = %323
  %328 = load i8, ptr %17, align 1, !dbg !1286
  %329 = trunc i8 %328 to i1, !dbg !1286
  br i1 %329, label %330, label %339, !dbg !1287

330:                                              ; preds = %327
  %331 = load ptr, ptr %27, align 8, !dbg !1288
  %332 = getelementptr inbounds i8, ptr %331, i32 1, !dbg !1288
  store ptr %332, ptr %27, align 8, !dbg !1288
  store i8 94, ptr %331, align 1, !dbg !1290
  %333 = load i8, ptr %22, align 1, !dbg !1291
  %334 = zext i8 %333 to i32, !dbg !1291
  %335 = add nsw i32 %334, 64, !dbg !1292
  %336 = trunc i32 %335 to i8, !dbg !1291
  %337 = load ptr, ptr %27, align 8, !dbg !1293
  %338 = getelementptr inbounds i8, ptr %337, i32 1, !dbg !1293
  store ptr %338, ptr %27, align 8, !dbg !1293
  store i8 %336, ptr %337, align 1, !dbg !1294
  br label %373, !dbg !1295

339:                                              ; preds = %327, %323
  %340 = load i8, ptr %22, align 1, !dbg !1296
  %341 = zext i8 %340 to i32, !dbg !1296
  %342 = icmp ne i32 %341, 10, !dbg !1298
  br i1 %342, label %343, label %371, !dbg !1299

343:                                              ; preds = %339
  %344 = load i8, ptr %22, align 1, !dbg !1300
  %345 = zext i8 %344 to i32, !dbg !1300
  %346 = icmp eq i32 %345, 13, !dbg !1303
  br i1 %346, label %347, label %366, !dbg !1304

347:                                              ; preds = %343
  %348 = load ptr, ptr %26, align 8, !dbg !1305
  %349 = load i8, ptr %348, align 1, !dbg !1306
  %350 = sext i8 %349 to i32, !dbg !1306
  %351 = icmp eq i32 %350, 10, !dbg !1307
  br i1 %351, label %352, label %366, !dbg !1308

352:                                              ; preds = %347
  %353 = load i8, ptr %20, align 1, !dbg !1309
  %354 = trunc i8 %353 to i1, !dbg !1309
  br i1 %354, label %355, label %366, !dbg !1310

355:                                              ; preds = %352
  %356 = load ptr, ptr %26, align 8, !dbg !1311
  %357 = load ptr, ptr %25, align 8, !dbg !1314
  %358 = icmp eq ptr %356, %357, !dbg !1315
  br i1 %358, label %359, label %360, !dbg !1316

359:                                              ; preds = %355
  store i8 1, ptr @pending_cr, align 1, !dbg !1317
  br label %365, !dbg !1318

360:                                              ; preds = %355
  %361 = load ptr, ptr %27, align 8, !dbg !1319
  %362 = getelementptr inbounds i8, ptr %361, i32 1, !dbg !1319
  store ptr %362, ptr %27, align 8, !dbg !1319
  store i8 94, ptr %361, align 1, !dbg !1321
  %363 = load ptr, ptr %27, align 8, !dbg !1322
  %364 = getelementptr inbounds i8, ptr %363, i32 1, !dbg !1322
  store ptr %364, ptr %27, align 8, !dbg !1322
  store i8 77, ptr %363, align 1, !dbg !1323
  br label %365

365:                                              ; preds = %360, %359
  br label %370, !dbg !1324

366:                                              ; preds = %352, %347, %343
  %367 = load i8, ptr %22, align 1, !dbg !1325
  %368 = load ptr, ptr %27, align 8, !dbg !1326
  %369 = getelementptr inbounds i8, ptr %368, i32 1, !dbg !1326
  store ptr %369, ptr %27, align 8, !dbg !1326
  store i8 %367, ptr %368, align 1, !dbg !1327
  br label %370

370:                                              ; preds = %366, %365
  br label %372, !dbg !1328

371:                                              ; preds = %339
  store i32 -1, ptr %23, align 4, !dbg !1329
  br label %377, !dbg !1331

372:                                              ; preds = %370
  br label %373

373:                                              ; preds = %372, %330
  %374 = load ptr, ptr %26, align 8, !dbg !1332
  %375 = getelementptr inbounds i8, ptr %374, i32 1, !dbg !1332
  store ptr %375, ptr %26, align 8, !dbg !1332
  %376 = load i8, ptr %374, align 1, !dbg !1333
  store i8 %376, ptr %22, align 1, !dbg !1334
  br label %323, !dbg !1279, !llvm.loop !1335

377:                                              ; preds = %371
  br label %378

378:                                              ; preds = %377, %321
  br label %44, !dbg !975, !llvm.loop !1337

379:                                              ; preds = %148, %138, %115
  %380 = load i1, ptr %11, align 1, !dbg !1339
  ret i1 %380, !dbg !1339
}

declare void @alignfree(ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #1

declare i32 @"\01_close"(i32 noundef) #2

declare i64 @full_write(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @write_error() #3 !dbg !1340 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata ptr %1, metadata !1341, metadata !DIExpression()), !dbg !1342
  %2 = call ptr @__error(), !dbg !1343
  %3 = load i32, ptr %2, align 4, !dbg !1343
  store i32 %3, ptr %1, align 4, !dbg !1342
  %4 = load ptr, ptr @__stdoutp, align 8, !dbg !1344
  %5 = call i32 @rpl_fflush(ptr noundef %4), !dbg !1345
  %6 = load ptr, ptr @__stdoutp, align 8, !dbg !1346
  %7 = call i32 @rpl_fpurge(ptr noundef %6), !dbg !1347
  %8 = load ptr, ptr @__stdoutp, align 8, !dbg !1348
  %9 = getelementptr inbounds %struct.__sFILE, ptr %8, i32 0, i32 3, !dbg !1348
  %10 = load i16, ptr %9, align 8, !dbg !1348
  %11 = sext i16 %10 to i32, !dbg !1348
  %12 = and i32 %11, -97, !dbg !1348
  %13 = trunc i32 %12 to i16, !dbg !1348
  store i16 %13, ptr %9, align 8, !dbg !1348
  %14 = load i32, ptr %1, align 4, !dbg !1349
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %14, ptr noundef @.str.48) #11, !dbg !1349
  unreachable, !dbg !1349
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

declare void @emit_bug_reporting_address() #2

declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #2

declare i32 @stdc_leading_zeros_ull(i64 noundef) #2

declare i64 @copy_file_range(i32 noundef, ptr noundef, i32 noundef, ptr noundef, i64 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal zeroext i1 @is_ENOTSUP(i32 noundef %0) #3 !dbg !1350 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1353, metadata !DIExpression()), !dbg !1354
  %3 = load i32, ptr %2, align 4, !dbg !1355
  %4 = icmp eq i32 %3, 102, !dbg !1356
  br i1 %4, label %8, label %5, !dbg !1357

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4, !dbg !1358
  %7 = icmp eq i32 %6, 45, !dbg !1359
  br label %8, !dbg !1357

8:                                                ; preds = %5, %1
  %9 = phi i1 [ true, %1 ], [ %7, %5 ]
  ret i1 %9, !dbg !1360
}

declare i64 @safe_read(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: nounwind
declare ptr @__memmove_chk(ptr noundef, ptr noundef, i64 noundef, i64 noundef) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #1

declare i32 @ioctl(i32 noundef, i64 noundef, ...) #2

declare ptr @quotearg_style(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @write_pending(ptr noundef %0, ptr noundef %1) #3 !dbg !1361 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1364, metadata !DIExpression()), !dbg !1365
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1366, metadata !DIExpression()), !dbg !1367
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1368, metadata !DIExpression()), !dbg !1369
  %6 = load ptr, ptr %4, align 8, !dbg !1370
  %7 = load ptr, ptr %6, align 8, !dbg !1371
  %8 = load ptr, ptr %3, align 8, !dbg !1372
  %9 = ptrtoint ptr %7 to i64, !dbg !1373
  %10 = ptrtoint ptr %8 to i64, !dbg !1373
  %11 = sub i64 %9, %10, !dbg !1373
  store i64 %11, ptr %5, align 8, !dbg !1369
  %12 = load i64, ptr %5, align 8, !dbg !1374
  %13 = icmp slt i64 0, %12, !dbg !1376
  br i1 %13, label %14, label %24, !dbg !1377

14:                                               ; preds = %2
  %15 = load ptr, ptr %3, align 8, !dbg !1378
  %16 = load i64, ptr %5, align 8, !dbg !1381
  %17 = call i64 @full_write(i32 noundef 1, ptr noundef %15, i64 noundef %16), !dbg !1382
  %18 = load i64, ptr %5, align 8, !dbg !1383
  %19 = icmp ne i64 %17, %18, !dbg !1384
  br i1 %19, label %20, label %21, !dbg !1385

20:                                               ; preds = %14
  call void @write_error(), !dbg !1386
  br label %21, !dbg !1386

21:                                               ; preds = %20, %14
  %22 = load ptr, ptr %3, align 8, !dbg !1387
  %23 = load ptr, ptr %4, align 8, !dbg !1388
  store ptr %22, ptr %23, align 8, !dbg !1389
  br label %24, !dbg !1390

24:                                               ; preds = %21, %2
  ret void, !dbg !1391
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @next_line_num() #3 !dbg !1392 {
  %1 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !1393, metadata !DIExpression()), !dbg !1394
  %2 = load ptr, ptr @line_num_end, align 8, !dbg !1395
  store ptr %2, ptr %1, align 8, !dbg !1394
  br label %3, !dbg !1396

3:                                                ; preds = %13, %0
  %4 = load ptr, ptr %1, align 8, !dbg !1397
  %5 = load i8, ptr %4, align 1, !dbg !1400
  %6 = add i8 %5, 1, !dbg !1400
  store i8 %6, ptr %4, align 1, !dbg !1400
  %7 = sext i8 %5 to i32, !dbg !1401
  %8 = icmp slt i32 %7, 57, !dbg !1402
  br i1 %8, label %9, label %10, !dbg !1403

9:                                                ; preds = %3
  br label %31, !dbg !1404

10:                                               ; preds = %3
  %11 = load ptr, ptr %1, align 8, !dbg !1405
  %12 = getelementptr inbounds i8, ptr %11, i32 -1, !dbg !1405
  store ptr %12, ptr %1, align 8, !dbg !1405
  store i8 48, ptr %11, align 1, !dbg !1406
  br label %13, !dbg !1407

13:                                               ; preds = %10
  %14 = load ptr, ptr %1, align 8, !dbg !1408
  %15 = load ptr, ptr @line_num_start, align 8, !dbg !1409
  %16 = icmp uge ptr %14, %15, !dbg !1410
  br i1 %16, label %3, label %17, !dbg !1407, !llvm.loop !1411

17:                                               ; preds = %13
  %18 = load ptr, ptr @line_num_start, align 8, !dbg !1413
  %19 = icmp ugt ptr %18, @line_buf, !dbg !1415
  br i1 %19, label %20, label %23, !dbg !1416

20:                                               ; preds = %17
  %21 = load ptr, ptr @line_num_start, align 8, !dbg !1417
  %22 = getelementptr inbounds i8, ptr %21, i32 -1, !dbg !1417
  store ptr %22, ptr @line_num_start, align 8, !dbg !1417
  store i8 49, ptr %22, align 1, !dbg !1418
  br label %24, !dbg !1419

23:                                               ; preds = %17
  store i8 62, ptr @line_buf, align 1, !dbg !1420
  br label %24

24:                                               ; preds = %23, %20
  %25 = load ptr, ptr @line_num_start, align 8, !dbg !1421
  %26 = load ptr, ptr @line_num_print, align 8, !dbg !1423
  %27 = icmp ult ptr %25, %26, !dbg !1424
  br i1 %27, label %28, label %31, !dbg !1425

28:                                               ; preds = %24
  %29 = load ptr, ptr @line_num_print, align 8, !dbg !1426
  %30 = getelementptr inbounds i8, ptr %29, i32 -1, !dbg !1426
  store ptr %30, ptr @line_num_print, align 8, !dbg !1426
  br label %31, !dbg !1427

31:                                               ; preds = %9, %28, %24
  ret void, !dbg !1428
}

; Function Attrs: nounwind
declare ptr @__stpcpy_chk(ptr noundef, ptr noundef, i64 noundef) #9

declare i32 @rpl_fflush(ptr noundef) #2

declare i32 @rpl_fpurge(ptr noundef) #2

attributes #0 = { noinline noreturn nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { cold "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #7 = { allocsize(1) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #10 = { noreturn }
attributes #11 = { cold }
attributes #12 = { nounwind willreturn memory(none) }
attributes #13 = { allocsize(1) }
attributes #14 = { nounwind }

!llvm.module.flags = !{!282, !283, !284, !285, !286, !287, !288}
!llvm.dbg.cu = !{!52}
!llvm.ident = !{!289}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 87, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "coreutils/src/catOP.c", directory: "/Users/felicitasgarcia/MM", checksumkind: CSK_MD5, checksum: "d7786fab9352ce2571dfe43048d42415")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 39)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 90, type: !3, isLocal: true, isDefinition: true)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(scope: null, file: !2, line: 94, type: !11, isLocal: true, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 376, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 47)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !2, line: 100, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 2872, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 359)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(scope: null, file: !2, line: 109, type: !21, isLocal: true, isDefinition: true)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1816, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 227)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !2, line: 115, type: !26, isLocal: true, isDefinition: true)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 384, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 48)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(scope: null, file: !2, line: 116, type: !31, isLocal: true, isDefinition: true)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 456, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 57)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(scope: null, file: !2, line: 117, type: !36, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1216, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 152)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(scope: null, file: !2, line: 124, type: !41, isLocal: true, isDefinition: true)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 4)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "long_options", scope: !46, file: !2, line: 546, type: !272, isLocal: true, isDefinition: true)
!46 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 530, type: !47, scopeLine: 531, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !52, retainedNodes: !271)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!52 = distinct !DICompileUnit(language: DW_LANG_C11, file: !53, producer: "Apple clang version 16.0.0 (clang-1600.0.26.6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !54, retainedTypes: !88, globals: !99, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk", sdk: "MacOSX.sdk")
!53 = !DIFile(filename: "/Users/felicitasgarcia/MM/coreutils/src/catOP.c", directory: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "d7786fab9352ce2571dfe43048d42415")
!54 = !{!55, !60, !75, !84}
!55 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !56, line: 302, baseType: !49, size: 32, elements: !57)
!56 = !DIFile(filename: "coreutils/src/system.h", directory: "/Users/felicitasgarcia/MM", checksumkind: CSK_MD5, checksum: "92e5fbfd24e0c15a11a979ebe932d636")
!57 = !{!58, !59}
!58 = !DIEnumerator(name: "GETOPT_HELP_CHAR", value: -130)
!59 = !DIEnumerator(name: "GETOPT_VERSION_CHAR", value: -131)
!60 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "quoting_style", file: !61, line: 42, baseType: !62, size: 32, elements: !63)
!61 = !DIFile(filename: "coreutils/lib/quotearg.h", directory: "/Users/felicitasgarcia/MM", checksumkind: CSK_MD5, checksum: "f10dd3600418f68d04449866ba8ba7b6")
!62 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!63 = !{!64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74}
!64 = !DIEnumerator(name: "literal_quoting_style", value: 0)
!65 = !DIEnumerator(name: "shell_quoting_style", value: 1)
!66 = !DIEnumerator(name: "shell_always_quoting_style", value: 2)
!67 = !DIEnumerator(name: "shell_escape_quoting_style", value: 3)
!68 = !DIEnumerator(name: "shell_escape_always_quoting_style", value: 4)
!69 = !DIEnumerator(name: "c_quoting_style", value: 5)
!70 = !DIEnumerator(name: "c_maybe_quoting_style", value: 6)
!71 = !DIEnumerator(name: "escape_quoting_style", value: 7)
!72 = !DIEnumerator(name: "locale_quoting_style", value: 8)
!73 = !DIEnumerator(name: "clocale_quoting_style", value: 9)
!74 = !DIEnumerator(name: "custom_quoting_style", value: 10)
!75 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !76, line: 53, baseType: !62, size: 32, elements: !77)
!76 = !DIFile(filename: "coreutils/lib/fadvise.h", directory: "/Users/felicitasgarcia/MM", checksumkind: CSK_MD5, checksum: "297997f3abc0c062b01935a648f2a046")
!77 = !{!78, !79, !80, !81, !82, !83}
!78 = !DIEnumerator(name: "FADVISE_NORMAL", value: 0)
!79 = !DIEnumerator(name: "FADVISE_SEQUENTIAL", value: 1)
!80 = !DIEnumerator(name: "FADVISE_NOREUSE", value: 2)
!81 = !DIEnumerator(name: "FADVISE_DONTNEED", value: 3)
!82 = !DIEnumerator(name: "FADVISE_WILLNEED", value: 4)
!83 = !DIEnumerator(name: "FADVISE_RANDOM", value: 5)
!84 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !85, line: 78, baseType: !62, size: 32, elements: !86)
!85 = !DIFile(filename: "coreutils/src/ioblksize.h", directory: "/Users/felicitasgarcia/MM", checksumkind: CSK_MD5, checksum: "2998e8d108a2ac8d0ff710ad69cfcb06")
!86 = !{!87}
!87 = !DIEnumerator(name: "IO_BUFSIZE", value: 262144)
!88 = !{!89, !51, !91, !92, !93, !98}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!92 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !94, line: 50, baseType: !95)
!94 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !96, line: 87, baseType: !97)
!96 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!97 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !96, line: 36, baseType: !62)
!99 = !{!0, !7, !9, !14, !19, !24, !29, !34, !39, !100, !105, !110, !115, !120, !125, !127, !132, !137, !44, !142, !147, !152, !154, !159, !164, !169, !171, !176, !181, !186, !188, !193, !195, !197, !202, !204, !206, !208, !213, !215, !220, !222, !224, !226, !228, !233, !235, !240, !245, !250, !255, !257, !259, !261, !263, !265, !267, !269}
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(scope: null, file: !2, line: 548, type: !102, isLocal: true, isDefinition: true)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !103)
!103 = !{!104}
!104 = !DISubrange(count: 16)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression())
!106 = distinct !DIGlobalVariable(scope: null, file: !2, line: 549, type: !107, isLocal: true, isDefinition: true)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 7)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(scope: null, file: !2, line: 550, type: !112, isLocal: true, isDefinition: true)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: 14)
!115 = !DIGlobalVariableExpression(var: !116, expr: !DIExpression())
!116 = distinct !DIGlobalVariable(scope: null, file: !2, line: 551, type: !117, isLocal: true, isDefinition: true)
!117 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !118)
!118 = !{!119}
!119 = !DISubrange(count: 17)
!120 = !DIGlobalVariableExpression(var: !121, expr: !DIExpression())
!121 = distinct !DIGlobalVariable(scope: null, file: !2, line: 552, type: !122, isLocal: true, isDefinition: true)
!122 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !123)
!123 = !{!124}
!124 = !DISubrange(count: 10)
!125 = !DIGlobalVariableExpression(var: !126, expr: !DIExpression())
!126 = distinct !DIGlobalVariable(scope: null, file: !2, line: 553, type: !122, isLocal: true, isDefinition: true)
!127 = !DIGlobalVariableExpression(var: !128, expr: !DIExpression())
!128 = distinct !DIGlobalVariable(scope: null, file: !2, line: 554, type: !129, isLocal: true, isDefinition: true)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !130)
!130 = !{!131}
!131 = !DISubrange(count: 9)
!132 = !DIGlobalVariableExpression(var: !133, expr: !DIExpression())
!133 = distinct !DIGlobalVariable(scope: null, file: !2, line: 555, type: !134, isLocal: true, isDefinition: true)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 5)
!137 = !DIGlobalVariableExpression(var: !138, expr: !DIExpression())
!138 = distinct !DIGlobalVariable(scope: null, file: !2, line: 556, type: !139, isLocal: true, isDefinition: true)
!139 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !140)
!140 = !{!141}
!141 = !DISubrange(count: 8)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(scope: null, file: !2, line: 562, type: !144, isLocal: true, isDefinition: true)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 8, elements: !145)
!145 = !{!146}
!146 = !DISubrange(count: 1)
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(scope: null, file: !2, line: 575, type: !149, isLocal: true, isDefinition: true)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !150)
!150 = !{!151}
!151 = !DISubrange(count: 11)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(scope: null, file: !2, line: 627, type: !112, isLocal: true, isDefinition: true)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(scope: null, file: !2, line: 627, type: !156, isLocal: true, isDefinition: true)
!156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !157)
!157 = !{!158}
!158 = !DISubrange(count: 18)
!159 = !DIGlobalVariableExpression(var: !160, expr: !DIExpression())
!160 = distinct !DIGlobalVariable(scope: null, file: !2, line: 627, type: !161, isLocal: true, isDefinition: true)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !162)
!162 = !{!163}
!163 = !DISubrange(count: 19)
!164 = !DIGlobalVariableExpression(var: !165, expr: !DIExpression())
!165 = distinct !DIGlobalVariable(scope: null, file: !2, line: 627, type: !166, isLocal: true, isDefinition: true)
!166 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !167)
!167 = !{!168}
!168 = !DISubrange(count: 20)
!169 = !DIGlobalVariableExpression(var: !170, expr: !DIExpression())
!170 = distinct !DIGlobalVariable(scope: null, file: !2, line: 637, type: !102, isLocal: true, isDefinition: true)
!171 = !DIGlobalVariableExpression(var: !172, expr: !DIExpression())
!172 = distinct !DIGlobalVariable(scope: null, file: !2, line: 664, type: !173, isLocal: true, isDefinition: true)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !174)
!174 = !{!175}
!175 = !DISubrange(count: 2)
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression())
!177 = distinct !DIGlobalVariable(scope: null, file: !2, line: 687, type: !178, isLocal: true, isDefinition: true)
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !179)
!179 = !{!180}
!180 = !DISubrange(count: 3)
!181 = !DIGlobalVariableExpression(var: !182, expr: !DIExpression())
!182 = distinct !DIGlobalVariable(scope: null, file: !2, line: 720, type: !183, isLocal: true, isDefinition: true)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 240, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 30)
!186 = !DIGlobalVariableExpression(var: !187, expr: !DIExpression())
!187 = distinct !DIGlobalVariable(scope: null, file: !2, line: 805, type: !173, isLocal: true, isDefinition: true)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(scope: null, file: !2, line: 810, type: !190, isLocal: true, isDefinition: true)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 184, elements: !191)
!191 = !{!192}
!192 = !DISubrange(count: 23)
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(name: "infile", scope: !52, file: !2, line: 51, type: !89, isLocal: true, isDefinition: true)
!195 = !DIGlobalVariableExpression(var: !196, expr: !DIExpression())
!196 = distinct !DIGlobalVariable(name: "input_desc", scope: !52, file: !2, line: 54, type: !49, isLocal: true, isDefinition: true)
!197 = !DIGlobalVariableExpression(var: !198, expr: !DIExpression())
!198 = distinct !DIGlobalVariable(scope: null, file: !56, line: 533, type: !199, isLocal: true, isDefinition: true)
!199 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 448, elements: !200)
!200 = !{!201}
!201 = !DISubrange(count: 56)
!202 = !DIGlobalVariableExpression(var: !203, expr: !DIExpression())
!203 = distinct !DIGlobalVariable(scope: null, file: !56, line: 634, type: !173, isLocal: true, isDefinition: true)
!204 = !DIGlobalVariableExpression(var: !205, expr: !DIExpression())
!205 = distinct !DIGlobalVariable(scope: null, file: !56, line: 634, type: !102, isLocal: true, isDefinition: true)
!206 = !DIGlobalVariableExpression(var: !207, expr: !DIExpression())
!207 = distinct !DIGlobalVariable(scope: null, file: !56, line: 635, type: !122, isLocal: true, isDefinition: true)
!208 = !DIGlobalVariableExpression(var: !209, expr: !DIExpression())
!209 = distinct !DIGlobalVariable(scope: null, file: !56, line: 635, type: !210, isLocal: true, isDefinition: true)
!210 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !211)
!211 = !{!212}
!212 = !DISubrange(count: 22)
!213 = !DIGlobalVariableExpression(var: !214, expr: !DIExpression())
!214 = distinct !DIGlobalVariable(scope: null, file: !56, line: 636, type: !122, isLocal: true, isDefinition: true)
!215 = !DIGlobalVariableExpression(var: !216, expr: !DIExpression())
!216 = distinct !DIGlobalVariable(scope: null, file: !56, line: 636, type: !217, isLocal: true, isDefinition: true)
!217 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !218)
!218 = !{!219}
!219 = !DISubrange(count: 15)
!220 = !DIGlobalVariableExpression(var: !221, expr: !DIExpression())
!221 = distinct !DIGlobalVariable(scope: null, file: !56, line: 637, type: !122, isLocal: true, isDefinition: true)
!222 = !DIGlobalVariableExpression(var: !223, expr: !DIExpression())
!223 = distinct !DIGlobalVariable(scope: null, file: !56, line: 638, type: !122, isLocal: true, isDefinition: true)
!224 = !DIGlobalVariableExpression(var: !225, expr: !DIExpression())
!225 = distinct !DIGlobalVariable(scope: null, file: !56, line: 639, type: !122, isLocal: true, isDefinition: true)
!226 = !DIGlobalVariableExpression(var: !227, expr: !DIExpression())
!227 = distinct !DIGlobalVariable(scope: null, file: !56, line: 657, type: !41, isLocal: true, isDefinition: true)
!228 = !DIGlobalVariableExpression(var: !229, expr: !DIExpression())
!229 = distinct !DIGlobalVariable(scope: null, file: !56, line: 663, type: !230, isLocal: true, isDefinition: true)
!230 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 568, elements: !231)
!231 = !{!232}
!232 = !DISubrange(count: 71)
!233 = !DIGlobalVariableExpression(var: !234, expr: !DIExpression())
!234 = distinct !DIGlobalVariable(scope: null, file: !56, line: 669, type: !134, isLocal: true, isDefinition: true)
!235 = !DIGlobalVariableExpression(var: !236, expr: !DIExpression())
!236 = distinct !DIGlobalVariable(scope: null, file: !56, line: 670, type: !237, isLocal: true, isDefinition: true)
!237 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !238)
!238 = !{!239}
!239 = !DISubrange(count: 27)
!240 = !DIGlobalVariableExpression(var: !241, expr: !DIExpression())
!241 = distinct !DIGlobalVariable(scope: null, file: !56, line: 671, type: !242, isLocal: true, isDefinition: true)
!242 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !243)
!243 = !{!244}
!244 = !DISubrange(count: 40)
!245 = !DIGlobalVariableExpression(var: !246, expr: !DIExpression())
!246 = distinct !DIGlobalVariable(scope: null, file: !56, line: 672, type: !247, isLocal: true, isDefinition: true)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 408, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 51)
!250 = !DIGlobalVariableExpression(var: !251, expr: !DIExpression())
!251 = distinct !DIGlobalVariable(scope: null, file: !56, line: 673, type: !252, isLocal: true, isDefinition: true)
!252 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !253)
!253 = !{!254}
!254 = !DISubrange(count: 12)
!255 = !DIGlobalVariableExpression(var: !256, expr: !DIExpression())
!256 = distinct !DIGlobalVariable(scope: null, file: !2, line: 295, type: !210, isLocal: true, isDefinition: true)
!257 = !DIGlobalVariableExpression(var: !258, expr: !DIExpression())
!258 = distinct !DIGlobalVariable(name: "newlines2", scope: !52, file: !2, line: 78, type: !49, isLocal: true, isDefinition: true)
!259 = !DIGlobalVariableExpression(var: !260, expr: !DIExpression())
!260 = distinct !DIGlobalVariable(name: "line_num_end", scope: !52, file: !2, line: 75, type: !51, isLocal: true, isDefinition: true)
!261 = !DIGlobalVariableExpression(var: !262, expr: !DIExpression())
!262 = distinct !DIGlobalVariable(name: "line_num_start", scope: !52, file: !2, line: 72, type: !51, isLocal: true, isDefinition: true)
!263 = !DIGlobalVariableExpression(var: !264, expr: !DIExpression())
!264 = distinct !DIGlobalVariable(name: "line_buf", scope: !52, file: !2, line: 60, type: !166, isLocal: true, isDefinition: true)
!265 = !DIGlobalVariableExpression(var: !266, expr: !DIExpression())
!266 = distinct !DIGlobalVariable(name: "line_num_print", scope: !52, file: !2, line: 69, type: !51, isLocal: true, isDefinition: true)
!267 = !DIGlobalVariableExpression(var: !268, expr: !DIExpression())
!268 = distinct !DIGlobalVariable(name: "pending_cr", scope: !52, file: !2, line: 81, type: !92, isLocal: true, isDefinition: true)
!269 = !DIGlobalVariableExpression(var: !270, expr: !DIExpression())
!270 = distinct !DIGlobalVariable(scope: null, file: !56, line: 747, type: !252, isLocal: true, isDefinition: true)
!271 = !{}
!272 = !DICompositeType(tag: DW_TAG_array_type, baseType: !273, size: 2560, elements: !123)
!273 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !274)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "option", file: !275, line: 50, size: 256, elements: !276)
!275 = !DIFile(filename: "coreutils/lib/getopt-ext.h", directory: "/Users/felicitasgarcia/MM", checksumkind: CSK_MD5, checksum: "b93b7db1cee91b05bbc7c93da36fa5f0")
!276 = !{!277, !278, !279, !281}
!277 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !274, file: !275, line: 52, baseType: !89, size: 64)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "has_arg", scope: !274, file: !275, line: 55, baseType: !49, size: 32, offset: 64)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !274, file: !275, line: 56, baseType: !280, size: 64, offset: 128)
!280 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !274, file: !275, line: 57, baseType: !49, size: 32, offset: 192)
!282 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!283 = !{i32 7, !"Dwarf Version", i32 5}
!284 = !{i32 2, !"Debug Info Version", i32 3}
!285 = !{i32 1, !"wchar_size", i32 4}
!286 = !{i32 8, !"PIC Level", i32 2}
!287 = !{i32 7, !"uwtable", i32 1}
!288 = !{i32 7, !"frame-pointer", i32 1}
!289 = !{!"Apple clang version 16.0.0 (clang-1600.0.26.6)"}
!290 = distinct !DISubprogram(name: "usage", scope: !2, file: !2, line: 84, type: !291, scopeLine: 85, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !52, retainedNodes: !271)
!291 = !DISubroutineType(types: !292)
!292 = !{null, !49}
!293 = !DILocalVariable(name: "status", arg: 1, scope: !290, file: !2, line: 84, type: !49)
!294 = !DILocation(line: 84, column: 15, scope: !290)
!295 = !DILocation(line: 86, column: 10, scope: !296)
!296 = distinct !DILexicalBlock(scope: !290, file: !2, line: 86, column: 10)
!297 = !DILocation(line: 86, column: 17, scope: !296)
!298 = !DILocation(line: 86, column: 10, scope: !290)
!299 = !DILocation(line: 87, column: 8, scope: !296)
!300 = !DILocation(line: 87, column: 8, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !2, line: 87, column: 8)
!302 = !DILocation(line: 93, column: 18, scope: !303)
!303 = distinct !DILexicalBlock(scope: !296, file: !2, line: 89, column: 8)
!304 = !DILocation(line: 90, column: 10, scope: !303)
!305 = !DILocation(line: 96, column: 8, scope: !303)
!306 = !DILocation(line: 94, column: 10, scope: !303)
!307 = !DILocation(line: 98, column: 10, scope: !303)
!308 = !DILocation(line: 108, column: 8, scope: !303)
!309 = !DILocation(line: 100, column: 10, scope: !303)
!310 = !DILocation(line: 114, column: 8, scope: !303)
!311 = !DILocation(line: 109, column: 10, scope: !303)
!312 = !DILocation(line: 115, column: 42, scope: !303)
!313 = !DILocation(line: 115, column: 10, scope: !303)
!314 = !DILocation(line: 116, column: 45, scope: !303)
!315 = !DILocation(line: 116, column: 10, scope: !303)
!316 = !DILocation(line: 123, column: 18, scope: !303)
!317 = !DILocation(line: 123, column: 32, scope: !303)
!318 = !DILocation(line: 117, column: 10, scope: !303)
!319 = !DILocation(line: 124, column: 10, scope: !303)
!320 = !DILocation(line: 126, column: 12, scope: !290)
!321 = !DILocation(line: 126, column: 6, scope: !290)
!322 = distinct !DISubprogram(name: "emit_stdin_note", scope: !56, file: !56, line: 531, type: !323, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52)
!323 = !DISubroutineType(types: !324)
!324 = !{null}
!325 = !DILocation(line: 535, column: 5, scope: !322)
!326 = !DILocation(line: 533, column: 3, scope: !322)
!327 = !DILocation(line: 536, column: 1, scope: !322)
!328 = distinct !DISubprogram(name: "emit_ancillary_info", scope: !56, file: !56, line: 631, type: !329, scopeLine: 632, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!329 = !DISubroutineType(types: !330)
!330 = !{null, !89}
!331 = !DILocalVariable(name: "program", arg: 1, scope: !328, file: !56, line: 631, type: !89)
!332 = !DILocation(line: 631, column: 34, scope: !328)
!333 = !DILocalVariable(name: "infomap", scope: !328, file: !56, line: 633, type: !334)
!334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !335, size: 896, elements: !108)
!335 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !336)
!336 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "infomap", scope: !328, file: !56, line: 633, size: 128, elements: !337)
!337 = !{!338, !339}
!338 = !DIDerivedType(tag: DW_TAG_member, name: "program", scope: !336, file: !56, line: 633, baseType: !89, size: 64)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "node", scope: !336, file: !56, line: 633, baseType: !89, size: 64, offset: 64)
!340 = !DILocation(line: 633, column: 67, scope: !328)
!341 = !DILocalVariable(name: "node", scope: !328, file: !56, line: 643, type: !89)
!342 = !DILocation(line: 643, column: 15, scope: !328)
!343 = !DILocation(line: 643, column: 22, scope: !328)
!344 = !DILocalVariable(name: "map_prog", scope: !328, file: !56, line: 644, type: !345)
!345 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !335, size: 64)
!346 = !DILocation(line: 644, column: 25, scope: !328)
!347 = !DILocation(line: 644, column: 36, scope: !328)
!348 = !DILocation(line: 646, column: 3, scope: !328)
!349 = !DILocation(line: 646, column: 10, scope: !328)
!350 = !DILocation(line: 646, column: 20, scope: !328)
!351 = !DILocation(line: 646, column: 28, scope: !328)
!352 = !DILocation(line: 646, column: 33, scope: !328)
!353 = !DILocation(line: 646, column: 31, scope: !328)
!354 = !DILocation(line: 0, scope: !328)
!355 = !DILocation(line: 647, column: 13, scope: !328)
!356 = distinct !{!356, !348, !355, !357}
!357 = !{!"llvm.loop.mustprogress"}
!358 = !DILocation(line: 649, column: 7, scope: !359)
!359 = distinct !DILexicalBlock(scope: !328, file: !56, line: 649, column: 7)
!360 = !DILocation(line: 649, column: 17, scope: !359)
!361 = !DILocation(line: 649, column: 7, scope: !328)
!362 = !DILocation(line: 650, column: 12, scope: !359)
!363 = !DILocation(line: 650, column: 22, scope: !359)
!364 = !DILocation(line: 650, column: 10, scope: !359)
!365 = !DILocation(line: 650, column: 5, scope: !359)
!366 = !DILocation(line: 652, column: 3, scope: !328)
!367 = !DILocalVariable(name: "lc_messages", scope: !328, file: !56, line: 656, type: !89)
!368 = !DILocation(line: 656, column: 15, scope: !328)
!369 = !DILocation(line: 656, column: 29, scope: !328)
!370 = !DILocation(line: 657, column: 7, scope: !371)
!371 = distinct !DILexicalBlock(scope: !328, file: !56, line: 657, column: 7)
!372 = !DILocation(line: 657, column: 19, scope: !371)
!373 = !DILocation(line: 657, column: 22, scope: !371)
!374 = !DILocation(line: 657, column: 7, scope: !328)
!375 = !DILocation(line: 664, column: 61, scope: !376)
!376 = distinct !DILexicalBlock(scope: !371, file: !56, line: 658, column: 5)
!377 = !DILocation(line: 663, column: 7, scope: !376)
!378 = !DILocation(line: 665, column: 5, scope: !376)
!379 = !DILocalVariable(name: "url_program", scope: !328, file: !56, line: 669, type: !89)
!380 = !DILocation(line: 669, column: 15, scope: !328)
!381 = !DILocation(line: 669, column: 29, scope: !328)
!382 = !DILocation(line: 669, column: 61, scope: !328)
!383 = !DILocation(line: 671, column: 24, scope: !328)
!384 = !DILocation(line: 670, column: 3, scope: !328)
!385 = !DILocation(line: 673, column: 11, scope: !328)
!386 = !DILocation(line: 673, column: 17, scope: !328)
!387 = !DILocation(line: 673, column: 25, scope: !328)
!388 = !DILocation(line: 673, column: 22, scope: !328)
!389 = !DILocation(line: 672, column: 3, scope: !328)
!390 = !DILocation(line: 674, column: 1, scope: !328)
!391 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !2, line: 530, type: !49)
!392 = !DILocation(line: 530, column: 14, scope: !46)
!393 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !2, line: 530, type: !50)
!394 = !DILocation(line: 530, column: 27, scope: !46)
!395 = !DILocalVariable(name: "have_read_stdin", scope: !46, file: !2, line: 533, type: !92)
!396 = !DILocation(line: 533, column: 11, scope: !46)
!397 = !DILocalVariable(name: "stat_buf", scope: !46, file: !2, line: 535, type: !398)
!398 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !399, line: 182, size: 1152, elements: !400)
!399 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/stat.h", directory: "", checksumkind: CSK_MD5, checksum: "7ad4ad124a8c48bc739f4ff34823635f")
!400 = !{!401, !407, !413, !416, !420, !424, !428, !429, !437, !438, !439, !440, !446, !450, !454, !455, !456, !457}
!401 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !398, file: !399, line: 182, baseType: !402, size: 32)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "dev_t", file: !403, line: 31, baseType: !404)
!403 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_dev_t.h", directory: "", checksumkind: CSK_MD5, checksum: "48c1388efd95518803dfc92f7c613390")
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_dev_t", file: !405, line: 69, baseType: !406)
!405 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !96, line: 35, baseType: !49)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !398, file: !399, line: 182, baseType: !408, size: 16, offset: 32)
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "mode_t", file: !409, line: 31, baseType: !410)
!409 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_mode_t.h", directory: "", checksumkind: CSK_MD5, checksum: "9d25d351341bf46798d552a73c506c13")
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mode_t", file: !405, line: 82, baseType: !411)
!411 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !96, line: 34, baseType: !412)
!412 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !398, file: !399, line: 182, baseType: !414, size: 16, offset: 48)
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "nlink_t", file: !415, line: 31, baseType: !411)
!415 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_nlink_t.h", directory: "", checksumkind: CSK_MD5, checksum: "a5dc886263c85dc2cd1b3afb5217f7ff")
!416 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !398, file: !399, line: 182, baseType: !417, size: 64, offset: 64)
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ino64_t", file: !405, line: 74, baseType: !418)
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !96, line: 38, baseType: !419)
!419 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !398, file: !399, line: 182, baseType: !421, size: 32, offset: 128)
!421 = !DIDerivedType(tag: DW_TAG_typedef, name: "uid_t", file: !422, line: 31, baseType: !423)
!422 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_uid_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2a704f772d04abefb01de36d246e45dd")
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_uid_t", file: !405, line: 87, baseType: !98)
!424 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !398, file: !399, line: 182, baseType: !425, size: 32, offset: 160)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "gid_t", file: !426, line: 31, baseType: !427)
!426 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_gid_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d2790080feb33014a3635a9680ad7807")
!427 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_gid_t", file: !405, line: 72, baseType: !98)
!428 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !398, file: !399, line: 182, baseType: !402, size: 32, offset: 192)
!429 = !DIDerivedType(tag: DW_TAG_member, name: "st_atimespec", scope: !398, file: !399, line: 182, baseType: !430, size: 128, offset: 256)
!430 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !431, line: 33, size: 128, elements: !432)
!431 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "8d740567ad568a1ef1d70ccb6b1755cb")
!432 = !{!433, !436}
!433 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !430, file: !431, line: 35, baseType: !434, size: 64)
!434 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !96, line: 119, baseType: !435)
!435 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!436 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !430, file: !431, line: 36, baseType: !435, size: 64, offset: 64)
!437 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtimespec", scope: !398, file: !399, line: 182, baseType: !430, size: 128, offset: 384)
!438 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctimespec", scope: !398, file: !399, line: 182, baseType: !430, size: 128, offset: 512)
!439 = !DIDerivedType(tag: DW_TAG_member, name: "st_birthtimespec", scope: !398, file: !399, line: 182, baseType: !430, size: 128, offset: 640)
!440 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !398, file: !399, line: 182, baseType: !441, size: 64, offset: 768)
!441 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_t", file: !442, line: 31, baseType: !443)
!442 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_off_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0468c56924902d4782b467d48c54d211")
!443 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !405, line: 83, baseType: !444)
!444 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !96, line: 37, baseType: !445)
!445 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!446 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !398, file: !399, line: 182, baseType: !447, size: 64, offset: 832)
!447 = !DIDerivedType(tag: DW_TAG_typedef, name: "blkcnt_t", file: !448, line: 31, baseType: !449)
!448 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_blkcnt_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6fd4a13e3ff9e3b13f22abebee32d241")
!449 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_blkcnt_t", file: !405, line: 67, baseType: !444)
!450 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !398, file: !399, line: 182, baseType: !451, size: 32, offset: 896)
!451 = !DIDerivedType(tag: DW_TAG_typedef, name: "blksize_t", file: !452, line: 31, baseType: !453)
!452 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_blksize_t.h", directory: "", checksumkind: CSK_MD5, checksum: "c69af5532a265376a130afa280ea51fc")
!453 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_blksize_t", file: !405, line: 68, baseType: !406)
!454 = !DIDerivedType(tag: DW_TAG_member, name: "st_flags", scope: !398, file: !399, line: 182, baseType: !98, size: 32, offset: 928)
!455 = !DIDerivedType(tag: DW_TAG_member, name: "st_gen", scope: !398, file: !399, line: 182, baseType: !98, size: 32, offset: 960)
!456 = !DIDerivedType(tag: DW_TAG_member, name: "st_lspare", scope: !398, file: !399, line: 182, baseType: !406, size: 32, offset: 992)
!457 = !DIDerivedType(tag: DW_TAG_member, name: "st_qspare", scope: !398, file: !399, line: 182, baseType: !458, size: 128, offset: 1024)
!458 = !DICompositeType(tag: DW_TAG_array_type, baseType: !444, size: 128, elements: !174)
!459 = !DILocation(line: 535, column: 18, scope: !46)
!460 = !DILocalVariable(name: "number", scope: !46, file: !2, line: 538, type: !92)
!461 = !DILocation(line: 538, column: 11, scope: !46)
!462 = !DILocalVariable(name: "number_nonblank", scope: !46, file: !2, line: 539, type: !92)
!463 = !DILocation(line: 539, column: 11, scope: !46)
!464 = !DILocalVariable(name: "squeeze_blank", scope: !46, file: !2, line: 540, type: !92)
!465 = !DILocation(line: 540, column: 11, scope: !46)
!466 = !DILocalVariable(name: "show_ends", scope: !46, file: !2, line: 541, type: !92)
!467 = !DILocation(line: 541, column: 11, scope: !46)
!468 = !DILocalVariable(name: "show_nonprinting", scope: !46, file: !2, line: 542, type: !92)
!469 = !DILocation(line: 542, column: 11, scope: !46)
!470 = !DILocalVariable(name: "show_tabs", scope: !46, file: !2, line: 543, type: !92)
!471 = !DILocation(line: 543, column: 11, scope: !46)
!472 = !DILocalVariable(name: "file_open_mode", scope: !46, file: !2, line: 544, type: !49)
!473 = !DILocation(line: 544, column: 10, scope: !46)
!474 = !DILocation(line: 561, column: 24, scope: !46)
!475 = !DILocation(line: 561, column: 6, scope: !46)
!476 = !DILocation(line: 562, column: 6, scope: !46)
!477 = !DILocation(line: 570, column: 6, scope: !46)
!478 = !DILocalVariable(name: "c", scope: !46, file: !2, line: 574, type: !49)
!479 = !DILocation(line: 574, column: 10, scope: !46)
!480 = !DILocation(line: 575, column: 6, scope: !46)
!481 = !DILocation(line: 575, column: 31, scope: !46)
!482 = !DILocation(line: 575, column: 37, scope: !46)
!483 = !DILocation(line: 575, column: 18, scope: !46)
!484 = !DILocation(line: 575, column: 16, scope: !46)
!485 = !DILocation(line: 575, column: 81, scope: !46)
!486 = !DILocation(line: 578, column: 18, scope: !487)
!487 = distinct !DILexicalBlock(scope: !46, file: !2, line: 577, column: 8)
!488 = !DILocation(line: 578, column: 10, scope: !487)
!489 = !DILocation(line: 581, column: 21, scope: !490)
!490 = distinct !DILexicalBlock(scope: !487, file: !2, line: 579, column: 12)
!491 = !DILocation(line: 582, column: 30, scope: !490)
!492 = !DILocation(line: 583, column: 14, scope: !490)
!493 = !DILocation(line: 586, column: 24, scope: !490)
!494 = !DILocation(line: 587, column: 31, scope: !490)
!495 = !DILocation(line: 588, column: 14, scope: !490)
!496 = !DILocation(line: 591, column: 21, scope: !490)
!497 = !DILocation(line: 592, column: 14, scope: !490)
!498 = !DILocation(line: 595, column: 28, scope: !490)
!499 = !DILocation(line: 596, column: 14, scope: !490)
!500 = !DILocation(line: 599, column: 24, scope: !490)
!501 = !DILocation(line: 600, column: 31, scope: !490)
!502 = !DILocation(line: 601, column: 14, scope: !490)
!503 = !DILocation(line: 605, column: 14, scope: !490)
!504 = !DILocation(line: 608, column: 31, scope: !490)
!505 = !DILocation(line: 609, column: 14, scope: !490)
!506 = !DILocation(line: 612, column: 31, scope: !490)
!507 = !DILocation(line: 613, column: 24, scope: !490)
!508 = !DILocation(line: 614, column: 24, scope: !490)
!509 = !DILocation(line: 615, column: 14, scope: !490)
!510 = !DILocation(line: 618, column: 24, scope: !490)
!511 = !DILocation(line: 619, column: 14, scope: !490)
!512 = !DILocation(line: 622, column: 24, scope: !490)
!513 = !DILocation(line: 623, column: 14, scope: !490)
!514 = !DILocation(line: 625, column: 12, scope: !490)
!515 = !DILocation(line: 627, column: 12, scope: !490)
!516 = !DILocation(line: 630, column: 14, scope: !490)
!517 = distinct !{!517, !480, !518, !357}
!518 = !DILocation(line: 632, column: 8, scope: !46)
!519 = !DILocation(line: 636, column: 10, scope: !520)
!520 = distinct !DILexicalBlock(scope: !46, file: !2, line: 636, column: 10)
!521 = !DILocation(line: 636, column: 43, scope: !520)
!522 = !DILocation(line: 636, column: 10, scope: !46)
!523 = !DILocation(line: 637, column: 8, scope: !520)
!524 = !DILocalVariable(name: "outsize", scope: !46, file: !2, line: 640, type: !525)
!525 = !DIDerivedType(tag: DW_TAG_typedef, name: "idx_t", file: !526, line: 130, baseType: !527)
!526 = !DIFile(filename: "coreutils/lib/idx.h", directory: "/Users/felicitasgarcia/MM", checksumkind: CSK_MD5, checksum: "9a27a7b69b899883fdd541cc17d53261")
!527 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", file: !528, line: 18, baseType: !435)
!528 = !DIFile(filename: "/Library/Developer/CommandLineTools/usr/lib/clang/16/include/__stddef_ptrdiff_t.h", directory: "", checksumkind: CSK_MD5, checksum: "21e0c40f3315797d915cc7ea60040a98")
!529 = !DILocation(line: 640, column: 12, scope: !46)
!530 = !DILocation(line: 640, column: 22, scope: !46)
!531 = !DILocalVariable(name: "out_dev", scope: !46, file: !2, line: 643, type: !402)
!532 = !DILocation(line: 643, column: 12, scope: !46)
!533 = !DILocalVariable(name: "out_ino", scope: !46, file: !2, line: 644, type: !534)
!534 = !DIDerivedType(tag: DW_TAG_typedef, name: "ino_t", file: !535, line: 31, baseType: !536)
!535 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_ino_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0c9db3a8864f73774452167110c4c8c1")
!536 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ino_t", file: !405, line: 76, baseType: !417)
!537 = !DILocation(line: 644, column: 12, scope: !46)
!538 = !DILocalVariable(name: "out_flags", scope: !46, file: !2, line: 645, type: !49)
!539 = !DILocation(line: 645, column: 10, scope: !46)
!540 = !DILocalVariable(name: "have_out_dev", scope: !46, file: !2, line: 646, type: !92)
!541 = !DILocation(line: 646, column: 11, scope: !46)
!542 = !DILocation(line: 647, column: 10, scope: !543)
!543 = distinct !DILexicalBlock(scope: !46, file: !2, line: 647, column: 10)
!544 = !DILocation(line: 647, column: 10, scope: !46)
!545 = !DILocation(line: 649, column: 29, scope: !546)
!546 = distinct !DILexicalBlock(scope: !543, file: !2, line: 648, column: 8)
!547 = !DILocation(line: 649, column: 18, scope: !546)
!548 = !DILocation(line: 650, column: 29, scope: !546)
!549 = !DILocation(line: 650, column: 18, scope: !546)
!550 = !DILocation(line: 651, column: 7, scope: !546)
!551 = !DILocalVariable(name: "out_isreg", scope: !46, file: !2, line: 654, type: !92)
!552 = !DILocation(line: 654, column: 11, scope: !46)
!553 = !DILocation(line: 654, column: 23, scope: !46)
!554 = !DILocation(line: 654, column: 50, scope: !46)
!555 = !DILocation(line: 656, column: 13, scope: !556)
!556 = distinct !DILexicalBlock(scope: !46, file: !2, line: 656, column: 10)
!557 = !DILocation(line: 656, column: 20, scope: !556)
!558 = !DILocation(line: 656, column: 23, scope: !556)
!559 = !DILocation(line: 656, column: 33, scope: !556)
!560 = !DILocation(line: 656, column: 36, scope: !556)
!561 = !DILocation(line: 656, column: 10, scope: !46)
!562 = !DILocation(line: 658, column: 25, scope: !563)
!563 = distinct !DILexicalBlock(scope: !556, file: !2, line: 657, column: 8)
!564 = !DILocation(line: 659, column: 10, scope: !563)
!565 = !DILocation(line: 660, column: 8, scope: !563)
!566 = !DILocation(line: 664, column: 13, scope: !46)
!567 = !DILocalVariable(name: "argind", scope: !46, file: !2, line: 665, type: !49)
!568 = !DILocation(line: 665, column: 10, scope: !46)
!569 = !DILocation(line: 665, column: 19, scope: !46)
!570 = !DILocalVariable(name: "ok", scope: !46, file: !2, line: 666, type: !92)
!571 = !DILocation(line: 666, column: 11, scope: !46)
!572 = !DILocalVariable(name: "page_size", scope: !46, file: !2, line: 667, type: !525)
!573 = !DILocation(line: 667, column: 12, scope: !46)
!574 = !DILocation(line: 667, column: 24, scope: !46)
!575 = !DILocation(line: 669, column: 6, scope: !46)
!576 = !DILocation(line: 671, column: 14, scope: !577)
!577 = distinct !DILexicalBlock(scope: !578, file: !2, line: 671, column: 14)
!578 = distinct !DILexicalBlock(scope: !46, file: !2, line: 670, column: 8)
!579 = !DILocation(line: 671, column: 23, scope: !577)
!580 = !DILocation(line: 671, column: 21, scope: !577)
!581 = !DILocation(line: 671, column: 14, scope: !578)
!582 = !DILocation(line: 672, column: 21, scope: !577)
!583 = !DILocation(line: 672, column: 26, scope: !577)
!584 = !DILocation(line: 672, column: 19, scope: !577)
!585 = !DILocation(line: 672, column: 12, scope: !577)
!586 = !DILocalVariable(name: "reading_stdin", scope: !578, file: !2, line: 674, type: !92)
!587 = !DILocation(line: 674, column: 15, scope: !578)
!588 = !DILocation(line: 674, column: 31, scope: !578)
!589 = !DILocation(line: 675, column: 14, scope: !590)
!590 = distinct !DILexicalBlock(scope: !578, file: !2, line: 675, column: 14)
!591 = !DILocation(line: 675, column: 14, scope: !578)
!592 = !DILocation(line: 677, column: 30, scope: !593)
!593 = distinct !DILexicalBlock(scope: !590, file: !2, line: 676, column: 12)
!594 = !DILocation(line: 678, column: 25, scope: !593)
!595 = !DILocation(line: 679, column: 18, scope: !596)
!596 = distinct !DILexicalBlock(scope: !593, file: !2, line: 679, column: 18)
!597 = !DILocation(line: 679, column: 33, scope: !596)
!598 = !DILocation(line: 679, column: 18, scope: !593)
!599 = !DILocation(line: 680, column: 16, scope: !596)
!600 = !DILocation(line: 681, column: 12, scope: !593)
!601 = !DILocation(line: 684, column: 33, scope: !602)
!602 = distinct !DILexicalBlock(scope: !590, file: !2, line: 683, column: 12)
!603 = !DILocation(line: 684, column: 41, scope: !602)
!604 = !DILocation(line: 684, column: 27, scope: !602)
!605 = !DILocation(line: 684, column: 25, scope: !602)
!606 = !DILocation(line: 685, column: 18, scope: !607)
!607 = distinct !DILexicalBlock(scope: !602, file: !2, line: 685, column: 18)
!608 = !DILocation(line: 685, column: 29, scope: !607)
!609 = !DILocation(line: 685, column: 18, scope: !602)
!610 = !DILocation(line: 687, column: 18, scope: !611)
!611 = distinct !DILexicalBlock(scope: !607, file: !2, line: 686, column: 16)
!612 = !DILocation(line: 688, column: 21, scope: !611)
!613 = !DILocation(line: 689, column: 18, scope: !611)
!614 = !DILocation(line: 693, column: 21, scope: !615)
!615 = distinct !DILexicalBlock(scope: !578, file: !2, line: 693, column: 14)
!616 = !DILocation(line: 693, column: 14, scope: !615)
!617 = !DILocation(line: 693, column: 44, scope: !615)
!618 = !DILocation(line: 693, column: 14, scope: !578)
!619 = !DILocation(line: 695, column: 14, scope: !620)
!620 = distinct !DILexicalBlock(scope: !615, file: !2, line: 694, column: 12)
!621 = !DILocation(line: 696, column: 17, scope: !620)
!622 = !DILocation(line: 697, column: 14, scope: !620)
!623 = !DILocalVariable(name: "insize", scope: !578, file: !2, line: 701, type: !525)
!624 = !DILocation(line: 701, column: 16, scope: !578)
!625 = !DILocation(line: 701, column: 25, scope: !578)
!626 = !DILocation(line: 703, column: 20, scope: !578)
!627 = !DILocation(line: 703, column: 10, scope: !578)
!628 = !DILocation(line: 709, column: 17, scope: !629)
!629 = distinct !DILexicalBlock(scope: !578, file: !2, line: 709, column: 14)
!630 = !DILocation(line: 709, column: 45, scope: !629)
!631 = !DILocation(line: 709, column: 48, scope: !629)
!632 = !DILocation(line: 709, column: 131, scope: !629)
!633 = !DILocation(line: 709, column: 134, scope: !629)
!634 = !DILocation(line: 709, column: 147, scope: !629)
!635 = !DILocation(line: 709, column: 159, scope: !629)
!636 = !DILocation(line: 709, column: 169, scope: !629)
!637 = !DILocation(line: 709, column: 166, scope: !629)
!638 = !DILocation(line: 709, column: 177, scope: !629)
!639 = !DILocation(line: 709, column: 189, scope: !629)
!640 = !DILocation(line: 709, column: 199, scope: !629)
!641 = !DILocation(line: 709, column: 196, scope: !629)
!642 = !DILocation(line: 709, column: 14, scope: !578)
!643 = !DILocalVariable(name: "in_pos", scope: !644, file: !2, line: 711, type: !441)
!644 = distinct !DILexicalBlock(scope: !629, file: !2, line: 710, column: 12)
!645 = !DILocation(line: 711, column: 18, scope: !644)
!646 = !DILocation(line: 711, column: 34, scope: !644)
!647 = !DILocation(line: 711, column: 27, scope: !644)
!648 = !DILocation(line: 712, column: 21, scope: !649)
!649 = distinct !DILexicalBlock(scope: !644, file: !2, line: 712, column: 16)
!650 = !DILocation(line: 712, column: 18, scope: !649)
!651 = !DILocation(line: 712, column: 16, scope: !644)
!652 = !DILocation(line: 714, column: 20, scope: !653)
!653 = distinct !DILexicalBlock(scope: !654, file: !2, line: 714, column: 20)
!654 = distinct !DILexicalBlock(scope: !649, file: !2, line: 713, column: 14)
!655 = !DILocation(line: 714, column: 30, scope: !653)
!656 = !DILocation(line: 714, column: 20, scope: !654)
!657 = !DILocation(line: 715, column: 30, scope: !653)
!658 = !DILocation(line: 715, column: 28, scope: !653)
!659 = !DILocation(line: 715, column: 18, scope: !653)
!660 = !DILocalVariable(name: "whence", scope: !654, file: !2, line: 716, type: !49)
!661 = !DILocation(line: 716, column: 20, scope: !654)
!662 = !DILocation(line: 716, column: 35, scope: !654)
!663 = !DILocation(line: 716, column: 32, scope: !654)
!664 = !DILocation(line: 716, column: 45, scope: !654)
!665 = !DILocation(line: 716, column: 48, scope: !654)
!666 = !DILocation(line: 716, column: 58, scope: !654)
!667 = !DILocation(line: 0, scope: !654)
!668 = !DILocation(line: 716, column: 30, scope: !654)
!669 = !DILocation(line: 718, column: 20, scope: !670)
!670 = distinct !DILexicalBlock(scope: !654, file: !2, line: 718, column: 20)
!671 = !DILocation(line: 718, column: 54, scope: !670)
!672 = !DILocation(line: 718, column: 29, scope: !670)
!673 = !DILocation(line: 718, column: 27, scope: !670)
!674 = !DILocation(line: 718, column: 20, scope: !654)
!675 = !DILocation(line: 720, column: 20, scope: !676)
!676 = distinct !DILexicalBlock(scope: !670, file: !2, line: 719, column: 18)
!677 = !DILocation(line: 721, column: 23, scope: !676)
!678 = !DILocation(line: 723, column: 20, scope: !676)
!679 = !DILocation(line: 725, column: 13, scope: !654)
!680 = !DILocation(line: 726, column: 11, scope: !644)
!681 = !DILocalVariable(name: "inbuf", scope: !578, file: !2, line: 729, type: !51)
!682 = !DILocation(line: 729, column: 16, scope: !578)
!683 = !DILocation(line: 735, column: 17, scope: !684)
!684 = distinct !DILexicalBlock(scope: !578, file: !2, line: 735, column: 14)
!685 = !DILocation(line: 735, column: 24, scope: !684)
!686 = !DILocation(line: 735, column: 27, scope: !684)
!687 = !DILocation(line: 735, column: 37, scope: !684)
!688 = !DILocation(line: 735, column: 40, scope: !684)
!689 = !DILocation(line: 735, column: 57, scope: !684)
!690 = !DILocation(line: 735, column: 60, scope: !684)
!691 = !DILocation(line: 735, column: 70, scope: !684)
!692 = !DILocation(line: 735, column: 73, scope: !684)
!693 = !DILocation(line: 735, column: 14, scope: !578)
!694 = !DILocalVariable(name: "copy_cat_status", scope: !695, file: !2, line: 738, type: !49)
!695 = distinct !DILexicalBlock(scope: !684, file: !2, line: 737, column: 12)
!696 = !DILocation(line: 738, column: 18, scope: !695)
!697 = !DILocation(line: 738, column: 36, scope: !695)
!698 = !DILocation(line: 738, column: 46, scope: !695)
!699 = !DILocation(line: 738, column: 49, scope: !695)
!700 = !DILocation(line: 738, column: 78, scope: !695)
!701 = !DILocation(line: 740, column: 18, scope: !702)
!702 = distinct !DILexicalBlock(scope: !695, file: !2, line: 740, column: 18)
!703 = !DILocation(line: 740, column: 34, scope: !702)
!704 = !DILocation(line: 740, column: 18, scope: !695)
!705 = !DILocation(line: 742, column: 24, scope: !706)
!706 = distinct !DILexicalBlock(scope: !702, file: !2, line: 741, column: 16)
!707 = !DILocation(line: 743, column: 28, scope: !706)
!708 = !DILocation(line: 743, column: 26, scope: !706)
!709 = !DILocation(line: 743, column: 21, scope: !706)
!710 = !DILocation(line: 744, column: 16, scope: !706)
!711 = !DILocation(line: 747, column: 27, scope: !712)
!712 = distinct !DILexicalBlock(scope: !702, file: !2, line: 746, column: 16)
!713 = !DILocation(line: 747, column: 25, scope: !712)
!714 = !DILocation(line: 748, column: 39, scope: !712)
!715 = !DILocation(line: 748, column: 50, scope: !712)
!716 = !DILocation(line: 748, column: 26, scope: !712)
!717 = !DILocation(line: 748, column: 24, scope: !712)
!718 = !DILocation(line: 749, column: 36, scope: !712)
!719 = !DILocation(line: 749, column: 43, scope: !712)
!720 = !DILocation(line: 749, column: 24, scope: !712)
!721 = !DILocation(line: 749, column: 21, scope: !712)
!722 = !DILocation(line: 751, column: 12, scope: !695)
!723 = !DILocation(line: 755, column: 35, scope: !724)
!724 = distinct !DILexicalBlock(scope: !684, file: !2, line: 753, column: 12)
!725 = !DILocation(line: 755, column: 46, scope: !724)
!726 = !DILocation(line: 755, column: 53, scope: !724)
!727 = !DILocation(line: 755, column: 22, scope: !724)
!728 = !DILocation(line: 755, column: 20, scope: !724)
!729 = !DILocalVariable(name: "bufsize", scope: !724, file: !2, line: 778, type: !525)
!730 = !DILocation(line: 778, column: 20, scope: !724)
!731 = !DILocation(line: 779, column: 18, scope: !732)
!732 = distinct !DILexicalBlock(scope: !724, file: !2, line: 779, column: 18)
!733 = !DILocation(line: 779, column: 48, scope: !732)
!734 = !DILocation(line: 779, column: 51, scope: !732)
!735 = !DILocation(line: 779, column: 88, scope: !732)
!736 = !DILocation(line: 779, column: 91, scope: !732)
!737 = !DILocation(line: 779, column: 18, scope: !724)
!738 = !DILocation(line: 782, column: 16, scope: !732)
!739 = !DILocalVariable(name: "outbuf", scope: !724, file: !2, line: 783, type: !51)
!740 = !DILocation(line: 783, column: 20, scope: !724)
!741 = !DILocation(line: 783, column: 42, scope: !724)
!742 = !DILocation(line: 783, column: 53, scope: !724)
!743 = !DILocation(line: 783, column: 29, scope: !724)
!744 = !DILocation(line: 785, column: 25, scope: !724)
!745 = !DILocation(line: 785, column: 32, scope: !724)
!746 = !DILocation(line: 785, column: 40, scope: !724)
!747 = !DILocation(line: 785, column: 48, scope: !724)
!748 = !DILocation(line: 785, column: 57, scope: !724)
!749 = !DILocation(line: 785, column: 75, scope: !724)
!750 = !DILocation(line: 785, column: 86, scope: !724)
!751 = !DILocation(line: 785, column: 94, scope: !724)
!752 = !DILocation(line: 785, column: 111, scope: !724)
!753 = !DILocation(line: 785, column: 122, scope: !724)
!754 = !DILocation(line: 785, column: 20, scope: !724)
!755 = !DILocation(line: 785, column: 17, scope: !724)
!756 = !DILocation(line: 789, column: 25, scope: !724)
!757 = !DILocation(line: 789, column: 14, scope: !724)
!758 = !DILocation(line: 792, column: 21, scope: !578)
!759 = !DILocation(line: 792, column: 10, scope: !578)
!760 = !DILabel(scope: !578, name: "contin", file: !2, line: 794)
!761 = !DILocation(line: 794, column: 8, scope: !578)
!762 = !DILocation(line: 795, column: 15, scope: !763)
!763 = distinct !DILexicalBlock(scope: !578, file: !2, line: 795, column: 14)
!764 = !DILocation(line: 795, column: 29, scope: !763)
!765 = !DILocation(line: 795, column: 39, scope: !763)
!766 = !DILocation(line: 795, column: 32, scope: !763)
!767 = !DILocation(line: 795, column: 51, scope: !763)
!768 = !DILocation(line: 795, column: 14, scope: !578)
!769 = !DILocation(line: 797, column: 14, scope: !770)
!770 = distinct !DILexicalBlock(scope: !763, file: !2, line: 796, column: 12)
!771 = !DILocation(line: 798, column: 17, scope: !770)
!772 = !DILocation(line: 799, column: 12, scope: !770)
!773 = !DILocation(line: 800, column: 8, scope: !578)
!774 = !DILocation(line: 801, column: 13, scope: !46)
!775 = !DILocation(line: 801, column: 24, scope: !46)
!776 = !DILocation(line: 801, column: 22, scope: !46)
!777 = distinct !{!777, !575, !778, !357}
!778 = !DILocation(line: 801, column: 28, scope: !46)
!779 = !DILocation(line: 803, column: 10, scope: !780)
!780 = distinct !DILexicalBlock(scope: !46, file: !2, line: 803, column: 10)
!781 = !DILocation(line: 803, column: 10, scope: !46)
!782 = !DILocation(line: 805, column: 14, scope: !783)
!783 = distinct !DILexicalBlock(scope: !784, file: !2, line: 805, column: 14)
!784 = distinct !DILexicalBlock(scope: !780, file: !2, line: 804, column: 8)
!785 = !DILocation(line: 805, column: 50, scope: !783)
!786 = !DILocation(line: 805, column: 14, scope: !784)
!787 = !DILocation(line: 806, column: 12, scope: !783)
!788 = !DILocation(line: 807, column: 8, scope: !784)
!789 = !DILocation(line: 809, column: 10, scope: !790)
!790 = distinct !DILexicalBlock(scope: !46, file: !2, line: 809, column: 10)
!791 = !DILocation(line: 809, column: 26, scope: !790)
!792 = !DILocation(line: 809, column: 29, scope: !790)
!793 = !DILocation(line: 809, column: 50, scope: !790)
!794 = !DILocation(line: 809, column: 10, scope: !46)
!795 = !DILocation(line: 810, column: 8, scope: !790)
!796 = !DILocation(line: 812, column: 13, scope: !46)
!797 = !DILocation(line: 812, column: 6, scope: !46)
!798 = distinct !DISubprogram(name: "io_blksize", scope: !85, file: !85, line: 80, type: !799, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!799 = !DISubroutineType(types: !800)
!800 = !{!525, !801}
!801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !802, size: 64)
!802 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !398)
!803 = !DILocalVariable(name: "st", arg: 1, scope: !798, file: !85, line: 80, type: !801)
!804 = !DILocation(line: 80, column: 32, scope: !798)
!805 = !DILocalVariable(name: "blocksize", scope: !798, file: !85, line: 83, type: !525)
!806 = !DILocation(line: 83, column: 9, scope: !798)
!807 = !DILocation(line: 83, column: 21, scope: !798)
!808 = !DILocation(line: 83, column: 38, scope: !798)
!809 = !DILocation(line: 83, column: 58, scope: !798)
!810 = !DILocation(line: 87, column: 54, scope: !798)
!811 = !DILocation(line: 87, column: 52, scope: !798)
!812 = !DILocation(line: 87, column: 33, scope: !798)
!813 = !DILocation(line: 87, column: 13, scope: !798)
!814 = !DILocation(line: 95, column: 7, scope: !815)
!815 = distinct !DILexicalBlock(scope: !798, file: !85, line: 95, column: 7)
!816 = !DILocation(line: 95, column: 29, scope: !815)
!817 = !DILocation(line: 95, column: 32, scope: !815)
!818 = !DILocation(line: 95, column: 45, scope: !815)
!819 = !DILocation(line: 95, column: 55, scope: !815)
!820 = !DILocation(line: 95, column: 42, scope: !815)
!821 = !DILocation(line: 95, column: 7, scope: !798)
!822 = !DILocalVariable(name: "leading_zeros", scope: !823, file: !85, line: 97, type: !49)
!823 = distinct !DILexicalBlock(scope: !815, file: !85, line: 96, column: 5)
!824 = !DILocation(line: 97, column: 11, scope: !823)
!825 = !DILocation(line: 97, column: 51, scope: !823)
!826 = !DILocation(line: 97, column: 27, scope: !823)
!827 = !DILocalVariable(name: "power", scope: !828, file: !85, line: 100, type: !419)
!828 = distinct !DILexicalBlock(scope: !829, file: !85, line: 99, column: 9)
!829 = distinct !DILexicalBlock(scope: !823, file: !85, line: 98, column: 11)
!830 = !DILocation(line: 100, column: 30, scope: !828)
!831 = !DILocation(line: 100, column: 62, scope: !828)
!832 = !DILocation(line: 100, column: 60, scope: !828)
!833 = !DILocation(line: 100, column: 43, scope: !828)
!834 = !DILocation(line: 101, column: 15, scope: !835)
!835 = distinct !DILexicalBlock(scope: !828, file: !85, line: 101, column: 15)
!836 = !DILocation(line: 101, column: 21, scope: !835)
!837 = !DILocation(line: 101, column: 15, scope: !828)
!838 = !DILocation(line: 102, column: 25, scope: !835)
!839 = !DILocation(line: 102, column: 23, scope: !835)
!840 = !DILocation(line: 102, column: 13, scope: !835)
!841 = !DILocation(line: 104, column: 5, scope: !823)
!842 = !DILocation(line: 108, column: 10, scope: !798)
!843 = !DILocation(line: 108, column: 3, scope: !798)
!844 = distinct !DISubprogram(name: "copy_cat", scope: !2, file: !2, line: 501, type: !845, scopeLine: 502, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!845 = !DISubroutineType(types: !846)
!846 = !{!49}
!847 = !DILocalVariable(name: "copy_max", scope: !844, file: !2, line: 506, type: !848)
!848 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !849, line: 31, baseType: !850)
!849 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_ssize_t.h", directory: "", checksumkind: CSK_MD5, checksum: "9b4f5bef81dd94a882775a3ce650ab9c")
!850 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ssize_t", file: !96, line: 118, baseType: !435)
!851 = !DILocation(line: 506, column: 14, scope: !844)
!852 = !DILocalVariable(name: "some_copied", scope: !853, file: !2, line: 514, type: !92)
!853 = distinct !DILexicalBlock(scope: !844, file: !2, line: 514, column: 6)
!854 = !DILocation(line: 514, column: 16, scope: !853)
!855 = !DILocation(line: 514, column: 11, scope: !853)
!856 = !DILocation(line: 515, column: 33, scope: !857)
!857 = distinct !DILexicalBlock(scope: !853, file: !2, line: 514, column: 6)
!858 = !DILocation(line: 515, column: 78, scope: !857)
!859 = !DILocation(line: 515, column: 16, scope: !857)
!860 = !DILocation(line: 515, column: 8, scope: !857)
!861 = !DILocation(line: 518, column: 19, scope: !862)
!862 = distinct !DILexicalBlock(scope: !857, file: !2, line: 516, column: 10)
!863 = !DILocation(line: 518, column: 12, scope: !862)
!864 = !DILocation(line: 521, column: 16, scope: !865)
!865 = distinct !DILexicalBlock(scope: !862, file: !2, line: 521, column: 16)
!866 = !DILocation(line: 521, column: 22, scope: !865)
!867 = !DILocation(line: 521, column: 32, scope: !865)
!868 = !DILocation(line: 521, column: 47, scope: !865)
!869 = !DILocation(line: 521, column: 35, scope: !865)
!870 = !DILocation(line: 521, column: 54, scope: !865)
!871 = !DILocation(line: 521, column: 57, scope: !865)
!872 = !DILocation(line: 521, column: 63, scope: !865)
!873 = !DILocation(line: 521, column: 73, scope: !865)
!874 = !DILocation(line: 521, column: 76, scope: !865)
!875 = !DILocation(line: 521, column: 82, scope: !865)
!876 = !DILocation(line: 521, column: 91, scope: !865)
!877 = !DILocation(line: 521, column: 94, scope: !865)
!878 = !DILocation(line: 521, column: 100, scope: !865)
!879 = !DILocation(line: 521, column: 109, scope: !865)
!880 = !DILocation(line: 521, column: 112, scope: !865)
!881 = !DILocation(line: 521, column: 118, scope: !865)
!882 = !DILocation(line: 521, column: 129, scope: !865)
!883 = !DILocation(line: 521, column: 132, scope: !865)
!884 = !DILocation(line: 521, column: 138, scope: !865)
!885 = !DILocation(line: 521, column: 16, scope: !862)
!886 = !DILocation(line: 522, column: 14, scope: !865)
!887 = !DILocation(line: 523, column: 12, scope: !862)
!888 = !DILocation(line: 524, column: 12, scope: !862)
!889 = !DILocation(line: 525, column: 10, scope: !862)
!890 = !DILocation(line: 514, column: 51, scope: !857)
!891 = !DILocation(line: 514, column: 6, scope: !857)
!892 = distinct !{!892, !893, !894}
!893 = !DILocation(line: 514, column: 6, scope: !853)
!894 = !DILocation(line: 525, column: 10, scope: !853)
!895 = !DILocation(line: 526, column: 4, scope: !844)
!896 = distinct !DISubprogram(name: "simple_cat", scope: !2, file: !2, line: 156, type: !897, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!897 = !DISubroutineType(types: !898)
!898 = !{!92, !51, !525}
!899 = !DILocalVariable(name: "buf", arg: 1, scope: !896, file: !2, line: 156, type: !51)
!900 = !DILocation(line: 156, column: 22, scope: !896)
!901 = !DILocalVariable(name: "bufsize", arg: 2, scope: !896, file: !2, line: 156, type: !525)
!902 = !DILocation(line: 156, column: 33, scope: !896)
!903 = !DILocation(line: 160, column: 6, scope: !896)
!904 = !DILocalVariable(name: "n_read", scope: !905, file: !2, line: 164, type: !527)
!905 = distinct !DILexicalBlock(scope: !896, file: !2, line: 161, column: 8)
!906 = !DILocation(line: 164, column: 20, scope: !905)
!907 = !DILocation(line: 164, column: 40, scope: !905)
!908 = !DILocation(line: 164, column: 52, scope: !905)
!909 = !DILocation(line: 164, column: 57, scope: !905)
!910 = !DILocation(line: 164, column: 29, scope: !905)
!911 = !DILocation(line: 165, column: 14, scope: !912)
!912 = distinct !DILexicalBlock(scope: !905, file: !2, line: 165, column: 14)
!913 = !DILocation(line: 165, column: 21, scope: !912)
!914 = !DILocation(line: 165, column: 14, scope: !905)
!915 = !DILocation(line: 167, column: 14, scope: !916)
!916 = distinct !DILexicalBlock(scope: !912, file: !2, line: 166, column: 12)
!917 = !DILocation(line: 168, column: 14, scope: !916)
!918 = !DILocation(line: 173, column: 14, scope: !919)
!919 = distinct !DILexicalBlock(scope: !905, file: !2, line: 173, column: 14)
!920 = !DILocation(line: 173, column: 21, scope: !919)
!921 = !DILocation(line: 173, column: 14, scope: !905)
!922 = !DILocation(line: 174, column: 12, scope: !919)
!923 = !DILocation(line: 178, column: 41, scope: !924)
!924 = distinct !DILexicalBlock(scope: !905, file: !2, line: 178, column: 14)
!925 = !DILocation(line: 178, column: 46, scope: !924)
!926 = !DILocation(line: 178, column: 14, scope: !924)
!927 = !DILocation(line: 178, column: 57, scope: !924)
!928 = !DILocation(line: 178, column: 54, scope: !924)
!929 = !DILocation(line: 178, column: 14, scope: !905)
!930 = !DILocation(line: 179, column: 12, scope: !924)
!931 = distinct !{!931, !903, !932}
!932 = !DILocation(line: 180, column: 8, scope: !896)
!933 = !DILocation(line: 181, column: 4, scope: !896)
!934 = distinct !DISubprogram(name: "cat", scope: !2, file: !2, line: 212, type: !935, scopeLine: 215, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!935 = !DISubroutineType(types: !936)
!936 = !{!92, !51, !525, !51, !525, !92, !92, !92, !92, !92, !92}
!937 = !DILocalVariable(name: "inbuf", arg: 1, scope: !934, file: !2, line: 212, type: !51)
!938 = !DILocation(line: 212, column: 15, scope: !934)
!939 = !DILocalVariable(name: "insize", arg: 2, scope: !934, file: !2, line: 212, type: !525)
!940 = !DILocation(line: 212, column: 28, scope: !934)
!941 = !DILocalVariable(name: "outbuf", arg: 3, scope: !934, file: !2, line: 212, type: !51)
!942 = !DILocation(line: 212, column: 42, scope: !934)
!943 = !DILocalVariable(name: "outsize", arg: 4, scope: !934, file: !2, line: 212, type: !525)
!944 = !DILocation(line: 212, column: 56, scope: !934)
!945 = !DILocalVariable(name: "show_nonprinting", arg: 5, scope: !934, file: !2, line: 213, type: !92)
!946 = !DILocation(line: 213, column: 14, scope: !934)
!947 = !DILocalVariable(name: "show_tabs", arg: 6, scope: !934, file: !2, line: 213, type: !92)
!948 = !DILocation(line: 213, column: 37, scope: !934)
!949 = !DILocalVariable(name: "number", arg: 7, scope: !934, file: !2, line: 213, type: !92)
!950 = !DILocation(line: 213, column: 53, scope: !934)
!951 = !DILocalVariable(name: "number_nonblank", arg: 8, scope: !934, file: !2, line: 213, type: !92)
!952 = !DILocation(line: 213, column: 66, scope: !934)
!953 = !DILocalVariable(name: "show_ends", arg: 9, scope: !934, file: !2, line: 214, type: !92)
!954 = !DILocation(line: 214, column: 14, scope: !934)
!955 = !DILocalVariable(name: "squeeze_blank", arg: 10, scope: !934, file: !2, line: 214, type: !92)
!956 = !DILocation(line: 214, column: 30, scope: !934)
!957 = !DILocalVariable(name: "ch", scope: !934, file: !2, line: 217, type: !958)
!958 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!959 = !DILocation(line: 217, column: 20, scope: !934)
!960 = !DILocalVariable(name: "newlines", scope: !934, file: !2, line: 224, type: !49)
!961 = !DILocation(line: 224, column: 10, scope: !934)
!962 = !DILocation(line: 224, column: 21, scope: !934)
!963 = !DILocalVariable(name: "use_fionread", scope: !934, file: !2, line: 229, type: !92)
!964 = !DILocation(line: 229, column: 11, scope: !934)
!965 = !DILocalVariable(name: "eob", scope: !934, file: !2, line: 237, type: !51)
!966 = !DILocation(line: 237, column: 12, scope: !934)
!967 = !DILocation(line: 237, column: 18, scope: !934)
!968 = !DILocalVariable(name: "bpin", scope: !934, file: !2, line: 240, type: !51)
!969 = !DILocation(line: 240, column: 12, scope: !934)
!970 = !DILocation(line: 240, column: 19, scope: !934)
!971 = !DILocation(line: 240, column: 23, scope: !934)
!972 = !DILocalVariable(name: "bpout", scope: !934, file: !2, line: 243, type: !51)
!973 = !DILocation(line: 243, column: 12, scope: !934)
!974 = !DILocation(line: 243, column: 20, scope: !934)
!975 = !DILocation(line: 245, column: 6, scope: !934)
!976 = !DILocation(line: 247, column: 10, scope: !977)
!977 = distinct !DILexicalBlock(scope: !934, file: !2, line: 246, column: 8)
!978 = !DILocation(line: 251, column: 18, scope: !979)
!979 = distinct !DILexicalBlock(scope: !980, file: !2, line: 251, column: 18)
!980 = distinct !DILexicalBlock(scope: !977, file: !2, line: 248, column: 12)
!981 = !DILocation(line: 251, column: 27, scope: !979)
!982 = !DILocation(line: 251, column: 25, scope: !979)
!983 = !DILocation(line: 251, column: 38, scope: !979)
!984 = !DILocation(line: 251, column: 35, scope: !979)
!985 = !DILocation(line: 251, column: 18, scope: !980)
!986 = !DILocalVariable(name: "wp", scope: !987, file: !2, line: 253, type: !51)
!987 = distinct !DILexicalBlock(scope: !979, file: !2, line: 252, column: 16)
!988 = !DILocation(line: 253, column: 24, scope: !987)
!989 = !DILocation(line: 253, column: 29, scope: !987)
!990 = !DILocalVariable(name: "remaining_bytes", scope: !987, file: !2, line: 254, type: !525)
!991 = !DILocation(line: 254, column: 24, scope: !987)
!992 = !DILocation(line: 255, column: 18, scope: !987)
!993 = !DILocation(line: 257, column: 53, scope: !994)
!994 = distinct !DILexicalBlock(scope: !995, file: !2, line: 257, column: 26)
!995 = distinct !DILexicalBlock(scope: !987, file: !2, line: 256, column: 20)
!996 = !DILocation(line: 257, column: 57, scope: !994)
!997 = !DILocation(line: 257, column: 26, scope: !994)
!998 = !DILocation(line: 257, column: 69, scope: !994)
!999 = !DILocation(line: 257, column: 66, scope: !994)
!1000 = !DILocation(line: 257, column: 26, scope: !995)
!1001 = !DILocation(line: 258, column: 24, scope: !994)
!1002 = !DILocation(line: 259, column: 28, scope: !995)
!1003 = !DILocation(line: 259, column: 25, scope: !995)
!1004 = !DILocation(line: 260, column: 40, scope: !995)
!1005 = !DILocation(line: 260, column: 48, scope: !995)
!1006 = !DILocation(line: 260, column: 46, scope: !995)
!1007 = !DILocation(line: 260, column: 38, scope: !995)
!1008 = !DILocation(line: 261, column: 20, scope: !995)
!1009 = !DILocation(line: 262, column: 25, scope: !987)
!1010 = !DILocation(line: 262, column: 36, scope: !987)
!1011 = !DILocation(line: 262, column: 33, scope: !987)
!1012 = distinct !{!1012, !992, !1013, !357}
!1013 = !DILocation(line: 262, column: 51, scope: !987)
!1014 = !DILocation(line: 267, column: 18, scope: !987)
!1015 = !DILocation(line: 268, column: 26, scope: !987)
!1016 = !DILocation(line: 268, column: 35, scope: !987)
!1017 = !DILocation(line: 268, column: 33, scope: !987)
!1018 = !DILocation(line: 268, column: 24, scope: !987)
!1019 = !DILocation(line: 269, column: 16, scope: !987)
!1020 = !DILocation(line: 273, column: 18, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !980, file: !2, line: 273, column: 18)
!1022 = !DILocation(line: 273, column: 25, scope: !1021)
!1023 = !DILocation(line: 273, column: 23, scope: !1021)
!1024 = !DILocation(line: 273, column: 18, scope: !980)
!1025 = !DILocalVariable(name: "input_pending", scope: !1026, file: !2, line: 275, type: !92)
!1026 = distinct !DILexicalBlock(scope: !1021, file: !2, line: 274, column: 16)
!1027 = !DILocation(line: 275, column: 23, scope: !1026)
!1028 = !DILocalVariable(name: "n_to_read", scope: !1026, file: !2, line: 277, type: !49)
!1029 = !DILocation(line: 277, column: 22, scope: !1026)
!1030 = !DILocation(line: 283, column: 22, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1026, file: !2, line: 283, column: 22)
!1032 = !DILocation(line: 283, column: 35, scope: !1031)
!1033 = !DILocation(line: 283, column: 45, scope: !1031)
!1034 = !DILocation(line: 283, column: 38, scope: !1031)
!1035 = !DILocation(line: 283, column: 79, scope: !1031)
!1036 = !DILocation(line: 283, column: 22, scope: !1026)
!1037 = !DILocation(line: 291, column: 26, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1039, file: !2, line: 291, column: 26)
!1039 = distinct !DILexicalBlock(scope: !1031, file: !2, line: 284, column: 20)
!1040 = !DILocation(line: 291, column: 32, scope: !1038)
!1041 = !DILocation(line: 291, column: 46, scope: !1038)
!1042 = !DILocation(line: 291, column: 49, scope: !1038)
!1043 = !DILocation(line: 291, column: 55, scope: !1038)
!1044 = !DILocation(line: 291, column: 65, scope: !1038)
!1045 = !DILocation(line: 291, column: 68, scope: !1038)
!1046 = !DILocation(line: 291, column: 74, scope: !1038)
!1047 = !DILocation(line: 291, column: 84, scope: !1038)
!1048 = !DILocation(line: 291, column: 87, scope: !1038)
!1049 = !DILocation(line: 291, column: 93, scope: !1038)
!1050 = !DILocation(line: 291, column: 103, scope: !1038)
!1051 = !DILocation(line: 291, column: 106, scope: !1038)
!1052 = !DILocation(line: 291, column: 112, scope: !1038)
!1053 = !DILocation(line: 291, column: 26, scope: !1039)
!1054 = !DILocation(line: 292, column: 37, scope: !1038)
!1055 = !DILocation(line: 292, column: 24, scope: !1038)
!1056 = !DILocation(line: 295, column: 26, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1038, file: !2, line: 294, column: 24)
!1058 = !DILocation(line: 297, column: 38, scope: !1057)
!1059 = !DILocation(line: 297, column: 36, scope: !1057)
!1060 = !DILocation(line: 298, column: 26, scope: !1057)
!1061 = !DILocation(line: 300, column: 20, scope: !1039)
!1062 = !DILocation(line: 301, column: 22, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1026, file: !2, line: 301, column: 22)
!1064 = !DILocation(line: 301, column: 32, scope: !1063)
!1065 = !DILocation(line: 301, column: 22, scope: !1026)
!1066 = !DILocation(line: 302, column: 34, scope: !1063)
!1067 = !DILocation(line: 302, column: 20, scope: !1063)
!1068 = !DILocation(line: 305, column: 23, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1026, file: !2, line: 305, column: 22)
!1070 = !DILocation(line: 305, column: 22, scope: !1026)
!1071 = !DILocation(line: 306, column: 35, scope: !1069)
!1072 = !DILocation(line: 306, column: 20, scope: !1069)
!1073 = !DILocalVariable(name: "n_read", scope: !1026, file: !2, line: 310, type: !527)
!1074 = !DILocation(line: 310, column: 28, scope: !1026)
!1075 = !DILocation(line: 310, column: 48, scope: !1026)
!1076 = !DILocation(line: 310, column: 60, scope: !1026)
!1077 = !DILocation(line: 310, column: 67, scope: !1026)
!1078 = !DILocation(line: 310, column: 37, scope: !1026)
!1079 = !DILocation(line: 311, column: 22, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1026, file: !2, line: 311, column: 22)
!1081 = !DILocation(line: 311, column: 29, scope: !1080)
!1082 = !DILocation(line: 311, column: 22, scope: !1026)
!1083 = !DILocation(line: 313, column: 22, scope: !1084)
!1084 = distinct !DILexicalBlock(scope: !1080, file: !2, line: 312, column: 20)
!1085 = !DILocation(line: 314, column: 37, scope: !1084)
!1086 = !DILocation(line: 314, column: 22, scope: !1084)
!1087 = !DILocation(line: 315, column: 34, scope: !1084)
!1088 = !DILocation(line: 315, column: 32, scope: !1084)
!1089 = !DILocation(line: 316, column: 22, scope: !1084)
!1090 = !DILocation(line: 318, column: 22, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1026, file: !2, line: 318, column: 22)
!1092 = !DILocation(line: 318, column: 29, scope: !1091)
!1093 = !DILocation(line: 318, column: 22, scope: !1026)
!1094 = !DILocation(line: 320, column: 37, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1091, file: !2, line: 319, column: 20)
!1096 = !DILocation(line: 320, column: 22, scope: !1095)
!1097 = !DILocation(line: 321, column: 34, scope: !1095)
!1098 = !DILocation(line: 321, column: 32, scope: !1095)
!1099 = !DILocation(line: 322, column: 22, scope: !1095)
!1100 = !DILocation(line: 328, column: 25, scope: !1026)
!1101 = !DILocation(line: 328, column: 23, scope: !1026)
!1102 = !DILocation(line: 329, column: 24, scope: !1026)
!1103 = !DILocation(line: 329, column: 31, scope: !1026)
!1104 = !DILocation(line: 329, column: 29, scope: !1026)
!1105 = !DILocation(line: 329, column: 22, scope: !1026)
!1106 = !DILocation(line: 330, column: 19, scope: !1026)
!1107 = !DILocation(line: 330, column: 23, scope: !1026)
!1108 = !DILocation(line: 331, column: 16, scope: !1026)
!1109 = !DILocation(line: 339, column: 22, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1111, file: !2, line: 339, column: 22)
!1111 = distinct !DILexicalBlock(scope: !1021, file: !2, line: 333, column: 16)
!1112 = !DILocation(line: 339, column: 33, scope: !1110)
!1113 = !DILocation(line: 339, column: 22, scope: !1111)
!1114 = !DILocation(line: 341, column: 26, scope: !1115)
!1115 = distinct !DILexicalBlock(scope: !1116, file: !2, line: 341, column: 26)
!1116 = distinct !DILexicalBlock(scope: !1110, file: !2, line: 340, column: 20)
!1117 = !DILocation(line: 341, column: 35, scope: !1115)
!1118 = !DILocation(line: 341, column: 26, scope: !1116)
!1119 = !DILocation(line: 346, column: 35, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1115, file: !2, line: 342, column: 24)
!1121 = !DILocation(line: 351, column: 30, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1120, file: !2, line: 351, column: 30)
!1123 = !DILocation(line: 351, column: 30, scope: !1120)
!1124 = !DILocation(line: 353, column: 40, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1122, file: !2, line: 352, column: 28)
!1126 = !DILocation(line: 353, column: 35, scope: !1125)
!1127 = !DILocation(line: 353, column: 33, scope: !1125)
!1128 = !DILocation(line: 354, column: 30, scope: !1125)
!1129 = !DILocation(line: 356, column: 24, scope: !1120)
!1130 = !DILocation(line: 360, column: 26, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1116, file: !2, line: 360, column: 26)
!1132 = !DILocation(line: 360, column: 33, scope: !1131)
!1133 = !DILocation(line: 360, column: 37, scope: !1131)
!1134 = !DILocation(line: 360, column: 26, scope: !1116)
!1135 = !DILocation(line: 362, column: 26, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1131, file: !2, line: 361, column: 24)
!1137 = !DILocation(line: 363, column: 34, scope: !1136)
!1138 = !DILocation(line: 363, column: 32, scope: !1136)
!1139 = !DILocation(line: 364, column: 24, scope: !1136)
!1140 = !DILocation(line: 365, column: 20, scope: !1116)
!1141 = !DILocation(line: 368, column: 22, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1111, file: !2, line: 368, column: 22)
!1143 = !DILocation(line: 368, column: 22, scope: !1111)
!1144 = !DILocation(line: 370, column: 26, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1146, file: !2, line: 370, column: 26)
!1146 = distinct !DILexicalBlock(scope: !1142, file: !2, line: 369, column: 20)
!1147 = !DILocation(line: 370, column: 26, scope: !1146)
!1148 = !DILocation(line: 372, column: 32, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1145, file: !2, line: 371, column: 24)
!1150 = !DILocation(line: 372, column: 35, scope: !1149)
!1151 = !DILocation(line: 373, column: 32, scope: !1149)
!1152 = !DILocation(line: 373, column: 35, scope: !1149)
!1153 = !DILocation(line: 374, column: 37, scope: !1149)
!1154 = !DILocation(line: 375, column: 24, scope: !1149)
!1155 = !DILocation(line: 376, column: 28, scope: !1146)
!1156 = !DILocation(line: 376, column: 31, scope: !1146)
!1157 = !DILocation(line: 377, column: 20, scope: !1146)
!1158 = !DILocation(line: 381, column: 24, scope: !1111)
!1159 = !DILocation(line: 381, column: 27, scope: !1111)
!1160 = !DILocation(line: 383, column: 24, scope: !980)
!1161 = !DILocation(line: 383, column: 19, scope: !980)
!1162 = !DILocation(line: 383, column: 17, scope: !980)
!1163 = !DILocation(line: 384, column: 12, scope: !980)
!1164 = !DILocation(line: 385, column: 17, scope: !977)
!1165 = !DILocation(line: 385, column: 20, scope: !977)
!1166 = distinct !{!1166, !976, !1167, !357}
!1167 = !DILocation(line: 385, column: 27, scope: !977)
!1168 = !DILocation(line: 389, column: 14, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !977, file: !2, line: 389, column: 14)
!1170 = !DILocation(line: 389, column: 14, scope: !977)
!1171 = !DILocation(line: 391, column: 20, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1169, file: !2, line: 390, column: 12)
!1173 = !DILocation(line: 391, column: 23, scope: !1172)
!1174 = !DILocation(line: 392, column: 25, scope: !1172)
!1175 = !DILocation(line: 393, column: 12, scope: !1172)
!1176 = !DILocation(line: 397, column: 14, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !977, file: !2, line: 397, column: 14)
!1178 = !DILocation(line: 397, column: 23, scope: !1177)
!1179 = !DILocation(line: 397, column: 28, scope: !1177)
!1180 = !DILocation(line: 397, column: 31, scope: !1177)
!1181 = !DILocation(line: 397, column: 14, scope: !977)
!1182 = !DILocation(line: 399, column: 14, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1177, file: !2, line: 398, column: 12)
!1184 = !DILocation(line: 400, column: 22, scope: !1183)
!1185 = !DILocation(line: 400, column: 20, scope: !1183)
!1186 = !DILocation(line: 401, column: 12, scope: !1183)
!1187 = !DILocation(line: 409, column: 14, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !977, file: !2, line: 409, column: 14)
!1189 = !DILocation(line: 409, column: 14, scope: !977)
!1190 = !DILocation(line: 411, column: 14, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1188, file: !2, line: 410, column: 12)
!1192 = !DILocation(line: 413, column: 22, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1194, file: !2, line: 413, column: 22)
!1194 = distinct !DILexicalBlock(scope: !1191, file: !2, line: 412, column: 16)
!1195 = !DILocation(line: 413, column: 25, scope: !1193)
!1196 = !DILocation(line: 413, column: 22, scope: !1194)
!1197 = !DILocation(line: 415, column: 26, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1199, file: !2, line: 415, column: 26)
!1199 = distinct !DILexicalBlock(scope: !1193, file: !2, line: 414, column: 20)
!1200 = !DILocation(line: 415, column: 29, scope: !1198)
!1201 = !DILocation(line: 415, column: 26, scope: !1199)
!1202 = !DILocation(line: 416, column: 35, scope: !1198)
!1203 = !DILocation(line: 416, column: 30, scope: !1198)
!1204 = !DILocation(line: 416, column: 33, scope: !1198)
!1205 = !DILocation(line: 416, column: 24, scope: !1198)
!1206 = !DILocation(line: 417, column: 31, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1198, file: !2, line: 417, column: 31)
!1208 = !DILocation(line: 417, column: 34, scope: !1207)
!1209 = !DILocation(line: 417, column: 31, scope: !1198)
!1210 = !DILocation(line: 419, column: 32, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1207, file: !2, line: 418, column: 24)
!1212 = !DILocation(line: 419, column: 35, scope: !1211)
!1213 = !DILocation(line: 420, column: 32, scope: !1211)
!1214 = !DILocation(line: 420, column: 35, scope: !1211)
!1215 = !DILocation(line: 421, column: 24, scope: !1211)
!1216 = !DILocation(line: 424, column: 32, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1207, file: !2, line: 423, column: 24)
!1218 = !DILocation(line: 424, column: 35, scope: !1217)
!1219 = !DILocation(line: 425, column: 32, scope: !1217)
!1220 = !DILocation(line: 425, column: 35, scope: !1217)
!1221 = !DILocation(line: 426, column: 30, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1217, file: !2, line: 426, column: 30)
!1223 = !DILocation(line: 426, column: 33, scope: !1222)
!1224 = !DILocation(line: 426, column: 30, scope: !1217)
!1225 = !DILocation(line: 428, column: 34, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1227, file: !2, line: 428, column: 34)
!1227 = distinct !DILexicalBlock(scope: !1222, file: !2, line: 427, column: 28)
!1228 = !DILocation(line: 428, column: 37, scope: !1226)
!1229 = !DILocation(line: 428, column: 34, scope: !1227)
!1230 = !DILocation(line: 429, column: 43, scope: !1226)
!1231 = !DILocation(line: 429, column: 46, scope: !1226)
!1232 = !DILocation(line: 429, column: 38, scope: !1226)
!1233 = !DILocation(line: 429, column: 41, scope: !1226)
!1234 = !DILocation(line: 429, column: 32, scope: !1226)
!1235 = !DILocation(line: 432, column: 40, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1226, file: !2, line: 431, column: 32)
!1237 = !DILocation(line: 432, column: 43, scope: !1236)
!1238 = !DILocation(line: 433, column: 40, scope: !1236)
!1239 = !DILocation(line: 433, column: 43, scope: !1236)
!1240 = !DILocation(line: 435, column: 28, scope: !1227)
!1241 = !DILocation(line: 438, column: 36, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1222, file: !2, line: 437, column: 28)
!1243 = !DILocation(line: 438, column: 39, scope: !1242)
!1244 = !DILocation(line: 439, column: 41, scope: !1242)
!1245 = !DILocation(line: 439, column: 44, scope: !1242)
!1246 = !DILocation(line: 439, column: 50, scope: !1242)
!1247 = !DILocation(line: 439, column: 36, scope: !1242)
!1248 = !DILocation(line: 439, column: 39, scope: !1242)
!1249 = !DILocation(line: 442, column: 20, scope: !1199)
!1250 = !DILocation(line: 443, column: 27, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1193, file: !2, line: 443, column: 27)
!1252 = !DILocation(line: 443, column: 30, scope: !1251)
!1253 = !DILocation(line: 443, column: 38, scope: !1251)
!1254 = !DILocation(line: 443, column: 42, scope: !1251)
!1255 = !DILocation(line: 443, column: 27, scope: !1193)
!1256 = !DILocation(line: 444, column: 26, scope: !1251)
!1257 = !DILocation(line: 444, column: 29, scope: !1251)
!1258 = !DILocation(line: 444, column: 20, scope: !1251)
!1259 = !DILocation(line: 445, column: 27, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1251, file: !2, line: 445, column: 27)
!1261 = !DILocation(line: 445, column: 30, scope: !1260)
!1262 = !DILocation(line: 445, column: 27, scope: !1251)
!1263 = !DILocation(line: 447, column: 31, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1260, file: !2, line: 446, column: 20)
!1265 = !DILocation(line: 448, column: 22, scope: !1264)
!1266 = !DILocation(line: 452, column: 28, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1260, file: !2, line: 451, column: 20)
!1268 = !DILocation(line: 452, column: 31, scope: !1267)
!1269 = !DILocation(line: 453, column: 33, scope: !1267)
!1270 = !DILocation(line: 453, column: 36, scope: !1267)
!1271 = !DILocation(line: 453, column: 28, scope: !1267)
!1272 = !DILocation(line: 453, column: 31, scope: !1267)
!1273 = !DILocation(line: 456, column: 28, scope: !1194)
!1274 = !DILocation(line: 456, column: 23, scope: !1194)
!1275 = !DILocation(line: 456, column: 21, scope: !1194)
!1276 = distinct !{!1276, !1190, !1277}
!1277 = !DILocation(line: 457, column: 16, scope: !1191)
!1278 = !DILocation(line: 458, column: 12, scope: !1191)
!1279 = !DILocation(line: 462, column: 14, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1188, file: !2, line: 460, column: 12)
!1281 = !DILocation(line: 464, column: 22, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1283, file: !2, line: 464, column: 22)
!1283 = distinct !DILexicalBlock(scope: !1280, file: !2, line: 463, column: 16)
!1284 = !DILocation(line: 464, column: 25, scope: !1282)
!1285 = !DILocation(line: 464, column: 33, scope: !1282)
!1286 = !DILocation(line: 464, column: 36, scope: !1282)
!1287 = !DILocation(line: 464, column: 22, scope: !1283)
!1288 = !DILocation(line: 466, column: 28, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1282, file: !2, line: 465, column: 20)
!1290 = !DILocation(line: 466, column: 31, scope: !1289)
!1291 = !DILocation(line: 467, column: 33, scope: !1289)
!1292 = !DILocation(line: 467, column: 36, scope: !1289)
!1293 = !DILocation(line: 467, column: 28, scope: !1289)
!1294 = !DILocation(line: 467, column: 31, scope: !1289)
!1295 = !DILocation(line: 468, column: 20, scope: !1289)
!1296 = !DILocation(line: 469, column: 27, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1282, file: !2, line: 469, column: 27)
!1298 = !DILocation(line: 469, column: 30, scope: !1297)
!1299 = !DILocation(line: 469, column: 27, scope: !1282)
!1300 = !DILocation(line: 471, column: 26, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1302, file: !2, line: 471, column: 26)
!1302 = distinct !DILexicalBlock(scope: !1297, file: !2, line: 470, column: 20)
!1303 = !DILocation(line: 471, column: 29, scope: !1301)
!1304 = !DILocation(line: 471, column: 37, scope: !1301)
!1305 = !DILocation(line: 471, column: 41, scope: !1301)
!1306 = !DILocation(line: 471, column: 40, scope: !1301)
!1307 = !DILocation(line: 471, column: 46, scope: !1301)
!1308 = !DILocation(line: 471, column: 54, scope: !1301)
!1309 = !DILocation(line: 471, column: 57, scope: !1301)
!1310 = !DILocation(line: 471, column: 26, scope: !1302)
!1311 = !DILocation(line: 473, column: 30, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1313, file: !2, line: 473, column: 30)
!1313 = distinct !DILexicalBlock(scope: !1301, file: !2, line: 472, column: 24)
!1314 = !DILocation(line: 473, column: 38, scope: !1312)
!1315 = !DILocation(line: 473, column: 35, scope: !1312)
!1316 = !DILocation(line: 473, column: 30, scope: !1313)
!1317 = !DILocation(line: 474, column: 39, scope: !1312)
!1318 = !DILocation(line: 474, column: 28, scope: !1312)
!1319 = !DILocation(line: 477, column: 36, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1312, file: !2, line: 476, column: 28)
!1321 = !DILocation(line: 477, column: 39, scope: !1320)
!1322 = !DILocation(line: 478, column: 36, scope: !1320)
!1323 = !DILocation(line: 478, column: 39, scope: !1320)
!1324 = !DILocation(line: 480, column: 24, scope: !1313)
!1325 = !DILocation(line: 482, column: 35, scope: !1301)
!1326 = !DILocation(line: 482, column: 30, scope: !1301)
!1327 = !DILocation(line: 482, column: 33, scope: !1301)
!1328 = !DILocation(line: 483, column: 20, scope: !1302)
!1329 = !DILocation(line: 486, column: 31, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1297, file: !2, line: 485, column: 20)
!1331 = !DILocation(line: 487, column: 22, scope: !1330)
!1332 = !DILocation(line: 490, column: 28, scope: !1283)
!1333 = !DILocation(line: 490, column: 23, scope: !1283)
!1334 = !DILocation(line: 490, column: 21, scope: !1283)
!1335 = distinct !{!1335, !1279, !1336}
!1336 = !DILocation(line: 491, column: 16, scope: !1280)
!1337 = distinct !{!1337, !975, !1338}
!1338 = !DILocation(line: 493, column: 8, scope: !934)
!1339 = !DILocation(line: 494, column: 4, scope: !934)
!1340 = distinct !DISubprogram(name: "write_error", scope: !56, file: !56, line: 741, type: !323, scopeLine: 742, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1341 = !DILocalVariable(name: "saved_errno", scope: !1340, file: !56, line: 743, type: !49)
!1342 = !DILocation(line: 743, column: 7, scope: !1340)
!1343 = !DILocation(line: 743, column: 21, scope: !1340)
!1344 = !DILocation(line: 744, column: 11, scope: !1340)
!1345 = !DILocation(line: 744, column: 3, scope: !1340)
!1346 = !DILocation(line: 745, column: 11, scope: !1340)
!1347 = !DILocation(line: 745, column: 3, scope: !1340)
!1348 = !DILocation(line: 746, column: 3, scope: !1340)
!1349 = !DILocation(line: 747, column: 3, scope: !1340)
!1350 = distinct !DISubprogram(name: "is_ENOTSUP", scope: !56, file: !56, line: 774, type: !1351, scopeLine: 775, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1351 = !DISubroutineType(types: !1352)
!1352 = !{!92, !49}
!1353 = !DILocalVariable(name: "err", arg: 1, scope: !1350, file: !56, line: 774, type: !49)
!1354 = !DILocation(line: 774, column: 17, scope: !1350)
!1355 = !DILocation(line: 776, column: 10, scope: !1350)
!1356 = !DILocation(line: 776, column: 14, scope: !1350)
!1357 = !DILocation(line: 776, column: 28, scope: !1350)
!1358 = !DILocation(line: 776, column: 57, scope: !1350)
!1359 = !DILocation(line: 776, column: 61, scope: !1350)
!1360 = !DILocation(line: 776, column: 3, scope: !1350)
!1361 = distinct !DISubprogram(name: "write_pending", scope: !2, file: !2, line: 188, type: !1362, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1362 = !DISubroutineType(types: !1363)
!1363 = !{null, !51, !50}
!1364 = !DILocalVariable(name: "outbuf", arg: 1, scope: !1361, file: !2, line: 188, type: !51)
!1365 = !DILocation(line: 188, column: 25, scope: !1361)
!1366 = !DILocalVariable(name: "bpout", arg: 2, scope: !1361, file: !2, line: 188, type: !50)
!1367 = !DILocation(line: 188, column: 40, scope: !1361)
!1368 = !DILocalVariable(name: "n_write", scope: !1361, file: !2, line: 190, type: !525)
!1369 = !DILocation(line: 190, column: 12, scope: !1361)
!1370 = !DILocation(line: 190, column: 23, scope: !1361)
!1371 = !DILocation(line: 190, column: 22, scope: !1361)
!1372 = !DILocation(line: 190, column: 31, scope: !1361)
!1373 = !DILocation(line: 190, column: 29, scope: !1361)
!1374 = !DILocation(line: 191, column: 14, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1361, file: !2, line: 191, column: 10)
!1376 = !DILocation(line: 191, column: 12, scope: !1375)
!1377 = !DILocation(line: 191, column: 10, scope: !1361)
!1378 = !DILocation(line: 193, column: 41, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1380, file: !2, line: 193, column: 14)
!1380 = distinct !DILexicalBlock(scope: !1375, file: !2, line: 192, column: 8)
!1381 = !DILocation(line: 193, column: 49, scope: !1379)
!1382 = !DILocation(line: 193, column: 14, scope: !1379)
!1383 = !DILocation(line: 193, column: 61, scope: !1379)
!1384 = !DILocation(line: 193, column: 58, scope: !1379)
!1385 = !DILocation(line: 193, column: 14, scope: !1380)
!1386 = !DILocation(line: 194, column: 12, scope: !1379)
!1387 = !DILocation(line: 195, column: 19, scope: !1380)
!1388 = !DILocation(line: 195, column: 11, scope: !1380)
!1389 = !DILocation(line: 195, column: 17, scope: !1380)
!1390 = !DILocation(line: 196, column: 8, scope: !1380)
!1391 = !DILocation(line: 197, column: 4, scope: !1361)
!1392 = distinct !DISubprogram(name: "next_line_num", scope: !2, file: !2, line: 132, type: !323, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1393 = !DILocalVariable(name: "endp", scope: !1392, file: !2, line: 134, type: !51)
!1394 = !DILocation(line: 134, column: 12, scope: !1392)
!1395 = !DILocation(line: 134, column: 19, scope: !1392)
!1396 = !DILocation(line: 135, column: 6, scope: !1392)
!1397 = !DILocation(line: 137, column: 16, scope: !1398)
!1398 = distinct !DILexicalBlock(scope: !1399, file: !2, line: 137, column: 14)
!1399 = distinct !DILexicalBlock(scope: !1392, file: !2, line: 136, column: 8)
!1400 = !DILocation(line: 137, column: 21, scope: !1398)
!1401 = !DILocation(line: 137, column: 14, scope: !1398)
!1402 = !DILocation(line: 137, column: 24, scope: !1398)
!1403 = !DILocation(line: 137, column: 14, scope: !1399)
!1404 = !DILocation(line: 138, column: 12, scope: !1398)
!1405 = !DILocation(line: 139, column: 15, scope: !1399)
!1406 = !DILocation(line: 139, column: 18, scope: !1399)
!1407 = !DILocation(line: 140, column: 8, scope: !1399)
!1408 = !DILocation(line: 141, column: 13, scope: !1392)
!1409 = !DILocation(line: 141, column: 21, scope: !1392)
!1410 = !DILocation(line: 141, column: 18, scope: !1392)
!1411 = distinct !{!1411, !1396, !1412, !357}
!1412 = !DILocation(line: 141, column: 35, scope: !1392)
!1413 = !DILocation(line: 143, column: 10, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1392, file: !2, line: 143, column: 10)
!1415 = !DILocation(line: 143, column: 25, scope: !1414)
!1416 = !DILocation(line: 143, column: 10, scope: !1392)
!1417 = !DILocation(line: 144, column: 9, scope: !1414)
!1418 = !DILocation(line: 144, column: 26, scope: !1414)
!1419 = !DILocation(line: 144, column: 8, scope: !1414)
!1420 = !DILocation(line: 146, column: 18, scope: !1414)
!1421 = !DILocation(line: 147, column: 10, scope: !1422)
!1422 = distinct !DILexicalBlock(scope: !1392, file: !2, line: 147, column: 10)
!1423 = !DILocation(line: 147, column: 27, scope: !1422)
!1424 = !DILocation(line: 147, column: 25, scope: !1422)
!1425 = !DILocation(line: 147, column: 10, scope: !1392)
!1426 = !DILocation(line: 148, column: 22, scope: !1422)
!1427 = !DILocation(line: 148, column: 8, scope: !1422)
!1428 = !DILocation(line: 149, column: 4, scope: !1392)
