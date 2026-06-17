; ModuleID = '/Users/felicitasgarcia/MM/coreutils/src/catPUA.c'
source_filename = "/Users/felicitasgarcia/MM/coreutils/src/catPUA.c"
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
  %27 = alloca i8, align 1
  %28 = alloca i64, align 8
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

102:                                              ; preds = %338, %98
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
  br label %338, !dbg !613

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
  br label %325, !dbg !622

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
  br i1 %153, label %208, label %154, !dbg !630

154:                                              ; preds = %146
  %155 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !631
  %156 = load i16, ptr %155, align 4, !dbg !631
  %157 = zext i16 %156 to i32, !dbg !631
  %158 = and i32 %157, 61440, !dbg !631
  %159 = icmp eq i32 %158, 49152, !dbg !631
  br i1 %159, label %208, label %160, !dbg !632

160:                                              ; preds = %154
  %161 = load i8, ptr %20, align 1, !dbg !633
  %162 = trunc i8 %161 to i1, !dbg !633
  br i1 %162, label %163, label %208, !dbg !634

163:                                              ; preds = %160
  %164 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 0, !dbg !635
  %165 = load i32, ptr %164, align 8, !dbg !635
  %166 = load i32, ptr %17, align 4, !dbg !636
  %167 = icmp eq i32 %165, %166, !dbg !637
  br i1 %167, label %168, label %208, !dbg !638

168:                                              ; preds = %163
  %169 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !639
  %170 = load i64, ptr %169, align 8, !dbg !639
  %171 = load i64, ptr %18, align 8, !dbg !640
  %172 = icmp eq i64 %170, %171, !dbg !641
  br i1 %172, label %173, label %208, !dbg !642

173:                                              ; preds = %168
  %174 = load i32, ptr %19, align 4, !dbg !643
  %175 = icmp slt i32 %174, -1, !dbg !646
  br i1 %175, label %176, label %178, !dbg !647

176:                                              ; preds = %173
  %177 = call i32 (i32, i32, ...) @"\01_fcntl"(i32 noundef 1, i32 noundef 3), !dbg !648
  store i32 %177, ptr %19, align 4, !dbg !649
  br label %178, !dbg !650

178:                                              ; preds = %176, %173
  call void @llvm.dbg.declare(metadata ptr %27, metadata !651, metadata !DIExpression()), !dbg !652
  %179 = load i32, ptr %19, align 4, !dbg !653
  %180 = icmp sle i32 0, %179, !dbg !654
  br i1 %180, label %181, label %185, !dbg !655

181:                                              ; preds = %178
  %182 = load i32, ptr %19, align 4, !dbg !656
  %183 = and i32 %182, 8, !dbg !657
  %184 = icmp ne i32 %183, 0, !dbg !655
  br label %185

185:                                              ; preds = %181, %178
  %186 = phi i1 [ false, %178 ], [ %184, %181 ], !dbg !658
  %187 = zext i1 %186 to i8, !dbg !652
  store i8 %187, ptr %27, align 1, !dbg !652
  %188 = load i8, ptr %27, align 1, !dbg !659
  %189 = trunc i8 %188 to i1, !dbg !659
  br i1 %189, label %201, label %190, !dbg !661

190:                                              ; preds = %185
  call void @llvm.dbg.declare(metadata ptr %28, metadata !662, metadata !DIExpression()), !dbg !664
  %191 = load i32, ptr @input_desc, align 4, !dbg !665
  %192 = call i64 @lseek(i32 noundef %191, i64 noundef 0, i32 noundef 1), !dbg !666
  store i64 %192, ptr %28, align 8, !dbg !664
  %193 = load i64, ptr %28, align 8, !dbg !667
  %194 = icmp sle i64 0, %193, !dbg !669
  br i1 %194, label %195, label %200, !dbg !670

195:                                              ; preds = %190
  %196 = load i64, ptr %28, align 8, !dbg !671
  %197 = call i64 @lseek(i32 noundef 1, i64 noundef 0, i32 noundef 1), !dbg !672
  %198 = icmp slt i64 %196, %197, !dbg !673
  %199 = zext i1 %198 to i8, !dbg !674
  store i8 %199, ptr %27, align 1, !dbg !674
  br label %200, !dbg !675

200:                                              ; preds = %195, %190
  br label %201, !dbg !676

201:                                              ; preds = %200, %185
  %202 = load i8, ptr %27, align 1, !dbg !677
  %203 = trunc i8 %202 to i1, !dbg !677
  br i1 %203, label %204, label %207, !dbg !679

204:                                              ; preds = %201
  %205 = load ptr, ptr @infile, align 8, !dbg !680
  %206 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %205), !dbg !680
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef 0, ptr noundef @.str.27, ptr noundef %206) #11, !dbg !680
  store i8 0, ptr %23, align 1, !dbg !682
  br label %325, !dbg !683

207:                                              ; preds = %201
  br label %208, !dbg !684

208:                                              ; preds = %207, %168, %163, %160, %154, %146
  call void @llvm.dbg.declare(metadata ptr %29, metadata !685, metadata !DIExpression()), !dbg !686
  %209 = load i8, ptr %8, align 1, !dbg !687
  %210 = trunc i8 %209 to i1, !dbg !687
  br i1 %210, label %273, label %211, !dbg !689

211:                                              ; preds = %208
  %212 = load i8, ptr %11, align 1, !dbg !690
  %213 = trunc i8 %212 to i1, !dbg !690
  br i1 %213, label %273, label %214, !dbg !691

214:                                              ; preds = %211
  %215 = load i8, ptr %12, align 1, !dbg !692
  %216 = trunc i8 %215 to i1, !dbg !692
  br i1 %216, label %273, label %217, !dbg !693

217:                                              ; preds = %214
  %218 = load i8, ptr %13, align 1, !dbg !694
  %219 = trunc i8 %218 to i1, !dbg !694
  br i1 %219, label %273, label %220, !dbg !695

220:                                              ; preds = %217
  %221 = load i8, ptr %10, align 1, !dbg !696
  %222 = trunc i8 %221 to i1, !dbg !696
  br i1 %222, label %273, label %223, !dbg !697

223:                                              ; preds = %220
  call void @llvm.dbg.declare(metadata ptr %30, metadata !698, metadata !DIExpression()), !dbg !700
  %224 = load i8, ptr %21, align 1, !dbg !701
  %225 = trunc i8 %224 to i1, !dbg !701
  br i1 %225, label %226, label %234, !dbg !702

226:                                              ; preds = %223
  %227 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !703
  %228 = load i16, ptr %227, align 4, !dbg !703
  %229 = zext i16 %228 to i32, !dbg !703
  %230 = and i32 %229, 61440, !dbg !703
  %231 = icmp eq i32 %230, 32768, !dbg !703
  br i1 %231, label %232, label %234, !dbg !701

232:                                              ; preds = %226
  %233 = call i32 @copy_cat(), !dbg !704
  br label %235, !dbg !701

234:                                              ; preds = %226, %223
  br label %235, !dbg !701

235:                                              ; preds = %234, %232
  %236 = phi i32 [ %233, %232 ], [ 0, %234 ], !dbg !701
  store i32 %236, ptr %30, align 4, !dbg !700
  %237 = load i32, ptr %30, align 4, !dbg !705
  %238 = icmp ne i32 %237, 0, !dbg !707
  br i1 %238, label %239, label %249, !dbg !708

239:                                              ; preds = %235
  store ptr null, ptr %29, align 8, !dbg !709
  %240 = load i32, ptr %30, align 4, !dbg !711
  %241 = icmp slt i32 0, %240, !dbg !712
  %242 = zext i1 %241 to i32, !dbg !712
  %243 = load i8, ptr %23, align 1, !dbg !713
  %244 = trunc i8 %243 to i1, !dbg !713
  %245 = zext i1 %244 to i32, !dbg !713
  %246 = and i32 %245, %242, !dbg !713
  %247 = icmp ne i32 %246, 0, !dbg !713
  %248 = zext i1 %247 to i8, !dbg !713
  store i8 %248, ptr %23, align 1, !dbg !713
  br label %272, !dbg !714

249:                                              ; preds = %235
  %250 = load i64, ptr %26, align 8, !dbg !715
  %251 = load i64, ptr %16, align 8, !dbg !715
  %252 = icmp sgt i64 %250, %251, !dbg !715
  br i1 %252, label %253, label %255, !dbg !715

253:                                              ; preds = %249
  %254 = load i64, ptr %26, align 8, !dbg !715
  br label %257, !dbg !715

255:                                              ; preds = %249
  %256 = load i64, ptr %16, align 8, !dbg !715
  br label %257, !dbg !715

257:                                              ; preds = %255, %253
  %258 = phi i64 [ %254, %253 ], [ %256, %255 ], !dbg !715
  store i64 %258, ptr %26, align 8, !dbg !717
  %259 = load i64, ptr %24, align 8, !dbg !718
  %260 = load i64, ptr %26, align 8, !dbg !719
  %261 = call noalias nonnull ptr @xalignalloc(i64 noundef %259, i64 noundef %260) #13, !dbg !720
  store ptr %261, ptr %29, align 8, !dbg !721
  %262 = load ptr, ptr %29, align 8, !dbg !722
  %263 = load i64, ptr %26, align 8, !dbg !723
  %264 = call zeroext i1 @simple_cat(ptr noundef %262, i64 noundef %263), !dbg !724
  %265 = zext i1 %264 to i32, !dbg !724
  %266 = load i8, ptr %23, align 1, !dbg !725
  %267 = trunc i8 %266 to i1, !dbg !725
  %268 = zext i1 %267 to i32, !dbg !725
  %269 = and i32 %268, %265, !dbg !725
  %270 = icmp ne i32 %269, 0, !dbg !725
  %271 = zext i1 %270 to i8, !dbg !725
  store i8 %271, ptr %23, align 1, !dbg !725
  br label %272

272:                                              ; preds = %257, %239
  br label %323, !dbg !726

273:                                              ; preds = %220, %217, %214, %211, %208
  %274 = load i64, ptr %24, align 8, !dbg !727
  %275 = load i64, ptr %26, align 8, !dbg !729
  %276 = add nsw i64 %275, 1, !dbg !730
  %277 = call noalias nonnull ptr @xalignalloc(i64 noundef %274, i64 noundef %276) #13, !dbg !731
  store ptr %277, ptr %29, align 8, !dbg !732
  call void @llvm.dbg.declare(metadata ptr %31, metadata !733, metadata !DIExpression()), !dbg !734
  %278 = load i64, ptr %26, align 8, !dbg !735
  %279 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %278, i64 4), !dbg !735
  %280 = extractvalue { i64, i1 } %279, 1, !dbg !735
  %281 = extractvalue { i64, i1 } %279, 0, !dbg !735
  store i64 %281, ptr %31, align 8, !dbg !735
  br i1 %280, label %293, label %282, !dbg !737

282:                                              ; preds = %273
  %283 = load i64, ptr %31, align 8, !dbg !738
  %284 = load i64, ptr %16, align 8, !dbg !738
  %285 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %283, i64 %284), !dbg !738
  %286 = extractvalue { i64, i1 } %285, 1, !dbg !738
  %287 = extractvalue { i64, i1 } %285, 0, !dbg !738
  store i64 %287, ptr %31, align 8, !dbg !738
  br i1 %286, label %293, label %288, !dbg !739

288:                                              ; preds = %282
  %289 = load i64, ptr %31, align 8, !dbg !740
  %290 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %289, i64 19), !dbg !740
  %291 = extractvalue { i64, i1 } %290, 1, !dbg !740
  %292 = extractvalue { i64, i1 } %290, 0, !dbg !740
  store i64 %292, ptr %31, align 8, !dbg !740
  br i1 %291, label %293, label %294, !dbg !741

293:                                              ; preds = %288, %282, %273
  call void @xalloc_die() #10, !dbg !742
  unreachable, !dbg !742

294:                                              ; preds = %288
  call void @llvm.dbg.declare(metadata ptr %32, metadata !743, metadata !DIExpression()), !dbg !744
  %295 = load i64, ptr %24, align 8, !dbg !745
  %296 = load i64, ptr %31, align 8, !dbg !746
  %297 = call noalias nonnull ptr @xalignalloc(i64 noundef %295, i64 noundef %296) #13, !dbg !747
  store ptr %297, ptr %32, align 8, !dbg !744
  %298 = load ptr, ptr %29, align 8, !dbg !748
  %299 = load i64, ptr %26, align 8, !dbg !749
  %300 = load ptr, ptr %32, align 8, !dbg !750
  %301 = load i64, ptr %16, align 8, !dbg !751
  %302 = load i8, ptr %12, align 1, !dbg !752
  %303 = trunc i8 %302 to i1, !dbg !752
  %304 = load i8, ptr %13, align 1, !dbg !753
  %305 = trunc i8 %304 to i1, !dbg !753
  %306 = load i8, ptr %8, align 1, !dbg !754
  %307 = trunc i8 %306 to i1, !dbg !754
  %308 = load i8, ptr %9, align 1, !dbg !755
  %309 = trunc i8 %308 to i1, !dbg !755
  %310 = load i8, ptr %11, align 1, !dbg !756
  %311 = trunc i8 %310 to i1, !dbg !756
  %312 = load i8, ptr %10, align 1, !dbg !757
  %313 = trunc i8 %312 to i1, !dbg !757
  %314 = call zeroext i1 @cat(ptr noundef %298, i64 noundef %299, ptr noundef %300, i64 noundef %301, i1 noundef zeroext %303, i1 noundef zeroext %305, i1 noundef zeroext %307, i1 noundef zeroext %309, i1 noundef zeroext %311, i1 noundef zeroext %313), !dbg !758
  %315 = zext i1 %314 to i32, !dbg !758
  %316 = load i8, ptr %23, align 1, !dbg !759
  %317 = trunc i8 %316 to i1, !dbg !759
  %318 = zext i1 %317 to i32, !dbg !759
  %319 = and i32 %318, %315, !dbg !759
  %320 = icmp ne i32 %319, 0, !dbg !759
  %321 = zext i1 %320 to i8, !dbg !759
  store i8 %321, ptr %23, align 1, !dbg !759
  %322 = load ptr, ptr %32, align 8, !dbg !760
  call void @alignfree(ptr noundef %322), !dbg !761
  br label %323

323:                                              ; preds = %294, %272
  %324 = load ptr, ptr %29, align 8, !dbg !762
  call void @alignfree(ptr noundef %324), !dbg !763
  br label %325, !dbg !763

325:                                              ; preds = %323, %204, %141
  call void @llvm.dbg.label(metadata !764), !dbg !765
  %326 = load i8, ptr %25, align 1, !dbg !766
  %327 = trunc i8 %326 to i1, !dbg !766
  br i1 %327, label %337, label %328, !dbg !768

328:                                              ; preds = %325
  %329 = load i32, ptr @input_desc, align 4, !dbg !769
  %330 = call i32 @"\01_close"(i32 noundef %329), !dbg !770
  %331 = icmp slt i32 %330, 0, !dbg !771
  br i1 %331, label %332, label %337, !dbg !772

332:                                              ; preds = %328
  %333 = call ptr @__error(), !dbg !773
  %334 = load i32, ptr %333, align 4, !dbg !773
  %335 = load ptr, ptr @infile, align 8, !dbg !773
  %336 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %335), !dbg !773
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %334, ptr noundef @.str.26, ptr noundef %336) #11, !dbg !773
  store i8 0, ptr %23, align 1, !dbg !775
  br label %337, !dbg !776

337:                                              ; preds = %332, %328, %325
  br label %338, !dbg !777

338:                                              ; preds = %337, %131
  %339 = load i32, ptr %22, align 4, !dbg !778
  %340 = add nsw i32 %339, 1, !dbg !778
  store i32 %340, ptr %22, align 4, !dbg !778
  %341 = load i32, ptr %4, align 4, !dbg !779
  %342 = icmp slt i32 %340, %341, !dbg !780
  br i1 %342, label %102, label %343, !dbg !777, !llvm.loop !781

343:                                              ; preds = %338
  %344 = load i8, ptr @pending_cr, align 1, !dbg !783
  %345 = trunc i8 %344 to i1, !dbg !783
  br i1 %345, label %346, label %351, !dbg !785

346:                                              ; preds = %343
  %347 = call i64 @full_write(i32 noundef 1, ptr noundef @.str.28, i64 noundef 1), !dbg !786
  %348 = icmp ne i64 %347, 1, !dbg !789
  br i1 %348, label %349, label %350, !dbg !790

349:                                              ; preds = %346
  call void @write_error(), !dbg !791
  br label %350, !dbg !791

350:                                              ; preds = %349, %346
  br label %351, !dbg !792

351:                                              ; preds = %350, %343
  %352 = load i8, ptr %6, align 1, !dbg !793
  %353 = trunc i8 %352 to i1, !dbg !793
  br i1 %353, label %354, label %360, !dbg !795

354:                                              ; preds = %351
  %355 = call i32 @"\01_close"(i32 noundef 0), !dbg !796
  %356 = icmp slt i32 %355, 0, !dbg !797
  br i1 %356, label %357, label %360, !dbg !798

357:                                              ; preds = %354
  %358 = call ptr @__error(), !dbg !799
  %359 = load i32, ptr %358, align 4, !dbg !799
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %359, ptr noundef @.str.29) #11, !dbg !799
  unreachable, !dbg !799

360:                                              ; preds = %354, %351
  %361 = load i8, ptr %23, align 1, !dbg !800
  %362 = trunc i8 %361 to i1, !dbg !800
  %363 = zext i1 %362 to i64, !dbg !800
  %364 = select i1 %362, i32 0, i32 1, !dbg !800
  ret i32 %364, !dbg !801
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
define internal i64 @io_blksize(ptr noundef %0) #3 !dbg !802 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !807, metadata !DIExpression()), !dbg !808
  call void @llvm.dbg.declare(metadata ptr %3, metadata !809, metadata !DIExpression()), !dbg !810
  %6 = load ptr, ptr %2, align 8, !dbg !811
  %7 = getelementptr inbounds %struct.stat, ptr %6, i32 0, i32 13, !dbg !811
  %8 = load i32, ptr %7, align 8, !dbg !811
  %9 = icmp slt i32 0, %8, !dbg !811
  br i1 %9, label %10, label %20, !dbg !811

10:                                               ; preds = %1
  %11 = load ptr, ptr %2, align 8, !dbg !811
  %12 = getelementptr inbounds %struct.stat, ptr %11, i32 0, i32 13, !dbg !811
  %13 = load i32, ptr %12, align 8, !dbg !811
  %14 = sext i32 %13 to i64, !dbg !811
  %15 = icmp ule i64 %14, 2305843009213693952, !dbg !811
  br i1 %15, label %16, label %20, !dbg !811

16:                                               ; preds = %10
  %17 = load ptr, ptr %2, align 8, !dbg !811
  %18 = getelementptr inbounds %struct.stat, ptr %17, i32 0, i32 13, !dbg !811
  %19 = load i32, ptr %18, align 8, !dbg !811
  br label %21, !dbg !811

20:                                               ; preds = %10, %1
  br label %21, !dbg !811

21:                                               ; preds = %20, %16
  %22 = phi i32 [ %19, %16 ], [ 512, %20 ], !dbg !811
  %23 = icmp sle i32 %22, 0, !dbg !812
  br i1 %23, label %24, label %25, !dbg !811

24:                                               ; preds = %21
  br label %43, !dbg !811

25:                                               ; preds = %21
  %26 = load ptr, ptr %2, align 8, !dbg !813
  %27 = getelementptr inbounds %struct.stat, ptr %26, i32 0, i32 13, !dbg !813
  %28 = load i32, ptr %27, align 8, !dbg !813
  %29 = icmp slt i32 0, %28, !dbg !813
  br i1 %29, label %30, label %40, !dbg !813

30:                                               ; preds = %25
  %31 = load ptr, ptr %2, align 8, !dbg !813
  %32 = getelementptr inbounds %struct.stat, ptr %31, i32 0, i32 13, !dbg !813
  %33 = load i32, ptr %32, align 8, !dbg !813
  %34 = sext i32 %33 to i64, !dbg !813
  %35 = icmp ule i64 %34, 2305843009213693952, !dbg !813
  br i1 %35, label %36, label %40, !dbg !813

36:                                               ; preds = %30
  %37 = load ptr, ptr %2, align 8, !dbg !813
  %38 = getelementptr inbounds %struct.stat, ptr %37, i32 0, i32 13, !dbg !813
  %39 = load i32, ptr %38, align 8, !dbg !813
  br label %41, !dbg !813

40:                                               ; preds = %30, %25
  br label %41, !dbg !813

41:                                               ; preds = %40, %36
  %42 = phi i32 [ %39, %36 ], [ 512, %40 ], !dbg !813
  br label %43, !dbg !811

43:                                               ; preds = %41, %24
  %44 = phi i32 [ 262144, %24 ], [ %42, %41 ], !dbg !811
  %45 = sext i32 %44 to i64, !dbg !811
  store i64 %45, ptr %3, align 8, !dbg !810
  %46 = load i64, ptr %3, align 8, !dbg !814
  %47 = srem i64 262143, %46, !dbg !815
  %48 = sub nsw i64 262143, %47, !dbg !816
  %49 = load i64, ptr %3, align 8, !dbg !817
  %50 = add nsw i64 %49, %48, !dbg !817
  store i64 %50, ptr %3, align 8, !dbg !817
  %51 = load ptr, ptr %2, align 8, !dbg !818
  %52 = getelementptr inbounds %struct.stat, ptr %51, i32 0, i32 1, !dbg !818
  %53 = load i16, ptr %52, align 4, !dbg !818
  %54 = zext i16 %53 to i32, !dbg !818
  %55 = and i32 %54, 61440, !dbg !818
  %56 = icmp eq i32 %55, 32768, !dbg !818
  br i1 %56, label %57, label %75, !dbg !820

57:                                               ; preds = %43
  %58 = load i64, ptr %3, align 8, !dbg !821
  %59 = load i64, ptr %3, align 8, !dbg !822
  %60 = sub nsw i64 %59, 1, !dbg !823
  %61 = and i64 %58, %60, !dbg !824
  %62 = icmp ne i64 %61, 0, !dbg !824
  br i1 %62, label %63, label %75, !dbg !825

63:                                               ; preds = %57
  call void @llvm.dbg.declare(metadata ptr %4, metadata !826, metadata !DIExpression()), !dbg !828
  %64 = load i64, ptr %3, align 8, !dbg !829
  %65 = call i32 @stdc_leading_zeros_ull(i64 noundef %64), !dbg !830
  store i32 %65, ptr %4, align 4, !dbg !828
  call void @llvm.dbg.declare(metadata ptr %5, metadata !831, metadata !DIExpression()), !dbg !834
  %66 = load i32, ptr %4, align 4, !dbg !835
  %67 = sub nsw i32 64, %66, !dbg !836
  %68 = zext i32 %67 to i64, !dbg !837
  %69 = shl i64 1, %68, !dbg !837
  store i64 %69, ptr %5, align 8, !dbg !834
  %70 = load i64, ptr %5, align 8, !dbg !838
  %71 = icmp ule i64 %70, 9223372036854775807, !dbg !840
  br i1 %71, label %72, label %74, !dbg !841

72:                                               ; preds = %63
  %73 = load i64, ptr %5, align 8, !dbg !842
  store i64 %73, ptr %3, align 8, !dbg !843
  br label %74, !dbg !844

74:                                               ; preds = %72, %63
  br label %75, !dbg !845

75:                                               ; preds = %74, %57, %43
  %76 = load i64, ptr %3, align 8, !dbg !846
  %77 = icmp ult i64 4611686018427387904, %76, !dbg !846
  br i1 %77, label %78, label %79, !dbg !846

78:                                               ; preds = %75
  br label %81, !dbg !846

79:                                               ; preds = %75
  %80 = load i64, ptr %3, align 8, !dbg !846
  br label %81, !dbg !846

81:                                               ; preds = %79, %78
  %82 = phi i64 [ 4611686018427387904, %78 ], [ %80, %79 ], !dbg !846
  ret i64 %82, !dbg !847
}

declare void @xset_binary_mode(i32 noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare i32 @getpagesize() #6

declare i32 @strcmp(ptr noundef, ptr noundef) #2

declare i32 @rpl_open(ptr noundef, i32 noundef, ...) #2

declare ptr @quotearg_n_style_colon(i32 noundef, i32 noundef, ptr noundef) #2

declare void @fdadvise(i32 noundef, i64 noundef, i64 noundef, i32 noundef) #2

declare i32 @"\01_fcntl"(i32 noundef, i32 noundef, ...) #2

declare i64 @lseek(i32 noundef, i64 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal i32 @copy_cat() #3 !dbg !848 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  call void @llvm.dbg.declare(metadata ptr %2, metadata !851, metadata !DIExpression()), !dbg !855
  store i64 9223372035781033984, ptr %2, align 8, !dbg !855
  call void @llvm.dbg.declare(metadata ptr %3, metadata !856, metadata !DIExpression()), !dbg !858
  store i8 0, ptr %3, align 1, !dbg !858
  br label %4, !dbg !859

4:                                                ; preds = %47, %0
  %5 = load i32, ptr @input_desc, align 4, !dbg !860
  %6 = load i64, ptr %2, align 8, !dbg !862
  %7 = call i64 @copy_file_range(i32 noundef %5, ptr noundef null, i32 noundef 1, ptr noundef null, i64 noundef %6, i32 noundef 0), !dbg !863
  switch i64 %7, label %46 [
    i64 0, label %8
    i64 -1, label %12
  ], !dbg !864

8:                                                ; preds = %4
  %9 = load i8, ptr %3, align 1, !dbg !865
  %10 = trunc i8 %9 to i1, !dbg !865
  %11 = zext i1 %10 to i32, !dbg !865
  store i32 %11, ptr %1, align 4, !dbg !867
  br label %48, !dbg !867

12:                                               ; preds = %4
  %13 = call ptr @__error(), !dbg !868
  %14 = load i32, ptr %13, align 4, !dbg !868
  %15 = icmp eq i32 %14, 78, !dbg !870
  br i1 %15, label %40, label %16, !dbg !871

16:                                               ; preds = %12
  %17 = call ptr @__error(), !dbg !872
  %18 = load i32, ptr %17, align 4, !dbg !872
  %19 = call zeroext i1 @is_ENOTSUP(i32 noundef %18), !dbg !873
  br i1 %19, label %40, label %20, !dbg !874

20:                                               ; preds = %16
  %21 = call ptr @__error(), !dbg !875
  %22 = load i32, ptr %21, align 4, !dbg !875
  %23 = icmp eq i32 %22, 22, !dbg !876
  br i1 %23, label %40, label %24, !dbg !877

24:                                               ; preds = %20
  %25 = call ptr @__error(), !dbg !878
  %26 = load i32, ptr %25, align 4, !dbg !878
  %27 = icmp eq i32 %26, 9, !dbg !879
  br i1 %27, label %40, label %28, !dbg !880

28:                                               ; preds = %24
  %29 = call ptr @__error(), !dbg !881
  %30 = load i32, ptr %29, align 4, !dbg !881
  %31 = icmp eq i32 %30, 18, !dbg !882
  br i1 %31, label %40, label %32, !dbg !883

32:                                               ; preds = %28
  %33 = call ptr @__error(), !dbg !884
  %34 = load i32, ptr %33, align 4, !dbg !884
  %35 = icmp eq i32 %34, 26, !dbg !885
  br i1 %35, label %40, label %36, !dbg !886

36:                                               ; preds = %32
  %37 = call ptr @__error(), !dbg !887
  %38 = load i32, ptr %37, align 4, !dbg !887
  %39 = icmp eq i32 %38, 1, !dbg !888
  br i1 %39, label %40, label %41, !dbg !889

40:                                               ; preds = %36, %32, %28, %24, %20, %16, %12
  store i32 0, ptr %1, align 4, !dbg !890
  br label %48, !dbg !890

41:                                               ; preds = %36
  %42 = call ptr @__error(), !dbg !891
  %43 = load i32, ptr %42, align 4, !dbg !891
  %44 = load ptr, ptr @infile, align 8, !dbg !891
  %45 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %44), !dbg !891
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %43, ptr noundef @.str.26, ptr noundef %45) #11, !dbg !891
  store i32 -1, ptr %1, align 4, !dbg !892
  br label %48, !dbg !892

46:                                               ; preds = %4
  br label %47, !dbg !893

47:                                               ; preds = %46
  store i8 1, ptr %3, align 1, !dbg !894
  br label %4, !dbg !895, !llvm.loop !896

48:                                               ; preds = %41, %40, %8
  %49 = load i32, ptr %1, align 4, !dbg !899
  ret i32 %49, !dbg !899
}

; Function Attrs: allocsize(1)
declare noalias nonnull ptr @xalignalloc(i64 noundef, i64 noundef) #7

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal zeroext i1 @simple_cat(ptr noundef %0, i64 noundef %1) #3 !dbg !900 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !903, metadata !DIExpression()), !dbg !904
  store i64 %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !905, metadata !DIExpression()), !dbg !906
  br label %7, !dbg !907

7:                                                ; preds = %2, %30
  call void @llvm.dbg.declare(metadata ptr %6, metadata !908, metadata !DIExpression()), !dbg !910
  %8 = load i32, ptr @input_desc, align 4, !dbg !911
  %9 = load ptr, ptr %4, align 8, !dbg !912
  %10 = load i64, ptr %5, align 8, !dbg !913
  %11 = call i64 @safe_read(i32 noundef %8, ptr noundef %9, i64 noundef %10), !dbg !914
  store i64 %11, ptr %6, align 8, !dbg !910
  %12 = load i64, ptr %6, align 8, !dbg !915
  %13 = icmp slt i64 %12, 0, !dbg !917
  br i1 %13, label %14, label %19, !dbg !918

14:                                               ; preds = %7
  %15 = call ptr @__error(), !dbg !919
  %16 = load i32, ptr %15, align 4, !dbg !919
  %17 = load ptr, ptr @infile, align 8, !dbg !919
  %18 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %17), !dbg !919
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %16, ptr noundef @.str.26, ptr noundef %18) #11, !dbg !919
  store i1 false, ptr %3, align 1, !dbg !921
  br label %31, !dbg !921

19:                                               ; preds = %7
  %20 = load i64, ptr %6, align 8, !dbg !922
  %21 = icmp eq i64 %20, 0, !dbg !924
  br i1 %21, label %22, label %23, !dbg !925

22:                                               ; preds = %19
  store i1 true, ptr %3, align 1, !dbg !926
  br label %31, !dbg !926

23:                                               ; preds = %19
  %24 = load ptr, ptr %4, align 8, !dbg !927
  %25 = load i64, ptr %6, align 8, !dbg !929
  %26 = call i64 @full_write(i32 noundef 1, ptr noundef %24, i64 noundef %25), !dbg !930
  %27 = load i64, ptr %6, align 8, !dbg !931
  %28 = icmp ne i64 %26, %27, !dbg !932
  br i1 %28, label %29, label %30, !dbg !933

29:                                               ; preds = %23
  call void @write_error(), !dbg !934
  br label %30, !dbg !934

30:                                               ; preds = %29, %23
  br label %7, !dbg !907, !llvm.loop !935

31:                                               ; preds = %22, %14
  %32 = load i1, ptr %3, align 1, !dbg !937
  ret i1 %32, !dbg !937
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: noreturn
declare void @xalloc_die() #4

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal zeroext i1 @cat(ptr noundef %0, i64 noundef %1, ptr noundef %2, i64 noundef %3, i1 noundef zeroext %4, i1 noundef zeroext %5, i1 noundef zeroext %6, i1 noundef zeroext %7, i1 noundef zeroext %8, i1 noundef zeroext %9) #3 !dbg !938 {
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
  call void @llvm.dbg.declare(metadata ptr %12, metadata !941, metadata !DIExpression()), !dbg !942
  store i64 %1, ptr %13, align 8
  call void @llvm.dbg.declare(metadata ptr %13, metadata !943, metadata !DIExpression()), !dbg !944
  store ptr %2, ptr %14, align 8
  call void @llvm.dbg.declare(metadata ptr %14, metadata !945, metadata !DIExpression()), !dbg !946
  store i64 %3, ptr %15, align 8
  call void @llvm.dbg.declare(metadata ptr %15, metadata !947, metadata !DIExpression()), !dbg !948
  %33 = zext i1 %4 to i8
  store i8 %33, ptr %16, align 1
  call void @llvm.dbg.declare(metadata ptr %16, metadata !949, metadata !DIExpression()), !dbg !950
  %34 = zext i1 %5 to i8
  store i8 %34, ptr %17, align 1
  call void @llvm.dbg.declare(metadata ptr %17, metadata !951, metadata !DIExpression()), !dbg !952
  %35 = zext i1 %6 to i8
  store i8 %35, ptr %18, align 1
  call void @llvm.dbg.declare(metadata ptr %18, metadata !953, metadata !DIExpression()), !dbg !954
  %36 = zext i1 %7 to i8
  store i8 %36, ptr %19, align 1
  call void @llvm.dbg.declare(metadata ptr %19, metadata !955, metadata !DIExpression()), !dbg !956
  %37 = zext i1 %8 to i8
  store i8 %37, ptr %20, align 1
  call void @llvm.dbg.declare(metadata ptr %20, metadata !957, metadata !DIExpression()), !dbg !958
  %38 = zext i1 %9 to i8
  store i8 %38, ptr %21, align 1
  call void @llvm.dbg.declare(metadata ptr %21, metadata !959, metadata !DIExpression()), !dbg !960
  call void @llvm.dbg.declare(metadata ptr %22, metadata !961, metadata !DIExpression()), !dbg !963
  call void @llvm.dbg.declare(metadata ptr %23, metadata !964, metadata !DIExpression()), !dbg !965
  %39 = load i32, ptr @newlines2, align 4, !dbg !966
  store i32 %39, ptr %23, align 4, !dbg !965
  call void @llvm.dbg.declare(metadata ptr %24, metadata !967, metadata !DIExpression()), !dbg !968
  store i8 1, ptr %24, align 1, !dbg !968
  call void @llvm.dbg.declare(metadata ptr %25, metadata !969, metadata !DIExpression()), !dbg !970
  %40 = load ptr, ptr %12, align 8, !dbg !971
  store ptr %40, ptr %25, align 8, !dbg !970
  call void @llvm.dbg.declare(metadata ptr %26, metadata !972, metadata !DIExpression()), !dbg !973
  %41 = load ptr, ptr %25, align 8, !dbg !974
  %42 = getelementptr inbounds i8, ptr %41, i64 1, !dbg !975
  store ptr %42, ptr %26, align 8, !dbg !973
  call void @llvm.dbg.declare(metadata ptr %27, metadata !976, metadata !DIExpression()), !dbg !977
  %43 = load ptr, ptr %14, align 8, !dbg !978
  store ptr %43, ptr %27, align 8, !dbg !977
  br label %44, !dbg !979

44:                                               ; preds = %10, %378
  br label %45, !dbg !980

45:                                               ; preds = %206, %44
  %46 = load ptr, ptr %14, align 8, !dbg !982
  %47 = load i64, ptr %15, align 8, !dbg !985
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !986
  %49 = load ptr, ptr %27, align 8, !dbg !987
  %50 = icmp ule ptr %48, %49, !dbg !988
  br i1 %50, label %51, label %83, !dbg !989

51:                                               ; preds = %45
  call void @llvm.dbg.declare(metadata ptr %28, metadata !990, metadata !DIExpression()), !dbg !992
  %52 = load ptr, ptr %14, align 8, !dbg !993
  store ptr %52, ptr %28, align 8, !dbg !992
  call void @llvm.dbg.declare(metadata ptr %29, metadata !994, metadata !DIExpression()), !dbg !995
  br label %53, !dbg !996

53:                                               ; preds = %69, %51
  %54 = load ptr, ptr %28, align 8, !dbg !997
  %55 = load i64, ptr %15, align 8, !dbg !1000
  %56 = call i64 @full_write(i32 noundef 1, ptr noundef %54, i64 noundef %55), !dbg !1001
  %57 = load i64, ptr %15, align 8, !dbg !1002
  %58 = icmp ne i64 %56, %57, !dbg !1003
  br i1 %58, label %59, label %60, !dbg !1004

59:                                               ; preds = %53
  call void @write_error(), !dbg !1005
  br label %60, !dbg !1005

60:                                               ; preds = %59, %53
  %61 = load i64, ptr %15, align 8, !dbg !1006
  %62 = load ptr, ptr %28, align 8, !dbg !1007
  %63 = getelementptr inbounds i8, ptr %62, i64 %61, !dbg !1007
  store ptr %63, ptr %28, align 8, !dbg !1007
  %64 = load ptr, ptr %27, align 8, !dbg !1008
  %65 = load ptr, ptr %28, align 8, !dbg !1009
  %66 = ptrtoint ptr %64 to i64, !dbg !1010
  %67 = ptrtoint ptr %65 to i64, !dbg !1010
  %68 = sub i64 %66, %67, !dbg !1010
  store i64 %68, ptr %29, align 8, !dbg !1011
  br label %69, !dbg !1012

69:                                               ; preds = %60
  %70 = load i64, ptr %15, align 8, !dbg !1013
  %71 = load i64, ptr %29, align 8, !dbg !1014
  %72 = icmp sle i64 %70, %71, !dbg !1015
  br i1 %72, label %53, label %73, !dbg !1012, !llvm.loop !1016

73:                                               ; preds = %69
  %74 = load ptr, ptr %14, align 8, !dbg !1018
  %75 = load ptr, ptr %28, align 8, !dbg !1018
  %76 = load i64, ptr %29, align 8, !dbg !1018
  %77 = load ptr, ptr %14, align 8, !dbg !1018
  %78 = call i64 @llvm.objectsize.i64.p0(ptr %77, i1 false, i1 true, i1 false), !dbg !1018
  %79 = call ptr @__memmove_chk(ptr noundef %74, ptr noundef %75, i64 noundef %76, i64 noundef %78) #14, !dbg !1018
  %80 = load ptr, ptr %14, align 8, !dbg !1019
  %81 = load i64, ptr %29, align 8, !dbg !1020
  %82 = getelementptr inbounds i8, ptr %80, i64 %81, !dbg !1021
  store ptr %82, ptr %27, align 8, !dbg !1022
  br label %83, !dbg !1023

83:                                               ; preds = %73, %45
  %84 = load ptr, ptr %26, align 8, !dbg !1024
  %85 = load ptr, ptr %25, align 8, !dbg !1026
  %86 = icmp ugt ptr %84, %85, !dbg !1027
  br i1 %86, label %87, label %157, !dbg !1028

87:                                               ; preds = %83
  call void @llvm.dbg.declare(metadata ptr %30, metadata !1029, metadata !DIExpression()), !dbg !1031
  store i8 0, ptr %30, align 1, !dbg !1031
  call void @llvm.dbg.declare(metadata ptr %31, metadata !1032, metadata !DIExpression()), !dbg !1033
  store i32 0, ptr %31, align 4, !dbg !1033
  %88 = load i8, ptr %24, align 1, !dbg !1034
  %89 = trunc i8 %88 to i1, !dbg !1034
  br i1 %89, label %90, label %122, !dbg !1036

90:                                               ; preds = %87
  %91 = load i32, ptr @input_desc, align 4, !dbg !1037
  %92 = call i32 (i32, i64, ...) @ioctl(i32 noundef %91, i64 noundef 1074030207, ptr noundef %31), !dbg !1038
  %93 = icmp slt i32 %92, 0, !dbg !1039
  br i1 %93, label %94, label %122, !dbg !1040

94:                                               ; preds = %90
  %95 = call ptr @__error(), !dbg !1041
  %96 = load i32, ptr %95, align 4, !dbg !1041
  %97 = icmp eq i32 %96, 102, !dbg !1044
  br i1 %97, label %114, label %98, !dbg !1045

98:                                               ; preds = %94
  %99 = call ptr @__error(), !dbg !1046
  %100 = load i32, ptr %99, align 4, !dbg !1046
  %101 = icmp eq i32 %100, 25, !dbg !1047
  br i1 %101, label %114, label %102, !dbg !1048

102:                                              ; preds = %98
  %103 = call ptr @__error(), !dbg !1049
  %104 = load i32, ptr %103, align 4, !dbg !1049
  %105 = icmp eq i32 %104, 22, !dbg !1050
  br i1 %105, label %114, label %106, !dbg !1051

106:                                              ; preds = %102
  %107 = call ptr @__error(), !dbg !1052
  %108 = load i32, ptr %107, align 4, !dbg !1052
  %109 = icmp eq i32 %108, 19, !dbg !1053
  br i1 %109, label %114, label %110, !dbg !1054

110:                                              ; preds = %106
  %111 = call ptr @__error(), !dbg !1055
  %112 = load i32, ptr %111, align 4, !dbg !1055
  %113 = icmp eq i32 %112, 78, !dbg !1056
  br i1 %113, label %114, label %115, !dbg !1057

114:                                              ; preds = %110, %106, %102, %98, %94
  store i8 0, ptr %24, align 1, !dbg !1058
  br label %121, !dbg !1059

115:                                              ; preds = %110
  %116 = call ptr @__error(), !dbg !1060
  %117 = load i32, ptr %116, align 4, !dbg !1060
  %118 = load ptr, ptr @infile, align 8, !dbg !1060
  %119 = call ptr @quotearg_style(i32 noundef 4, ptr noundef %118), !dbg !1060
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %117, ptr noundef @.str.47, ptr noundef %119) #11, !dbg !1060
  %120 = load i32, ptr %23, align 4, !dbg !1062
  store i32 %120, ptr @newlines2, align 4, !dbg !1063
  store i1 false, ptr %11, align 1, !dbg !1064
  br label %379, !dbg !1064

121:                                              ; preds = %114
  br label %122, !dbg !1065

122:                                              ; preds = %121, %90, %87
  %123 = load i32, ptr %31, align 4, !dbg !1066
  %124 = icmp ne i32 %123, 0, !dbg !1068
  br i1 %124, label %125, label %126, !dbg !1069

125:                                              ; preds = %122
  store i8 1, ptr %30, align 1, !dbg !1070
  br label %126, !dbg !1071

126:                                              ; preds = %125, %122
  %127 = load i8, ptr %30, align 1, !dbg !1072
  %128 = trunc i8 %127 to i1, !dbg !1072
  br i1 %128, label %131, label %129, !dbg !1074

129:                                              ; preds = %126
  %130 = load ptr, ptr %14, align 8, !dbg !1075
  call void @write_pending(ptr noundef %130, ptr noundef %27), !dbg !1076
  br label %131, !dbg !1076

131:                                              ; preds = %129, %126
  call void @llvm.dbg.declare(metadata ptr %32, metadata !1077, metadata !DIExpression()), !dbg !1078
  %132 = load i32, ptr @input_desc, align 4, !dbg !1079
  %133 = load ptr, ptr %12, align 8, !dbg !1080
  %134 = load i64, ptr %13, align 8, !dbg !1081
  %135 = call i64 @safe_read(i32 noundef %132, ptr noundef %133, i64 noundef %134), !dbg !1082
  store i64 %135, ptr %32, align 8, !dbg !1078
  %136 = load i64, ptr %32, align 8, !dbg !1083
  %137 = icmp slt i64 %136, 0, !dbg !1085
  br i1 %137, label %138, label %145, !dbg !1086

138:                                              ; preds = %131
  %139 = call ptr @__error(), !dbg !1087
  %140 = load i32, ptr %139, align 4, !dbg !1087
  %141 = load ptr, ptr @infile, align 8, !dbg !1087
  %142 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %141), !dbg !1087
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %140, ptr noundef @.str.26, ptr noundef %142) #11, !dbg !1087
  %143 = load ptr, ptr %14, align 8, !dbg !1089
  call void @write_pending(ptr noundef %143, ptr noundef %27), !dbg !1090
  %144 = load i32, ptr %23, align 4, !dbg !1091
  store i32 %144, ptr @newlines2, align 4, !dbg !1092
  store i1 false, ptr %11, align 1, !dbg !1093
  br label %379, !dbg !1093

145:                                              ; preds = %131
  %146 = load i64, ptr %32, align 8, !dbg !1094
  %147 = icmp eq i64 %146, 0, !dbg !1096
  br i1 %147, label %148, label %151, !dbg !1097

148:                                              ; preds = %145
  %149 = load ptr, ptr %14, align 8, !dbg !1098
  call void @write_pending(ptr noundef %149, ptr noundef %27), !dbg !1100
  %150 = load i32, ptr %23, align 4, !dbg !1101
  store i32 %150, ptr @newlines2, align 4, !dbg !1102
  store i1 true, ptr %11, align 1, !dbg !1103
  br label %379, !dbg !1103

151:                                              ; preds = %145
  %152 = load ptr, ptr %12, align 8, !dbg !1104
  store ptr %152, ptr %26, align 8, !dbg !1105
  %153 = load ptr, ptr %26, align 8, !dbg !1106
  %154 = load i64, ptr %32, align 8, !dbg !1107
  %155 = getelementptr inbounds i8, ptr %153, i64 %154, !dbg !1108
  store ptr %155, ptr %25, align 8, !dbg !1109
  %156 = load ptr, ptr %25, align 8, !dbg !1110
  store i8 10, ptr %156, align 1, !dbg !1111
  br label %202, !dbg !1112

157:                                              ; preds = %83
  %158 = load i32, ptr %23, align 4, !dbg !1113
  %159 = add nsw i32 %158, 1, !dbg !1113
  store i32 %159, ptr %23, align 4, !dbg !1113
  %160 = icmp sgt i32 %159, 0, !dbg !1116
  br i1 %160, label %161, label %185, !dbg !1117

161:                                              ; preds = %157
  %162 = load i32, ptr %23, align 4, !dbg !1118
  %163 = icmp sge i32 %162, 2, !dbg !1121
  br i1 %163, label %164, label %172, !dbg !1122

164:                                              ; preds = %161
  store i32 2, ptr %23, align 4, !dbg !1123
  %165 = load i8, ptr %21, align 1, !dbg !1125
  %166 = trunc i8 %165 to i1, !dbg !1125
  br i1 %166, label %167, label %171, !dbg !1127

167:                                              ; preds = %164
  %168 = load ptr, ptr %26, align 8, !dbg !1128
  %169 = getelementptr inbounds i8, ptr %168, i32 1, !dbg !1128
  store ptr %169, ptr %26, align 8, !dbg !1128
  %170 = load i8, ptr %168, align 1, !dbg !1130
  store i8 %170, ptr %22, align 1, !dbg !1131
  br label %206, !dbg !1132

171:                                              ; preds = %164
  br label %172, !dbg !1133

172:                                              ; preds = %171, %161
  %173 = load i8, ptr %18, align 1, !dbg !1134
  %174 = trunc i8 %173 to i1, !dbg !1134
  br i1 %174, label %175, label %184, !dbg !1136

175:                                              ; preds = %172
  %176 = load i8, ptr %19, align 1, !dbg !1137
  %177 = trunc i8 %176 to i1, !dbg !1137
  br i1 %177, label %184, label %178, !dbg !1138

178:                                              ; preds = %175
  call void @next_line_num(), !dbg !1139
  %179 = load ptr, ptr %27, align 8, !dbg !1141
  %180 = load ptr, ptr @line_num_print, align 8, !dbg !1141
  %181 = load ptr, ptr %27, align 8, !dbg !1141
  %182 = call i64 @llvm.objectsize.i64.p0(ptr %181, i1 false, i1 true, i1 false), !dbg !1141
  %183 = call ptr @__stpcpy_chk(ptr noundef %179, ptr noundef %180, i64 noundef %182) #14, !dbg !1141
  store ptr %183, ptr %27, align 8, !dbg !1142
  br label %184, !dbg !1143

184:                                              ; preds = %178, %175, %172
  br label %185, !dbg !1144

185:                                              ; preds = %184, %157
  %186 = load i8, ptr %20, align 1, !dbg !1145
  %187 = trunc i8 %186 to i1, !dbg !1145
  br i1 %187, label %188, label %199, !dbg !1147

188:                                              ; preds = %185
  %189 = load i8, ptr @pending_cr, align 1, !dbg !1148
  %190 = trunc i8 %189 to i1, !dbg !1148
  br i1 %190, label %191, label %196, !dbg !1151

191:                                              ; preds = %188
  %192 = load ptr, ptr %27, align 8, !dbg !1152
  %193 = getelementptr inbounds i8, ptr %192, i32 1, !dbg !1152
  store ptr %193, ptr %27, align 8, !dbg !1152
  store i8 94, ptr %192, align 1, !dbg !1154
  %194 = load ptr, ptr %27, align 8, !dbg !1155
  %195 = getelementptr inbounds i8, ptr %194, i32 1, !dbg !1155
  store ptr %195, ptr %27, align 8, !dbg !1155
  store i8 77, ptr %194, align 1, !dbg !1156
  store i8 0, ptr @pending_cr, align 1, !dbg !1157
  br label %196, !dbg !1158

196:                                              ; preds = %191, %188
  %197 = load ptr, ptr %27, align 8, !dbg !1159
  %198 = getelementptr inbounds i8, ptr %197, i32 1, !dbg !1159
  store ptr %198, ptr %27, align 8, !dbg !1159
  store i8 36, ptr %197, align 1, !dbg !1160
  br label %199, !dbg !1161

199:                                              ; preds = %196, %185
  %200 = load ptr, ptr %27, align 8, !dbg !1162
  %201 = getelementptr inbounds i8, ptr %200, i32 1, !dbg !1162
  store ptr %201, ptr %27, align 8, !dbg !1162
  store i8 10, ptr %200, align 1, !dbg !1163
  br label %202

202:                                              ; preds = %199, %151
  %203 = load ptr, ptr %26, align 8, !dbg !1164
  %204 = getelementptr inbounds i8, ptr %203, i32 1, !dbg !1164
  store ptr %204, ptr %26, align 8, !dbg !1164
  %205 = load i8, ptr %203, align 1, !dbg !1165
  store i8 %205, ptr %22, align 1, !dbg !1166
  br label %206, !dbg !1167

206:                                              ; preds = %202, %167
  %207 = load i8, ptr %22, align 1, !dbg !1168
  %208 = zext i8 %207 to i32, !dbg !1168
  %209 = icmp eq i32 %208, 10, !dbg !1169
  br i1 %209, label %45, label %210, !dbg !1167, !llvm.loop !1170

210:                                              ; preds = %206
  %211 = load i8, ptr @pending_cr, align 1, !dbg !1172
  %212 = trunc i8 %211 to i1, !dbg !1172
  br i1 %212, label %213, label %216, !dbg !1174

213:                                              ; preds = %210
  %214 = load ptr, ptr %27, align 8, !dbg !1175
  %215 = getelementptr inbounds i8, ptr %214, i32 1, !dbg !1175
  store ptr %215, ptr %27, align 8, !dbg !1175
  store i8 13, ptr %214, align 1, !dbg !1177
  store i8 0, ptr @pending_cr, align 1, !dbg !1178
  br label %216, !dbg !1179

216:                                              ; preds = %213, %210
  %217 = load i32, ptr %23, align 4, !dbg !1180
  %218 = icmp sge i32 %217, 0, !dbg !1182
  br i1 %218, label %219, label %228, !dbg !1183

219:                                              ; preds = %216
  %220 = load i8, ptr %18, align 1, !dbg !1184
  %221 = trunc i8 %220 to i1, !dbg !1184
  br i1 %221, label %222, label %228, !dbg !1185

222:                                              ; preds = %219
  call void @next_line_num(), !dbg !1186
  %223 = load ptr, ptr %27, align 8, !dbg !1188
  %224 = load ptr, ptr @line_num_print, align 8, !dbg !1188
  %225 = load ptr, ptr %27, align 8, !dbg !1188
  %226 = call i64 @llvm.objectsize.i64.p0(ptr %225, i1 false, i1 true, i1 false), !dbg !1188
  %227 = call ptr @__stpcpy_chk(ptr noundef %223, ptr noundef %224, i64 noundef %226) #14, !dbg !1188
  store ptr %227, ptr %27, align 8, !dbg !1189
  br label %228, !dbg !1190

228:                                              ; preds = %222, %219, %216
  %229 = load i8, ptr %16, align 1, !dbg !1191
  %230 = trunc i8 %229 to i1, !dbg !1191
  br i1 %230, label %231, label %322, !dbg !1193

231:                                              ; preds = %228
  br label %232, !dbg !1194

232:                                              ; preds = %231, %317
  %233 = load i8, ptr %22, align 1, !dbg !1196
  %234 = zext i8 %233 to i32, !dbg !1196
  %235 = icmp sge i32 %234, 32, !dbg !1199
  br i1 %235, label %236, label %291, !dbg !1200

236:                                              ; preds = %232
  %237 = load i8, ptr %22, align 1, !dbg !1201
  %238 = zext i8 %237 to i32, !dbg !1201
  %239 = icmp slt i32 %238, 127, !dbg !1204
  br i1 %239, label %240, label %244, !dbg !1205

240:                                              ; preds = %236
  %241 = load i8, ptr %22, align 1, !dbg !1206
  %242 = load ptr, ptr %27, align 8, !dbg !1207
  %243 = getelementptr inbounds i8, ptr %242, i32 1, !dbg !1207
  store ptr %243, ptr %27, align 8, !dbg !1207
  store i8 %241, ptr %242, align 1, !dbg !1208
  br label %290, !dbg !1209

244:                                              ; preds = %236
  %245 = load i8, ptr %22, align 1, !dbg !1210
  %246 = zext i8 %245 to i32, !dbg !1210
  %247 = icmp eq i32 %246, 127, !dbg !1212
  br i1 %247, label %248, label %253, !dbg !1213

248:                                              ; preds = %244
  %249 = load ptr, ptr %27, align 8, !dbg !1214
  %250 = getelementptr inbounds i8, ptr %249, i32 1, !dbg !1214
  store ptr %250, ptr %27, align 8, !dbg !1214
  store i8 94, ptr %249, align 1, !dbg !1216
  %251 = load ptr, ptr %27, align 8, !dbg !1217
  %252 = getelementptr inbounds i8, ptr %251, i32 1, !dbg !1217
  store ptr %252, ptr %27, align 8, !dbg !1217
  store i8 63, ptr %251, align 1, !dbg !1218
  br label %289, !dbg !1219

253:                                              ; preds = %244
  %254 = load ptr, ptr %27, align 8, !dbg !1220
  %255 = getelementptr inbounds i8, ptr %254, i32 1, !dbg !1220
  store ptr %255, ptr %27, align 8, !dbg !1220
  store i8 77, ptr %254, align 1, !dbg !1222
  %256 = load ptr, ptr %27, align 8, !dbg !1223
  %257 = getelementptr inbounds i8, ptr %256, i32 1, !dbg !1223
  store ptr %257, ptr %27, align 8, !dbg !1223
  store i8 45, ptr %256, align 1, !dbg !1224
  %258 = load i8, ptr %22, align 1, !dbg !1225
  %259 = zext i8 %258 to i32, !dbg !1225
  %260 = icmp sge i32 %259, 160, !dbg !1227
  br i1 %260, label %261, label %278, !dbg !1228

261:                                              ; preds = %253
  %262 = load i8, ptr %22, align 1, !dbg !1229
  %263 = zext i8 %262 to i32, !dbg !1229
  %264 = icmp slt i32 %263, 255, !dbg !1232
  br i1 %264, label %265, label %272, !dbg !1233

265:                                              ; preds = %261
  %266 = load i8, ptr %22, align 1, !dbg !1234
  %267 = zext i8 %266 to i32, !dbg !1234
  %268 = sub nsw i32 %267, 128, !dbg !1235
  %269 = trunc i32 %268 to i8, !dbg !1234
  %270 = load ptr, ptr %27, align 8, !dbg !1236
  %271 = getelementptr inbounds i8, ptr %270, i32 1, !dbg !1236
  store ptr %271, ptr %27, align 8, !dbg !1236
  store i8 %269, ptr %270, align 1, !dbg !1237
  br label %277, !dbg !1238

272:                                              ; preds = %261
  %273 = load ptr, ptr %27, align 8, !dbg !1239
  %274 = getelementptr inbounds i8, ptr %273, i32 1, !dbg !1239
  store ptr %274, ptr %27, align 8, !dbg !1239
  store i8 94, ptr %273, align 1, !dbg !1241
  %275 = load ptr, ptr %27, align 8, !dbg !1242
  %276 = getelementptr inbounds i8, ptr %275, i32 1, !dbg !1242
  store ptr %276, ptr %27, align 8, !dbg !1242
  store i8 63, ptr %275, align 1, !dbg !1243
  br label %277

277:                                              ; preds = %272, %265
  br label %288, !dbg !1244

278:                                              ; preds = %253
  %279 = load ptr, ptr %27, align 8, !dbg !1245
  %280 = getelementptr inbounds i8, ptr %279, i32 1, !dbg !1245
  store ptr %280, ptr %27, align 8, !dbg !1245
  store i8 94, ptr %279, align 1, !dbg !1247
  %281 = load i8, ptr %22, align 1, !dbg !1248
  %282 = zext i8 %281 to i32, !dbg !1248
  %283 = sub nsw i32 %282, 128, !dbg !1249
  %284 = add nsw i32 %283, 64, !dbg !1250
  %285 = trunc i32 %284 to i8, !dbg !1248
  %286 = load ptr, ptr %27, align 8, !dbg !1251
  %287 = getelementptr inbounds i8, ptr %286, i32 1, !dbg !1251
  store ptr %287, ptr %27, align 8, !dbg !1251
  store i8 %285, ptr %286, align 1, !dbg !1252
  br label %288

288:                                              ; preds = %278, %277
  br label %289

289:                                              ; preds = %288, %248
  br label %290

290:                                              ; preds = %289, %240
  br label %317, !dbg !1253

291:                                              ; preds = %232
  %292 = load i8, ptr %22, align 1, !dbg !1254
  %293 = zext i8 %292 to i32, !dbg !1254
  %294 = icmp eq i32 %293, 9, !dbg !1256
  br i1 %294, label %295, label %301, !dbg !1257

295:                                              ; preds = %291
  %296 = load i8, ptr %17, align 1, !dbg !1258
  %297 = trunc i8 %296 to i1, !dbg !1258
  br i1 %297, label %301, label %298, !dbg !1259

298:                                              ; preds = %295
  %299 = load ptr, ptr %27, align 8, !dbg !1260
  %300 = getelementptr inbounds i8, ptr %299, i32 1, !dbg !1260
  store ptr %300, ptr %27, align 8, !dbg !1260
  store i8 9, ptr %299, align 1, !dbg !1261
  br label %316, !dbg !1262

301:                                              ; preds = %295, %291
  %302 = load i8, ptr %22, align 1, !dbg !1263
  %303 = zext i8 %302 to i32, !dbg !1263
  %304 = icmp eq i32 %303, 10, !dbg !1265
  br i1 %304, label %305, label %306, !dbg !1266

305:                                              ; preds = %301
  store i32 -1, ptr %23, align 4, !dbg !1267
  br label %321, !dbg !1269

306:                                              ; preds = %301
  %307 = load ptr, ptr %27, align 8, !dbg !1270
  %308 = getelementptr inbounds i8, ptr %307, i32 1, !dbg !1270
  store ptr %308, ptr %27, align 8, !dbg !1270
  store i8 94, ptr %307, align 1, !dbg !1272
  %309 = load i8, ptr %22, align 1, !dbg !1273
  %310 = zext i8 %309 to i32, !dbg !1273
  %311 = add nsw i32 %310, 64, !dbg !1274
  %312 = trunc i32 %311 to i8, !dbg !1273
  %313 = load ptr, ptr %27, align 8, !dbg !1275
  %314 = getelementptr inbounds i8, ptr %313, i32 1, !dbg !1275
  store ptr %314, ptr %27, align 8, !dbg !1275
  store i8 %312, ptr %313, align 1, !dbg !1276
  br label %315

315:                                              ; preds = %306
  br label %316

316:                                              ; preds = %315, %298
  br label %317

317:                                              ; preds = %316, %290
  %318 = load ptr, ptr %26, align 8, !dbg !1277
  %319 = getelementptr inbounds i8, ptr %318, i32 1, !dbg !1277
  store ptr %319, ptr %26, align 8, !dbg !1277
  %320 = load i8, ptr %318, align 1, !dbg !1278
  store i8 %320, ptr %22, align 1, !dbg !1279
  br label %232, !dbg !1194, !llvm.loop !1280

321:                                              ; preds = %305
  br label %378, !dbg !1282

322:                                              ; preds = %228
  br label %323, !dbg !1283

323:                                              ; preds = %322, %373
  %324 = load i8, ptr %22, align 1, !dbg !1285
  %325 = zext i8 %324 to i32, !dbg !1285
  %326 = icmp eq i32 %325, 9, !dbg !1288
  br i1 %326, label %327, label %339, !dbg !1289

327:                                              ; preds = %323
  %328 = load i8, ptr %17, align 1, !dbg !1290
  %329 = trunc i8 %328 to i1, !dbg !1290
  br i1 %329, label %330, label %339, !dbg !1291

330:                                              ; preds = %327
  %331 = load ptr, ptr %27, align 8, !dbg !1292
  %332 = getelementptr inbounds i8, ptr %331, i32 1, !dbg !1292
  store ptr %332, ptr %27, align 8, !dbg !1292
  store i8 94, ptr %331, align 1, !dbg !1294
  %333 = load i8, ptr %22, align 1, !dbg !1295
  %334 = zext i8 %333 to i32, !dbg !1295
  %335 = add nsw i32 %334, 64, !dbg !1296
  %336 = trunc i32 %335 to i8, !dbg !1295
  %337 = load ptr, ptr %27, align 8, !dbg !1297
  %338 = getelementptr inbounds i8, ptr %337, i32 1, !dbg !1297
  store ptr %338, ptr %27, align 8, !dbg !1297
  store i8 %336, ptr %337, align 1, !dbg !1298
  br label %373, !dbg !1299

339:                                              ; preds = %327, %323
  %340 = load i8, ptr %22, align 1, !dbg !1300
  %341 = zext i8 %340 to i32, !dbg !1300
  %342 = icmp ne i32 %341, 10, !dbg !1302
  br i1 %342, label %343, label %371, !dbg !1303

343:                                              ; preds = %339
  %344 = load i8, ptr %22, align 1, !dbg !1304
  %345 = zext i8 %344 to i32, !dbg !1304
  %346 = icmp eq i32 %345, 13, !dbg !1307
  br i1 %346, label %347, label %366, !dbg !1308

347:                                              ; preds = %343
  %348 = load ptr, ptr %26, align 8, !dbg !1309
  %349 = load i8, ptr %348, align 1, !dbg !1310
  %350 = sext i8 %349 to i32, !dbg !1310
  %351 = icmp eq i32 %350, 10, !dbg !1311
  br i1 %351, label %352, label %366, !dbg !1312

352:                                              ; preds = %347
  %353 = load i8, ptr %20, align 1, !dbg !1313
  %354 = trunc i8 %353 to i1, !dbg !1313
  br i1 %354, label %355, label %366, !dbg !1314

355:                                              ; preds = %352
  %356 = load ptr, ptr %26, align 8, !dbg !1315
  %357 = load ptr, ptr %25, align 8, !dbg !1318
  %358 = icmp eq ptr %356, %357, !dbg !1319
  br i1 %358, label %359, label %360, !dbg !1320

359:                                              ; preds = %355
  store i8 1, ptr @pending_cr, align 1, !dbg !1321
  br label %365, !dbg !1322

360:                                              ; preds = %355
  %361 = load ptr, ptr %27, align 8, !dbg !1323
  %362 = getelementptr inbounds i8, ptr %361, i32 1, !dbg !1323
  store ptr %362, ptr %27, align 8, !dbg !1323
  store i8 94, ptr %361, align 1, !dbg !1325
  %363 = load ptr, ptr %27, align 8, !dbg !1326
  %364 = getelementptr inbounds i8, ptr %363, i32 1, !dbg !1326
  store ptr %364, ptr %27, align 8, !dbg !1326
  store i8 77, ptr %363, align 1, !dbg !1327
  br label %365

365:                                              ; preds = %360, %359
  br label %370, !dbg !1328

366:                                              ; preds = %352, %347, %343
  %367 = load i8, ptr %22, align 1, !dbg !1329
  %368 = load ptr, ptr %27, align 8, !dbg !1330
  %369 = getelementptr inbounds i8, ptr %368, i32 1, !dbg !1330
  store ptr %369, ptr %27, align 8, !dbg !1330
  store i8 %367, ptr %368, align 1, !dbg !1331
  br label %370

370:                                              ; preds = %366, %365
  br label %372, !dbg !1332

371:                                              ; preds = %339
  store i32 -1, ptr %23, align 4, !dbg !1333
  br label %377, !dbg !1335

372:                                              ; preds = %370
  br label %373

373:                                              ; preds = %372, %330
  %374 = load ptr, ptr %26, align 8, !dbg !1336
  %375 = getelementptr inbounds i8, ptr %374, i32 1, !dbg !1336
  store ptr %375, ptr %26, align 8, !dbg !1336
  %376 = load i8, ptr %374, align 1, !dbg !1337
  store i8 %376, ptr %22, align 1, !dbg !1338
  br label %323, !dbg !1283, !llvm.loop !1339

377:                                              ; preds = %371
  br label %378

378:                                              ; preds = %377, %321
  br label %44, !dbg !979, !llvm.loop !1341

379:                                              ; preds = %148, %138, %115
  %380 = load i1, ptr %11, align 1, !dbg !1343
  ret i1 %380, !dbg !1343
}

declare void @alignfree(ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #1

declare i32 @"\01_close"(i32 noundef) #2

declare i64 @full_write(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @write_error() #3 !dbg !1344 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata ptr %1, metadata !1345, metadata !DIExpression()), !dbg !1346
  %2 = call ptr @__error(), !dbg !1347
  %3 = load i32, ptr %2, align 4, !dbg !1347
  store i32 %3, ptr %1, align 4, !dbg !1346
  %4 = load ptr, ptr @__stdoutp, align 8, !dbg !1348
  %5 = call i32 @rpl_fflush(ptr noundef %4), !dbg !1349
  %6 = load ptr, ptr @__stdoutp, align 8, !dbg !1350
  %7 = call i32 @rpl_fpurge(ptr noundef %6), !dbg !1351
  %8 = load ptr, ptr @__stdoutp, align 8, !dbg !1352
  %9 = getelementptr inbounds %struct.__sFILE, ptr %8, i32 0, i32 3, !dbg !1352
  %10 = load i16, ptr %9, align 8, !dbg !1352
  %11 = sext i16 %10 to i32, !dbg !1352
  %12 = and i32 %11, -97, !dbg !1352
  %13 = trunc i32 %12 to i16, !dbg !1352
  store i16 %13, ptr %9, align 8, !dbg !1352
  %14 = load i32, ptr %1, align 4, !dbg !1353
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %14, ptr noundef @.str.48) #11, !dbg !1353
  unreachable, !dbg !1353
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

declare void @emit_bug_reporting_address() #2

declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #2

declare i32 @stdc_leading_zeros_ull(i64 noundef) #2

declare i64 @copy_file_range(i32 noundef, ptr noundef, i32 noundef, ptr noundef, i64 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal zeroext i1 @is_ENOTSUP(i32 noundef %0) #3 !dbg !1354 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1357, metadata !DIExpression()), !dbg !1358
  %3 = load i32, ptr %2, align 4, !dbg !1359
  %4 = icmp eq i32 %3, 102, !dbg !1360
  br i1 %4, label %8, label %5, !dbg !1361

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4, !dbg !1362
  %7 = icmp eq i32 %6, 45, !dbg !1363
  br label %8, !dbg !1361

8:                                                ; preds = %5, %1
  %9 = phi i1 [ true, %1 ], [ %7, %5 ]
  ret i1 %9, !dbg !1364
}

declare i64 @safe_read(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: nounwind
declare ptr @__memmove_chk(ptr noundef, ptr noundef, i64 noundef, i64 noundef) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #1

declare i32 @ioctl(i32 noundef, i64 noundef, ...) #2

declare ptr @quotearg_style(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @write_pending(ptr noundef %0, ptr noundef %1) #3 !dbg !1365 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1368, metadata !DIExpression()), !dbg !1369
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1370, metadata !DIExpression()), !dbg !1371
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1372, metadata !DIExpression()), !dbg !1373
  %6 = load ptr, ptr %4, align 8, !dbg !1374
  %7 = load ptr, ptr %6, align 8, !dbg !1375
  %8 = load ptr, ptr %3, align 8, !dbg !1376
  %9 = ptrtoint ptr %7 to i64, !dbg !1377
  %10 = ptrtoint ptr %8 to i64, !dbg !1377
  %11 = sub i64 %9, %10, !dbg !1377
  store i64 %11, ptr %5, align 8, !dbg !1373
  %12 = load i64, ptr %5, align 8, !dbg !1378
  %13 = icmp slt i64 0, %12, !dbg !1380
  br i1 %13, label %14, label %24, !dbg !1381

14:                                               ; preds = %2
  %15 = load ptr, ptr %3, align 8, !dbg !1382
  %16 = load i64, ptr %5, align 8, !dbg !1385
  %17 = call i64 @full_write(i32 noundef 1, ptr noundef %15, i64 noundef %16), !dbg !1386
  %18 = load i64, ptr %5, align 8, !dbg !1387
  %19 = icmp ne i64 %17, %18, !dbg !1388
  br i1 %19, label %20, label %21, !dbg !1389

20:                                               ; preds = %14
  call void @write_error(), !dbg !1390
  br label %21, !dbg !1390

21:                                               ; preds = %20, %14
  %22 = load ptr, ptr %3, align 8, !dbg !1391
  %23 = load ptr, ptr %4, align 8, !dbg !1392
  store ptr %22, ptr %23, align 8, !dbg !1393
  br label %24, !dbg !1394

24:                                               ; preds = %21, %2
  ret void, !dbg !1395
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @next_line_num() #3 !dbg !1396 {
  %1 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !1397, metadata !DIExpression()), !dbg !1398
  %2 = load ptr, ptr @line_num_end, align 8, !dbg !1399
  store ptr %2, ptr %1, align 8, !dbg !1398
  br label %3, !dbg !1400

3:                                                ; preds = %13, %0
  %4 = load ptr, ptr %1, align 8, !dbg !1401
  %5 = load i8, ptr %4, align 1, !dbg !1404
  %6 = add i8 %5, 1, !dbg !1404
  store i8 %6, ptr %4, align 1, !dbg !1404
  %7 = sext i8 %5 to i32, !dbg !1405
  %8 = icmp slt i32 %7, 57, !dbg !1406
  br i1 %8, label %9, label %10, !dbg !1407

9:                                                ; preds = %3
  br label %31, !dbg !1408

10:                                               ; preds = %3
  %11 = load ptr, ptr %1, align 8, !dbg !1409
  %12 = getelementptr inbounds i8, ptr %11, i32 -1, !dbg !1409
  store ptr %12, ptr %1, align 8, !dbg !1409
  store i8 48, ptr %11, align 1, !dbg !1410
  br label %13, !dbg !1411

13:                                               ; preds = %10
  %14 = load ptr, ptr %1, align 8, !dbg !1412
  %15 = load ptr, ptr @line_num_start, align 8, !dbg !1413
  %16 = icmp uge ptr %14, %15, !dbg !1414
  br i1 %16, label %3, label %17, !dbg !1411, !llvm.loop !1415

17:                                               ; preds = %13
  %18 = load ptr, ptr @line_num_start, align 8, !dbg !1417
  %19 = icmp ugt ptr %18, @line_buf, !dbg !1419
  br i1 %19, label %20, label %23, !dbg !1420

20:                                               ; preds = %17
  %21 = load ptr, ptr @line_num_start, align 8, !dbg !1421
  %22 = getelementptr inbounds i8, ptr %21, i32 -1, !dbg !1421
  store ptr %22, ptr @line_num_start, align 8, !dbg !1421
  store i8 49, ptr %22, align 1, !dbg !1422
  br label %24, !dbg !1423

23:                                               ; preds = %17
  store i8 62, ptr @line_buf, align 1, !dbg !1424
  br label %24

24:                                               ; preds = %23, %20
  %25 = load ptr, ptr @line_num_start, align 8, !dbg !1425
  %26 = load ptr, ptr @line_num_print, align 8, !dbg !1427
  %27 = icmp ult ptr %25, %26, !dbg !1428
  br i1 %27, label %28, label %31, !dbg !1429

28:                                               ; preds = %24
  %29 = load ptr, ptr @line_num_print, align 8, !dbg !1430
  %30 = getelementptr inbounds i8, ptr %29, i32 -1, !dbg !1430
  store ptr %30, ptr @line_num_print, align 8, !dbg !1430
  br label %31, !dbg !1431

31:                                               ; preds = %9, %28, %24
  ret void, !dbg !1432
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
!2 = !DIFile(filename: "coreutils/src/catPUA.c", directory: "/Users/felicitasgarcia/MM", checksumkind: CSK_MD5, checksum: "a0bfa903eb81b4c2961cf9c12357cf7d")
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
!53 = !DIFile(filename: "/Users/felicitasgarcia/MM/coreutils/src/catPUA.c", directory: "/Users/felicitasgarcia/MM/mimicrymonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "a0bfa903eb81b4c2961cf9c12357cf7d")
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
!182 = distinct !DIGlobalVariable(scope: null, file: !2, line: 722, type: !183, isLocal: true, isDefinition: true)
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
!643 = !DILocation(line: 711, column: 18, scope: !644)
!644 = distinct !DILexicalBlock(scope: !645, file: !2, line: 711, column: 18)
!645 = distinct !DILexicalBlock(scope: !629, file: !2, line: 710, column: 12)
!646 = !DILocation(line: 711, column: 28, scope: !644)
!647 = !DILocation(line: 711, column: 18, scope: !645)
!648 = !DILocation(line: 712, column: 29, scope: !644)
!649 = !DILocation(line: 712, column: 27, scope: !644)
!650 = !DILocation(line: 712, column: 17, scope: !644)
!651 = !DILocalVariable(name: "exhausting", scope: !645, file: !2, line: 713, type: !92)
!652 = !DILocation(line: 713, column: 22, scope: !645)
!653 = !DILocation(line: 713, column: 40, scope: !645)
!654 = !DILocation(line: 713, column: 37, scope: !645)
!655 = !DILocation(line: 713, column: 50, scope: !645)
!656 = !DILocation(line: 713, column: 53, scope: !645)
!657 = !DILocation(line: 713, column: 63, scope: !645)
!658 = !DILocation(line: 0, scope: !645)
!659 = !DILocation(line: 714, column: 22, scope: !660)
!660 = distinct !DILexicalBlock(scope: !645, file: !2, line: 714, column: 21)
!661 = !DILocation(line: 714, column: 21, scope: !645)
!662 = !DILocalVariable(name: "in_pos", scope: !663, file: !2, line: 716, type: !441)
!663 = distinct !DILexicalBlock(scope: !660, file: !2, line: 715, column: 16)
!664 = !DILocation(line: 716, column: 24, scope: !663)
!665 = !DILocation(line: 716, column: 40, scope: !663)
!666 = !DILocation(line: 716, column: 33, scope: !663)
!667 = !DILocation(line: 717, column: 27, scope: !668)
!668 = distinct !DILexicalBlock(scope: !663, file: !2, line: 717, column: 22)
!669 = !DILocation(line: 717, column: 24, scope: !668)
!670 = !DILocation(line: 717, column: 22, scope: !663)
!671 = !DILocation(line: 718, column: 37, scope: !668)
!672 = !DILocation(line: 718, column: 46, scope: !668)
!673 = !DILocation(line: 718, column: 44, scope: !668)
!674 = !DILocation(line: 718, column: 35, scope: !668)
!675 = !DILocation(line: 718, column: 24, scope: !668)
!676 = !DILocation(line: 719, column: 16, scope: !663)
!677 = !DILocation(line: 720, column: 20, scope: !678)
!678 = distinct !DILexicalBlock(scope: !645, file: !2, line: 720, column: 20)
!679 = !DILocation(line: 720, column: 20, scope: !645)
!680 = !DILocation(line: 722, column: 21, scope: !681)
!681 = distinct !DILexicalBlock(scope: !678, file: !2, line: 721, column: 16)
!682 = !DILocation(line: 723, column: 24, scope: !681)
!683 = !DILocation(line: 724, column: 21, scope: !681)
!684 = !DILocation(line: 726, column: 12, scope: !645)
!685 = !DILocalVariable(name: "inbuf", scope: !578, file: !2, line: 729, type: !51)
!686 = !DILocation(line: 729, column: 16, scope: !578)
!687 = !DILocation(line: 735, column: 17, scope: !688)
!688 = distinct !DILexicalBlock(scope: !578, file: !2, line: 735, column: 14)
!689 = !DILocation(line: 735, column: 24, scope: !688)
!690 = !DILocation(line: 735, column: 27, scope: !688)
!691 = !DILocation(line: 735, column: 37, scope: !688)
!692 = !DILocation(line: 735, column: 40, scope: !688)
!693 = !DILocation(line: 735, column: 57, scope: !688)
!694 = !DILocation(line: 735, column: 60, scope: !688)
!695 = !DILocation(line: 735, column: 70, scope: !688)
!696 = !DILocation(line: 735, column: 73, scope: !688)
!697 = !DILocation(line: 735, column: 14, scope: !578)
!698 = !DILocalVariable(name: "copy_cat_status", scope: !699, file: !2, line: 738, type: !49)
!699 = distinct !DILexicalBlock(scope: !688, file: !2, line: 737, column: 12)
!700 = !DILocation(line: 738, column: 18, scope: !699)
!701 = !DILocation(line: 738, column: 36, scope: !699)
!702 = !DILocation(line: 738, column: 46, scope: !699)
!703 = !DILocation(line: 738, column: 49, scope: !699)
!704 = !DILocation(line: 738, column: 78, scope: !699)
!705 = !DILocation(line: 740, column: 18, scope: !706)
!706 = distinct !DILexicalBlock(scope: !699, file: !2, line: 740, column: 18)
!707 = !DILocation(line: 740, column: 34, scope: !706)
!708 = !DILocation(line: 740, column: 18, scope: !699)
!709 = !DILocation(line: 742, column: 24, scope: !710)
!710 = distinct !DILexicalBlock(scope: !706, file: !2, line: 741, column: 16)
!711 = !DILocation(line: 743, column: 28, scope: !710)
!712 = !DILocation(line: 743, column: 26, scope: !710)
!713 = !DILocation(line: 743, column: 21, scope: !710)
!714 = !DILocation(line: 744, column: 16, scope: !710)
!715 = !DILocation(line: 747, column: 27, scope: !716)
!716 = distinct !DILexicalBlock(scope: !706, file: !2, line: 746, column: 16)
!717 = !DILocation(line: 747, column: 25, scope: !716)
!718 = !DILocation(line: 748, column: 39, scope: !716)
!719 = !DILocation(line: 748, column: 50, scope: !716)
!720 = !DILocation(line: 748, column: 26, scope: !716)
!721 = !DILocation(line: 748, column: 24, scope: !716)
!722 = !DILocation(line: 749, column: 36, scope: !716)
!723 = !DILocation(line: 749, column: 43, scope: !716)
!724 = !DILocation(line: 749, column: 24, scope: !716)
!725 = !DILocation(line: 749, column: 21, scope: !716)
!726 = !DILocation(line: 751, column: 12, scope: !699)
!727 = !DILocation(line: 755, column: 35, scope: !728)
!728 = distinct !DILexicalBlock(scope: !688, file: !2, line: 753, column: 12)
!729 = !DILocation(line: 755, column: 46, scope: !728)
!730 = !DILocation(line: 755, column: 53, scope: !728)
!731 = !DILocation(line: 755, column: 22, scope: !728)
!732 = !DILocation(line: 755, column: 20, scope: !728)
!733 = !DILocalVariable(name: "bufsize", scope: !728, file: !2, line: 778, type: !525)
!734 = !DILocation(line: 778, column: 20, scope: !728)
!735 = !DILocation(line: 779, column: 18, scope: !736)
!736 = distinct !DILexicalBlock(scope: !728, file: !2, line: 779, column: 18)
!737 = !DILocation(line: 779, column: 48, scope: !736)
!738 = !DILocation(line: 779, column: 51, scope: !736)
!739 = !DILocation(line: 779, column: 88, scope: !736)
!740 = !DILocation(line: 779, column: 91, scope: !736)
!741 = !DILocation(line: 779, column: 18, scope: !728)
!742 = !DILocation(line: 782, column: 16, scope: !736)
!743 = !DILocalVariable(name: "outbuf", scope: !728, file: !2, line: 783, type: !51)
!744 = !DILocation(line: 783, column: 20, scope: !728)
!745 = !DILocation(line: 783, column: 42, scope: !728)
!746 = !DILocation(line: 783, column: 53, scope: !728)
!747 = !DILocation(line: 783, column: 29, scope: !728)
!748 = !DILocation(line: 785, column: 25, scope: !728)
!749 = !DILocation(line: 785, column: 32, scope: !728)
!750 = !DILocation(line: 785, column: 40, scope: !728)
!751 = !DILocation(line: 785, column: 48, scope: !728)
!752 = !DILocation(line: 785, column: 57, scope: !728)
!753 = !DILocation(line: 785, column: 75, scope: !728)
!754 = !DILocation(line: 785, column: 86, scope: !728)
!755 = !DILocation(line: 785, column: 94, scope: !728)
!756 = !DILocation(line: 785, column: 111, scope: !728)
!757 = !DILocation(line: 785, column: 122, scope: !728)
!758 = !DILocation(line: 785, column: 20, scope: !728)
!759 = !DILocation(line: 785, column: 17, scope: !728)
!760 = !DILocation(line: 789, column: 25, scope: !728)
!761 = !DILocation(line: 789, column: 14, scope: !728)
!762 = !DILocation(line: 792, column: 21, scope: !578)
!763 = !DILocation(line: 792, column: 10, scope: !578)
!764 = !DILabel(scope: !578, name: "contin", file: !2, line: 794)
!765 = !DILocation(line: 794, column: 8, scope: !578)
!766 = !DILocation(line: 795, column: 15, scope: !767)
!767 = distinct !DILexicalBlock(scope: !578, file: !2, line: 795, column: 14)
!768 = !DILocation(line: 795, column: 29, scope: !767)
!769 = !DILocation(line: 795, column: 39, scope: !767)
!770 = !DILocation(line: 795, column: 32, scope: !767)
!771 = !DILocation(line: 795, column: 51, scope: !767)
!772 = !DILocation(line: 795, column: 14, scope: !578)
!773 = !DILocation(line: 797, column: 14, scope: !774)
!774 = distinct !DILexicalBlock(scope: !767, file: !2, line: 796, column: 12)
!775 = !DILocation(line: 798, column: 17, scope: !774)
!776 = !DILocation(line: 799, column: 12, scope: !774)
!777 = !DILocation(line: 800, column: 8, scope: !578)
!778 = !DILocation(line: 801, column: 13, scope: !46)
!779 = !DILocation(line: 801, column: 24, scope: !46)
!780 = !DILocation(line: 801, column: 22, scope: !46)
!781 = distinct !{!781, !575, !782, !357}
!782 = !DILocation(line: 801, column: 28, scope: !46)
!783 = !DILocation(line: 803, column: 10, scope: !784)
!784 = distinct !DILexicalBlock(scope: !46, file: !2, line: 803, column: 10)
!785 = !DILocation(line: 803, column: 10, scope: !46)
!786 = !DILocation(line: 805, column: 14, scope: !787)
!787 = distinct !DILexicalBlock(scope: !788, file: !2, line: 805, column: 14)
!788 = distinct !DILexicalBlock(scope: !784, file: !2, line: 804, column: 8)
!789 = !DILocation(line: 805, column: 50, scope: !787)
!790 = !DILocation(line: 805, column: 14, scope: !788)
!791 = !DILocation(line: 806, column: 12, scope: !787)
!792 = !DILocation(line: 807, column: 8, scope: !788)
!793 = !DILocation(line: 809, column: 10, scope: !794)
!794 = distinct !DILexicalBlock(scope: !46, file: !2, line: 809, column: 10)
!795 = !DILocation(line: 809, column: 26, scope: !794)
!796 = !DILocation(line: 809, column: 29, scope: !794)
!797 = !DILocation(line: 809, column: 50, scope: !794)
!798 = !DILocation(line: 809, column: 10, scope: !46)
!799 = !DILocation(line: 810, column: 8, scope: !794)
!800 = !DILocation(line: 812, column: 13, scope: !46)
!801 = !DILocation(line: 812, column: 6, scope: !46)
!802 = distinct !DISubprogram(name: "io_blksize", scope: !85, file: !85, line: 80, type: !803, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!803 = !DISubroutineType(types: !804)
!804 = !{!525, !805}
!805 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !806, size: 64)
!806 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !398)
!807 = !DILocalVariable(name: "st", arg: 1, scope: !802, file: !85, line: 80, type: !805)
!808 = !DILocation(line: 80, column: 32, scope: !802)
!809 = !DILocalVariable(name: "blocksize", scope: !802, file: !85, line: 83, type: !525)
!810 = !DILocation(line: 83, column: 9, scope: !802)
!811 = !DILocation(line: 83, column: 21, scope: !802)
!812 = !DILocation(line: 83, column: 38, scope: !802)
!813 = !DILocation(line: 83, column: 58, scope: !802)
!814 = !DILocation(line: 87, column: 54, scope: !802)
!815 = !DILocation(line: 87, column: 52, scope: !802)
!816 = !DILocation(line: 87, column: 33, scope: !802)
!817 = !DILocation(line: 87, column: 13, scope: !802)
!818 = !DILocation(line: 95, column: 7, scope: !819)
!819 = distinct !DILexicalBlock(scope: !802, file: !85, line: 95, column: 7)
!820 = !DILocation(line: 95, column: 29, scope: !819)
!821 = !DILocation(line: 95, column: 32, scope: !819)
!822 = !DILocation(line: 95, column: 45, scope: !819)
!823 = !DILocation(line: 95, column: 55, scope: !819)
!824 = !DILocation(line: 95, column: 42, scope: !819)
!825 = !DILocation(line: 95, column: 7, scope: !802)
!826 = !DILocalVariable(name: "leading_zeros", scope: !827, file: !85, line: 97, type: !49)
!827 = distinct !DILexicalBlock(scope: !819, file: !85, line: 96, column: 5)
!828 = !DILocation(line: 97, column: 11, scope: !827)
!829 = !DILocation(line: 97, column: 51, scope: !827)
!830 = !DILocation(line: 97, column: 27, scope: !827)
!831 = !DILocalVariable(name: "power", scope: !832, file: !85, line: 100, type: !419)
!832 = distinct !DILexicalBlock(scope: !833, file: !85, line: 99, column: 9)
!833 = distinct !DILexicalBlock(scope: !827, file: !85, line: 98, column: 11)
!834 = !DILocation(line: 100, column: 30, scope: !832)
!835 = !DILocation(line: 100, column: 62, scope: !832)
!836 = !DILocation(line: 100, column: 60, scope: !832)
!837 = !DILocation(line: 100, column: 43, scope: !832)
!838 = !DILocation(line: 101, column: 15, scope: !839)
!839 = distinct !DILexicalBlock(scope: !832, file: !85, line: 101, column: 15)
!840 = !DILocation(line: 101, column: 21, scope: !839)
!841 = !DILocation(line: 101, column: 15, scope: !832)
!842 = !DILocation(line: 102, column: 25, scope: !839)
!843 = !DILocation(line: 102, column: 23, scope: !839)
!844 = !DILocation(line: 102, column: 13, scope: !839)
!845 = !DILocation(line: 104, column: 5, scope: !827)
!846 = !DILocation(line: 108, column: 10, scope: !802)
!847 = !DILocation(line: 108, column: 3, scope: !802)
!848 = distinct !DISubprogram(name: "copy_cat", scope: !2, file: !2, line: 501, type: !849, scopeLine: 502, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!849 = !DISubroutineType(types: !850)
!850 = !{!49}
!851 = !DILocalVariable(name: "copy_max", scope: !848, file: !2, line: 506, type: !852)
!852 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !853, line: 31, baseType: !854)
!853 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_ssize_t.h", directory: "", checksumkind: CSK_MD5, checksum: "9b4f5bef81dd94a882775a3ce650ab9c")
!854 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ssize_t", file: !96, line: 118, baseType: !435)
!855 = !DILocation(line: 506, column: 14, scope: !848)
!856 = !DILocalVariable(name: "some_copied", scope: !857, file: !2, line: 514, type: !92)
!857 = distinct !DILexicalBlock(scope: !848, file: !2, line: 514, column: 6)
!858 = !DILocation(line: 514, column: 16, scope: !857)
!859 = !DILocation(line: 514, column: 11, scope: !857)
!860 = !DILocation(line: 515, column: 33, scope: !861)
!861 = distinct !DILexicalBlock(scope: !857, file: !2, line: 514, column: 6)
!862 = !DILocation(line: 515, column: 78, scope: !861)
!863 = !DILocation(line: 515, column: 16, scope: !861)
!864 = !DILocation(line: 515, column: 8, scope: !861)
!865 = !DILocation(line: 518, column: 19, scope: !866)
!866 = distinct !DILexicalBlock(scope: !861, file: !2, line: 516, column: 10)
!867 = !DILocation(line: 518, column: 12, scope: !866)
!868 = !DILocation(line: 521, column: 16, scope: !869)
!869 = distinct !DILexicalBlock(scope: !866, file: !2, line: 521, column: 16)
!870 = !DILocation(line: 521, column: 22, scope: !869)
!871 = !DILocation(line: 521, column: 32, scope: !869)
!872 = !DILocation(line: 521, column: 47, scope: !869)
!873 = !DILocation(line: 521, column: 35, scope: !869)
!874 = !DILocation(line: 521, column: 54, scope: !869)
!875 = !DILocation(line: 521, column: 57, scope: !869)
!876 = !DILocation(line: 521, column: 63, scope: !869)
!877 = !DILocation(line: 521, column: 73, scope: !869)
!878 = !DILocation(line: 521, column: 76, scope: !869)
!879 = !DILocation(line: 521, column: 82, scope: !869)
!880 = !DILocation(line: 521, column: 91, scope: !869)
!881 = !DILocation(line: 521, column: 94, scope: !869)
!882 = !DILocation(line: 521, column: 100, scope: !869)
!883 = !DILocation(line: 521, column: 109, scope: !869)
!884 = !DILocation(line: 521, column: 112, scope: !869)
!885 = !DILocation(line: 521, column: 118, scope: !869)
!886 = !DILocation(line: 521, column: 129, scope: !869)
!887 = !DILocation(line: 521, column: 132, scope: !869)
!888 = !DILocation(line: 521, column: 138, scope: !869)
!889 = !DILocation(line: 521, column: 16, scope: !866)
!890 = !DILocation(line: 522, column: 14, scope: !869)
!891 = !DILocation(line: 523, column: 12, scope: !866)
!892 = !DILocation(line: 524, column: 12, scope: !866)
!893 = !DILocation(line: 525, column: 10, scope: !866)
!894 = !DILocation(line: 514, column: 51, scope: !861)
!895 = !DILocation(line: 514, column: 6, scope: !861)
!896 = distinct !{!896, !897, !898}
!897 = !DILocation(line: 514, column: 6, scope: !857)
!898 = !DILocation(line: 525, column: 10, scope: !857)
!899 = !DILocation(line: 526, column: 4, scope: !848)
!900 = distinct !DISubprogram(name: "simple_cat", scope: !2, file: !2, line: 156, type: !901, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!901 = !DISubroutineType(types: !902)
!902 = !{!92, !51, !525}
!903 = !DILocalVariable(name: "buf", arg: 1, scope: !900, file: !2, line: 156, type: !51)
!904 = !DILocation(line: 156, column: 22, scope: !900)
!905 = !DILocalVariable(name: "bufsize", arg: 2, scope: !900, file: !2, line: 156, type: !525)
!906 = !DILocation(line: 156, column: 33, scope: !900)
!907 = !DILocation(line: 160, column: 6, scope: !900)
!908 = !DILocalVariable(name: "n_read", scope: !909, file: !2, line: 164, type: !527)
!909 = distinct !DILexicalBlock(scope: !900, file: !2, line: 161, column: 8)
!910 = !DILocation(line: 164, column: 20, scope: !909)
!911 = !DILocation(line: 164, column: 40, scope: !909)
!912 = !DILocation(line: 164, column: 52, scope: !909)
!913 = !DILocation(line: 164, column: 57, scope: !909)
!914 = !DILocation(line: 164, column: 29, scope: !909)
!915 = !DILocation(line: 165, column: 14, scope: !916)
!916 = distinct !DILexicalBlock(scope: !909, file: !2, line: 165, column: 14)
!917 = !DILocation(line: 165, column: 21, scope: !916)
!918 = !DILocation(line: 165, column: 14, scope: !909)
!919 = !DILocation(line: 167, column: 14, scope: !920)
!920 = distinct !DILexicalBlock(scope: !916, file: !2, line: 166, column: 12)
!921 = !DILocation(line: 168, column: 14, scope: !920)
!922 = !DILocation(line: 173, column: 14, scope: !923)
!923 = distinct !DILexicalBlock(scope: !909, file: !2, line: 173, column: 14)
!924 = !DILocation(line: 173, column: 21, scope: !923)
!925 = !DILocation(line: 173, column: 14, scope: !909)
!926 = !DILocation(line: 174, column: 12, scope: !923)
!927 = !DILocation(line: 178, column: 41, scope: !928)
!928 = distinct !DILexicalBlock(scope: !909, file: !2, line: 178, column: 14)
!929 = !DILocation(line: 178, column: 46, scope: !928)
!930 = !DILocation(line: 178, column: 14, scope: !928)
!931 = !DILocation(line: 178, column: 57, scope: !928)
!932 = !DILocation(line: 178, column: 54, scope: !928)
!933 = !DILocation(line: 178, column: 14, scope: !909)
!934 = !DILocation(line: 179, column: 12, scope: !928)
!935 = distinct !{!935, !907, !936}
!936 = !DILocation(line: 180, column: 8, scope: !900)
!937 = !DILocation(line: 181, column: 4, scope: !900)
!938 = distinct !DISubprogram(name: "cat", scope: !2, file: !2, line: 212, type: !939, scopeLine: 215, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!939 = !DISubroutineType(types: !940)
!940 = !{!92, !51, !525, !51, !525, !92, !92, !92, !92, !92, !92}
!941 = !DILocalVariable(name: "inbuf", arg: 1, scope: !938, file: !2, line: 212, type: !51)
!942 = !DILocation(line: 212, column: 15, scope: !938)
!943 = !DILocalVariable(name: "insize", arg: 2, scope: !938, file: !2, line: 212, type: !525)
!944 = !DILocation(line: 212, column: 28, scope: !938)
!945 = !DILocalVariable(name: "outbuf", arg: 3, scope: !938, file: !2, line: 212, type: !51)
!946 = !DILocation(line: 212, column: 42, scope: !938)
!947 = !DILocalVariable(name: "outsize", arg: 4, scope: !938, file: !2, line: 212, type: !525)
!948 = !DILocation(line: 212, column: 56, scope: !938)
!949 = !DILocalVariable(name: "show_nonprinting", arg: 5, scope: !938, file: !2, line: 213, type: !92)
!950 = !DILocation(line: 213, column: 14, scope: !938)
!951 = !DILocalVariable(name: "show_tabs", arg: 6, scope: !938, file: !2, line: 213, type: !92)
!952 = !DILocation(line: 213, column: 37, scope: !938)
!953 = !DILocalVariable(name: "number", arg: 7, scope: !938, file: !2, line: 213, type: !92)
!954 = !DILocation(line: 213, column: 53, scope: !938)
!955 = !DILocalVariable(name: "number_nonblank", arg: 8, scope: !938, file: !2, line: 213, type: !92)
!956 = !DILocation(line: 213, column: 66, scope: !938)
!957 = !DILocalVariable(name: "show_ends", arg: 9, scope: !938, file: !2, line: 214, type: !92)
!958 = !DILocation(line: 214, column: 14, scope: !938)
!959 = !DILocalVariable(name: "squeeze_blank", arg: 10, scope: !938, file: !2, line: 214, type: !92)
!960 = !DILocation(line: 214, column: 30, scope: !938)
!961 = !DILocalVariable(name: "ch", scope: !938, file: !2, line: 217, type: !962)
!962 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!963 = !DILocation(line: 217, column: 20, scope: !938)
!964 = !DILocalVariable(name: "newlines", scope: !938, file: !2, line: 224, type: !49)
!965 = !DILocation(line: 224, column: 10, scope: !938)
!966 = !DILocation(line: 224, column: 21, scope: !938)
!967 = !DILocalVariable(name: "use_fionread", scope: !938, file: !2, line: 229, type: !92)
!968 = !DILocation(line: 229, column: 11, scope: !938)
!969 = !DILocalVariable(name: "eob", scope: !938, file: !2, line: 237, type: !51)
!970 = !DILocation(line: 237, column: 12, scope: !938)
!971 = !DILocation(line: 237, column: 18, scope: !938)
!972 = !DILocalVariable(name: "bpin", scope: !938, file: !2, line: 240, type: !51)
!973 = !DILocation(line: 240, column: 12, scope: !938)
!974 = !DILocation(line: 240, column: 19, scope: !938)
!975 = !DILocation(line: 240, column: 23, scope: !938)
!976 = !DILocalVariable(name: "bpout", scope: !938, file: !2, line: 243, type: !51)
!977 = !DILocation(line: 243, column: 12, scope: !938)
!978 = !DILocation(line: 243, column: 20, scope: !938)
!979 = !DILocation(line: 245, column: 6, scope: !938)
!980 = !DILocation(line: 247, column: 10, scope: !981)
!981 = distinct !DILexicalBlock(scope: !938, file: !2, line: 246, column: 8)
!982 = !DILocation(line: 251, column: 18, scope: !983)
!983 = distinct !DILexicalBlock(scope: !984, file: !2, line: 251, column: 18)
!984 = distinct !DILexicalBlock(scope: !981, file: !2, line: 248, column: 12)
!985 = !DILocation(line: 251, column: 27, scope: !983)
!986 = !DILocation(line: 251, column: 25, scope: !983)
!987 = !DILocation(line: 251, column: 38, scope: !983)
!988 = !DILocation(line: 251, column: 35, scope: !983)
!989 = !DILocation(line: 251, column: 18, scope: !984)
!990 = !DILocalVariable(name: "wp", scope: !991, file: !2, line: 253, type: !51)
!991 = distinct !DILexicalBlock(scope: !983, file: !2, line: 252, column: 16)
!992 = !DILocation(line: 253, column: 24, scope: !991)
!993 = !DILocation(line: 253, column: 29, scope: !991)
!994 = !DILocalVariable(name: "remaining_bytes", scope: !991, file: !2, line: 254, type: !525)
!995 = !DILocation(line: 254, column: 24, scope: !991)
!996 = !DILocation(line: 255, column: 18, scope: !991)
!997 = !DILocation(line: 257, column: 53, scope: !998)
!998 = distinct !DILexicalBlock(scope: !999, file: !2, line: 257, column: 26)
!999 = distinct !DILexicalBlock(scope: !991, file: !2, line: 256, column: 20)
!1000 = !DILocation(line: 257, column: 57, scope: !998)
!1001 = !DILocation(line: 257, column: 26, scope: !998)
!1002 = !DILocation(line: 257, column: 69, scope: !998)
!1003 = !DILocation(line: 257, column: 66, scope: !998)
!1004 = !DILocation(line: 257, column: 26, scope: !999)
!1005 = !DILocation(line: 258, column: 24, scope: !998)
!1006 = !DILocation(line: 259, column: 28, scope: !999)
!1007 = !DILocation(line: 259, column: 25, scope: !999)
!1008 = !DILocation(line: 260, column: 40, scope: !999)
!1009 = !DILocation(line: 260, column: 48, scope: !999)
!1010 = !DILocation(line: 260, column: 46, scope: !999)
!1011 = !DILocation(line: 260, column: 38, scope: !999)
!1012 = !DILocation(line: 261, column: 20, scope: !999)
!1013 = !DILocation(line: 262, column: 25, scope: !991)
!1014 = !DILocation(line: 262, column: 36, scope: !991)
!1015 = !DILocation(line: 262, column: 33, scope: !991)
!1016 = distinct !{!1016, !996, !1017, !357}
!1017 = !DILocation(line: 262, column: 51, scope: !991)
!1018 = !DILocation(line: 267, column: 18, scope: !991)
!1019 = !DILocation(line: 268, column: 26, scope: !991)
!1020 = !DILocation(line: 268, column: 35, scope: !991)
!1021 = !DILocation(line: 268, column: 33, scope: !991)
!1022 = !DILocation(line: 268, column: 24, scope: !991)
!1023 = !DILocation(line: 269, column: 16, scope: !991)
!1024 = !DILocation(line: 273, column: 18, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !984, file: !2, line: 273, column: 18)
!1026 = !DILocation(line: 273, column: 25, scope: !1025)
!1027 = !DILocation(line: 273, column: 23, scope: !1025)
!1028 = !DILocation(line: 273, column: 18, scope: !984)
!1029 = !DILocalVariable(name: "input_pending", scope: !1030, file: !2, line: 275, type: !92)
!1030 = distinct !DILexicalBlock(scope: !1025, file: !2, line: 274, column: 16)
!1031 = !DILocation(line: 275, column: 23, scope: !1030)
!1032 = !DILocalVariable(name: "n_to_read", scope: !1030, file: !2, line: 277, type: !49)
!1033 = !DILocation(line: 277, column: 22, scope: !1030)
!1034 = !DILocation(line: 283, column: 22, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1030, file: !2, line: 283, column: 22)
!1036 = !DILocation(line: 283, column: 35, scope: !1035)
!1037 = !DILocation(line: 283, column: 45, scope: !1035)
!1038 = !DILocation(line: 283, column: 38, scope: !1035)
!1039 = !DILocation(line: 283, column: 79, scope: !1035)
!1040 = !DILocation(line: 283, column: 22, scope: !1030)
!1041 = !DILocation(line: 291, column: 26, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1043, file: !2, line: 291, column: 26)
!1043 = distinct !DILexicalBlock(scope: !1035, file: !2, line: 284, column: 20)
!1044 = !DILocation(line: 291, column: 32, scope: !1042)
!1045 = !DILocation(line: 291, column: 46, scope: !1042)
!1046 = !DILocation(line: 291, column: 49, scope: !1042)
!1047 = !DILocation(line: 291, column: 55, scope: !1042)
!1048 = !DILocation(line: 291, column: 65, scope: !1042)
!1049 = !DILocation(line: 291, column: 68, scope: !1042)
!1050 = !DILocation(line: 291, column: 74, scope: !1042)
!1051 = !DILocation(line: 291, column: 84, scope: !1042)
!1052 = !DILocation(line: 291, column: 87, scope: !1042)
!1053 = !DILocation(line: 291, column: 93, scope: !1042)
!1054 = !DILocation(line: 291, column: 103, scope: !1042)
!1055 = !DILocation(line: 291, column: 106, scope: !1042)
!1056 = !DILocation(line: 291, column: 112, scope: !1042)
!1057 = !DILocation(line: 291, column: 26, scope: !1043)
!1058 = !DILocation(line: 292, column: 37, scope: !1042)
!1059 = !DILocation(line: 292, column: 24, scope: !1042)
!1060 = !DILocation(line: 295, column: 26, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1042, file: !2, line: 294, column: 24)
!1062 = !DILocation(line: 297, column: 38, scope: !1061)
!1063 = !DILocation(line: 297, column: 36, scope: !1061)
!1064 = !DILocation(line: 298, column: 26, scope: !1061)
!1065 = !DILocation(line: 300, column: 20, scope: !1043)
!1066 = !DILocation(line: 301, column: 22, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1030, file: !2, line: 301, column: 22)
!1068 = !DILocation(line: 301, column: 32, scope: !1067)
!1069 = !DILocation(line: 301, column: 22, scope: !1030)
!1070 = !DILocation(line: 302, column: 34, scope: !1067)
!1071 = !DILocation(line: 302, column: 20, scope: !1067)
!1072 = !DILocation(line: 305, column: 23, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1030, file: !2, line: 305, column: 22)
!1074 = !DILocation(line: 305, column: 22, scope: !1030)
!1075 = !DILocation(line: 306, column: 35, scope: !1073)
!1076 = !DILocation(line: 306, column: 20, scope: !1073)
!1077 = !DILocalVariable(name: "n_read", scope: !1030, file: !2, line: 310, type: !527)
!1078 = !DILocation(line: 310, column: 28, scope: !1030)
!1079 = !DILocation(line: 310, column: 48, scope: !1030)
!1080 = !DILocation(line: 310, column: 60, scope: !1030)
!1081 = !DILocation(line: 310, column: 67, scope: !1030)
!1082 = !DILocation(line: 310, column: 37, scope: !1030)
!1083 = !DILocation(line: 311, column: 22, scope: !1084)
!1084 = distinct !DILexicalBlock(scope: !1030, file: !2, line: 311, column: 22)
!1085 = !DILocation(line: 311, column: 29, scope: !1084)
!1086 = !DILocation(line: 311, column: 22, scope: !1030)
!1087 = !DILocation(line: 313, column: 22, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1084, file: !2, line: 312, column: 20)
!1089 = !DILocation(line: 314, column: 37, scope: !1088)
!1090 = !DILocation(line: 314, column: 22, scope: !1088)
!1091 = !DILocation(line: 315, column: 34, scope: !1088)
!1092 = !DILocation(line: 315, column: 32, scope: !1088)
!1093 = !DILocation(line: 316, column: 22, scope: !1088)
!1094 = !DILocation(line: 318, column: 22, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1030, file: !2, line: 318, column: 22)
!1096 = !DILocation(line: 318, column: 29, scope: !1095)
!1097 = !DILocation(line: 318, column: 22, scope: !1030)
!1098 = !DILocation(line: 320, column: 37, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1095, file: !2, line: 319, column: 20)
!1100 = !DILocation(line: 320, column: 22, scope: !1099)
!1101 = !DILocation(line: 321, column: 34, scope: !1099)
!1102 = !DILocation(line: 321, column: 32, scope: !1099)
!1103 = !DILocation(line: 322, column: 22, scope: !1099)
!1104 = !DILocation(line: 328, column: 25, scope: !1030)
!1105 = !DILocation(line: 328, column: 23, scope: !1030)
!1106 = !DILocation(line: 329, column: 24, scope: !1030)
!1107 = !DILocation(line: 329, column: 31, scope: !1030)
!1108 = !DILocation(line: 329, column: 29, scope: !1030)
!1109 = !DILocation(line: 329, column: 22, scope: !1030)
!1110 = !DILocation(line: 330, column: 19, scope: !1030)
!1111 = !DILocation(line: 330, column: 23, scope: !1030)
!1112 = !DILocation(line: 331, column: 16, scope: !1030)
!1113 = !DILocation(line: 339, column: 22, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1115, file: !2, line: 339, column: 22)
!1115 = distinct !DILexicalBlock(scope: !1025, file: !2, line: 333, column: 16)
!1116 = !DILocation(line: 339, column: 33, scope: !1114)
!1117 = !DILocation(line: 339, column: 22, scope: !1115)
!1118 = !DILocation(line: 341, column: 26, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1120, file: !2, line: 341, column: 26)
!1120 = distinct !DILexicalBlock(scope: !1114, file: !2, line: 340, column: 20)
!1121 = !DILocation(line: 341, column: 35, scope: !1119)
!1122 = !DILocation(line: 341, column: 26, scope: !1120)
!1123 = !DILocation(line: 346, column: 35, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1119, file: !2, line: 342, column: 24)
!1125 = !DILocation(line: 351, column: 30, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1124, file: !2, line: 351, column: 30)
!1127 = !DILocation(line: 351, column: 30, scope: !1124)
!1128 = !DILocation(line: 353, column: 40, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1126, file: !2, line: 352, column: 28)
!1130 = !DILocation(line: 353, column: 35, scope: !1129)
!1131 = !DILocation(line: 353, column: 33, scope: !1129)
!1132 = !DILocation(line: 354, column: 30, scope: !1129)
!1133 = !DILocation(line: 356, column: 24, scope: !1124)
!1134 = !DILocation(line: 360, column: 26, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1120, file: !2, line: 360, column: 26)
!1136 = !DILocation(line: 360, column: 33, scope: !1135)
!1137 = !DILocation(line: 360, column: 37, scope: !1135)
!1138 = !DILocation(line: 360, column: 26, scope: !1120)
!1139 = !DILocation(line: 362, column: 26, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1135, file: !2, line: 361, column: 24)
!1141 = !DILocation(line: 363, column: 34, scope: !1140)
!1142 = !DILocation(line: 363, column: 32, scope: !1140)
!1143 = !DILocation(line: 364, column: 24, scope: !1140)
!1144 = !DILocation(line: 365, column: 20, scope: !1120)
!1145 = !DILocation(line: 368, column: 22, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1115, file: !2, line: 368, column: 22)
!1147 = !DILocation(line: 368, column: 22, scope: !1115)
!1148 = !DILocation(line: 370, column: 26, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1150, file: !2, line: 370, column: 26)
!1150 = distinct !DILexicalBlock(scope: !1146, file: !2, line: 369, column: 20)
!1151 = !DILocation(line: 370, column: 26, scope: !1150)
!1152 = !DILocation(line: 372, column: 32, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1149, file: !2, line: 371, column: 24)
!1154 = !DILocation(line: 372, column: 35, scope: !1153)
!1155 = !DILocation(line: 373, column: 32, scope: !1153)
!1156 = !DILocation(line: 373, column: 35, scope: !1153)
!1157 = !DILocation(line: 374, column: 37, scope: !1153)
!1158 = !DILocation(line: 375, column: 24, scope: !1153)
!1159 = !DILocation(line: 376, column: 28, scope: !1150)
!1160 = !DILocation(line: 376, column: 31, scope: !1150)
!1161 = !DILocation(line: 377, column: 20, scope: !1150)
!1162 = !DILocation(line: 381, column: 24, scope: !1115)
!1163 = !DILocation(line: 381, column: 27, scope: !1115)
!1164 = !DILocation(line: 383, column: 24, scope: !984)
!1165 = !DILocation(line: 383, column: 19, scope: !984)
!1166 = !DILocation(line: 383, column: 17, scope: !984)
!1167 = !DILocation(line: 384, column: 12, scope: !984)
!1168 = !DILocation(line: 385, column: 17, scope: !981)
!1169 = !DILocation(line: 385, column: 20, scope: !981)
!1170 = distinct !{!1170, !980, !1171, !357}
!1171 = !DILocation(line: 385, column: 27, scope: !981)
!1172 = !DILocation(line: 389, column: 14, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !981, file: !2, line: 389, column: 14)
!1174 = !DILocation(line: 389, column: 14, scope: !981)
!1175 = !DILocation(line: 391, column: 20, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1173, file: !2, line: 390, column: 12)
!1177 = !DILocation(line: 391, column: 23, scope: !1176)
!1178 = !DILocation(line: 392, column: 25, scope: !1176)
!1179 = !DILocation(line: 393, column: 12, scope: !1176)
!1180 = !DILocation(line: 397, column: 14, scope: !1181)
!1181 = distinct !DILexicalBlock(scope: !981, file: !2, line: 397, column: 14)
!1182 = !DILocation(line: 397, column: 23, scope: !1181)
!1183 = !DILocation(line: 397, column: 28, scope: !1181)
!1184 = !DILocation(line: 397, column: 31, scope: !1181)
!1185 = !DILocation(line: 397, column: 14, scope: !981)
!1186 = !DILocation(line: 399, column: 14, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1181, file: !2, line: 398, column: 12)
!1188 = !DILocation(line: 400, column: 22, scope: !1187)
!1189 = !DILocation(line: 400, column: 20, scope: !1187)
!1190 = !DILocation(line: 401, column: 12, scope: !1187)
!1191 = !DILocation(line: 409, column: 14, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !981, file: !2, line: 409, column: 14)
!1193 = !DILocation(line: 409, column: 14, scope: !981)
!1194 = !DILocation(line: 411, column: 14, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1192, file: !2, line: 410, column: 12)
!1196 = !DILocation(line: 413, column: 22, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1198, file: !2, line: 413, column: 22)
!1198 = distinct !DILexicalBlock(scope: !1195, file: !2, line: 412, column: 16)
!1199 = !DILocation(line: 413, column: 25, scope: !1197)
!1200 = !DILocation(line: 413, column: 22, scope: !1198)
!1201 = !DILocation(line: 415, column: 26, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1203, file: !2, line: 415, column: 26)
!1203 = distinct !DILexicalBlock(scope: !1197, file: !2, line: 414, column: 20)
!1204 = !DILocation(line: 415, column: 29, scope: !1202)
!1205 = !DILocation(line: 415, column: 26, scope: !1203)
!1206 = !DILocation(line: 416, column: 35, scope: !1202)
!1207 = !DILocation(line: 416, column: 30, scope: !1202)
!1208 = !DILocation(line: 416, column: 33, scope: !1202)
!1209 = !DILocation(line: 416, column: 24, scope: !1202)
!1210 = !DILocation(line: 417, column: 31, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1202, file: !2, line: 417, column: 31)
!1212 = !DILocation(line: 417, column: 34, scope: !1211)
!1213 = !DILocation(line: 417, column: 31, scope: !1202)
!1214 = !DILocation(line: 419, column: 32, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1211, file: !2, line: 418, column: 24)
!1216 = !DILocation(line: 419, column: 35, scope: !1215)
!1217 = !DILocation(line: 420, column: 32, scope: !1215)
!1218 = !DILocation(line: 420, column: 35, scope: !1215)
!1219 = !DILocation(line: 421, column: 24, scope: !1215)
!1220 = !DILocation(line: 424, column: 32, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1211, file: !2, line: 423, column: 24)
!1222 = !DILocation(line: 424, column: 35, scope: !1221)
!1223 = !DILocation(line: 425, column: 32, scope: !1221)
!1224 = !DILocation(line: 425, column: 35, scope: !1221)
!1225 = !DILocation(line: 426, column: 30, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !2, line: 426, column: 30)
!1227 = !DILocation(line: 426, column: 33, scope: !1226)
!1228 = !DILocation(line: 426, column: 30, scope: !1221)
!1229 = !DILocation(line: 428, column: 34, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1231, file: !2, line: 428, column: 34)
!1231 = distinct !DILexicalBlock(scope: !1226, file: !2, line: 427, column: 28)
!1232 = !DILocation(line: 428, column: 37, scope: !1230)
!1233 = !DILocation(line: 428, column: 34, scope: !1231)
!1234 = !DILocation(line: 429, column: 43, scope: !1230)
!1235 = !DILocation(line: 429, column: 46, scope: !1230)
!1236 = !DILocation(line: 429, column: 38, scope: !1230)
!1237 = !DILocation(line: 429, column: 41, scope: !1230)
!1238 = !DILocation(line: 429, column: 32, scope: !1230)
!1239 = !DILocation(line: 432, column: 40, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1230, file: !2, line: 431, column: 32)
!1241 = !DILocation(line: 432, column: 43, scope: !1240)
!1242 = !DILocation(line: 433, column: 40, scope: !1240)
!1243 = !DILocation(line: 433, column: 43, scope: !1240)
!1244 = !DILocation(line: 435, column: 28, scope: !1231)
!1245 = !DILocation(line: 438, column: 36, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1226, file: !2, line: 437, column: 28)
!1247 = !DILocation(line: 438, column: 39, scope: !1246)
!1248 = !DILocation(line: 439, column: 41, scope: !1246)
!1249 = !DILocation(line: 439, column: 44, scope: !1246)
!1250 = !DILocation(line: 439, column: 50, scope: !1246)
!1251 = !DILocation(line: 439, column: 36, scope: !1246)
!1252 = !DILocation(line: 439, column: 39, scope: !1246)
!1253 = !DILocation(line: 442, column: 20, scope: !1203)
!1254 = !DILocation(line: 443, column: 27, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1197, file: !2, line: 443, column: 27)
!1256 = !DILocation(line: 443, column: 30, scope: !1255)
!1257 = !DILocation(line: 443, column: 38, scope: !1255)
!1258 = !DILocation(line: 443, column: 42, scope: !1255)
!1259 = !DILocation(line: 443, column: 27, scope: !1197)
!1260 = !DILocation(line: 444, column: 26, scope: !1255)
!1261 = !DILocation(line: 444, column: 29, scope: !1255)
!1262 = !DILocation(line: 444, column: 20, scope: !1255)
!1263 = !DILocation(line: 445, column: 27, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1255, file: !2, line: 445, column: 27)
!1265 = !DILocation(line: 445, column: 30, scope: !1264)
!1266 = !DILocation(line: 445, column: 27, scope: !1255)
!1267 = !DILocation(line: 447, column: 31, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1264, file: !2, line: 446, column: 20)
!1269 = !DILocation(line: 448, column: 22, scope: !1268)
!1270 = !DILocation(line: 452, column: 28, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1264, file: !2, line: 451, column: 20)
!1272 = !DILocation(line: 452, column: 31, scope: !1271)
!1273 = !DILocation(line: 453, column: 33, scope: !1271)
!1274 = !DILocation(line: 453, column: 36, scope: !1271)
!1275 = !DILocation(line: 453, column: 28, scope: !1271)
!1276 = !DILocation(line: 453, column: 31, scope: !1271)
!1277 = !DILocation(line: 456, column: 28, scope: !1198)
!1278 = !DILocation(line: 456, column: 23, scope: !1198)
!1279 = !DILocation(line: 456, column: 21, scope: !1198)
!1280 = distinct !{!1280, !1194, !1281}
!1281 = !DILocation(line: 457, column: 16, scope: !1195)
!1282 = !DILocation(line: 458, column: 12, scope: !1195)
!1283 = !DILocation(line: 462, column: 14, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1192, file: !2, line: 460, column: 12)
!1285 = !DILocation(line: 464, column: 22, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1287, file: !2, line: 464, column: 22)
!1287 = distinct !DILexicalBlock(scope: !1284, file: !2, line: 463, column: 16)
!1288 = !DILocation(line: 464, column: 25, scope: !1286)
!1289 = !DILocation(line: 464, column: 33, scope: !1286)
!1290 = !DILocation(line: 464, column: 36, scope: !1286)
!1291 = !DILocation(line: 464, column: 22, scope: !1287)
!1292 = !DILocation(line: 466, column: 28, scope: !1293)
!1293 = distinct !DILexicalBlock(scope: !1286, file: !2, line: 465, column: 20)
!1294 = !DILocation(line: 466, column: 31, scope: !1293)
!1295 = !DILocation(line: 467, column: 33, scope: !1293)
!1296 = !DILocation(line: 467, column: 36, scope: !1293)
!1297 = !DILocation(line: 467, column: 28, scope: !1293)
!1298 = !DILocation(line: 467, column: 31, scope: !1293)
!1299 = !DILocation(line: 468, column: 20, scope: !1293)
!1300 = !DILocation(line: 469, column: 27, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1286, file: !2, line: 469, column: 27)
!1302 = !DILocation(line: 469, column: 30, scope: !1301)
!1303 = !DILocation(line: 469, column: 27, scope: !1286)
!1304 = !DILocation(line: 471, column: 26, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1306, file: !2, line: 471, column: 26)
!1306 = distinct !DILexicalBlock(scope: !1301, file: !2, line: 470, column: 20)
!1307 = !DILocation(line: 471, column: 29, scope: !1305)
!1308 = !DILocation(line: 471, column: 37, scope: !1305)
!1309 = !DILocation(line: 471, column: 41, scope: !1305)
!1310 = !DILocation(line: 471, column: 40, scope: !1305)
!1311 = !DILocation(line: 471, column: 46, scope: !1305)
!1312 = !DILocation(line: 471, column: 54, scope: !1305)
!1313 = !DILocation(line: 471, column: 57, scope: !1305)
!1314 = !DILocation(line: 471, column: 26, scope: !1306)
!1315 = !DILocation(line: 473, column: 30, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1317, file: !2, line: 473, column: 30)
!1317 = distinct !DILexicalBlock(scope: !1305, file: !2, line: 472, column: 24)
!1318 = !DILocation(line: 473, column: 38, scope: !1316)
!1319 = !DILocation(line: 473, column: 35, scope: !1316)
!1320 = !DILocation(line: 473, column: 30, scope: !1317)
!1321 = !DILocation(line: 474, column: 39, scope: !1316)
!1322 = !DILocation(line: 474, column: 28, scope: !1316)
!1323 = !DILocation(line: 477, column: 36, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1316, file: !2, line: 476, column: 28)
!1325 = !DILocation(line: 477, column: 39, scope: !1324)
!1326 = !DILocation(line: 478, column: 36, scope: !1324)
!1327 = !DILocation(line: 478, column: 39, scope: !1324)
!1328 = !DILocation(line: 480, column: 24, scope: !1317)
!1329 = !DILocation(line: 482, column: 35, scope: !1305)
!1330 = !DILocation(line: 482, column: 30, scope: !1305)
!1331 = !DILocation(line: 482, column: 33, scope: !1305)
!1332 = !DILocation(line: 483, column: 20, scope: !1306)
!1333 = !DILocation(line: 486, column: 31, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1301, file: !2, line: 485, column: 20)
!1335 = !DILocation(line: 487, column: 22, scope: !1334)
!1336 = !DILocation(line: 490, column: 28, scope: !1287)
!1337 = !DILocation(line: 490, column: 23, scope: !1287)
!1338 = !DILocation(line: 490, column: 21, scope: !1287)
!1339 = distinct !{!1339, !1283, !1340}
!1340 = !DILocation(line: 491, column: 16, scope: !1284)
!1341 = distinct !{!1341, !979, !1342}
!1342 = !DILocation(line: 493, column: 8, scope: !938)
!1343 = !DILocation(line: 494, column: 4, scope: !938)
!1344 = distinct !DISubprogram(name: "write_error", scope: !56, file: !56, line: 741, type: !323, scopeLine: 742, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1345 = !DILocalVariable(name: "saved_errno", scope: !1344, file: !56, line: 743, type: !49)
!1346 = !DILocation(line: 743, column: 7, scope: !1344)
!1347 = !DILocation(line: 743, column: 21, scope: !1344)
!1348 = !DILocation(line: 744, column: 11, scope: !1344)
!1349 = !DILocation(line: 744, column: 3, scope: !1344)
!1350 = !DILocation(line: 745, column: 11, scope: !1344)
!1351 = !DILocation(line: 745, column: 3, scope: !1344)
!1352 = !DILocation(line: 746, column: 3, scope: !1344)
!1353 = !DILocation(line: 747, column: 3, scope: !1344)
!1354 = distinct !DISubprogram(name: "is_ENOTSUP", scope: !56, file: !56, line: 774, type: !1355, scopeLine: 775, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1355 = !DISubroutineType(types: !1356)
!1356 = !{!92, !49}
!1357 = !DILocalVariable(name: "err", arg: 1, scope: !1354, file: !56, line: 774, type: !49)
!1358 = !DILocation(line: 774, column: 17, scope: !1354)
!1359 = !DILocation(line: 776, column: 10, scope: !1354)
!1360 = !DILocation(line: 776, column: 14, scope: !1354)
!1361 = !DILocation(line: 776, column: 28, scope: !1354)
!1362 = !DILocation(line: 776, column: 57, scope: !1354)
!1363 = !DILocation(line: 776, column: 61, scope: !1354)
!1364 = !DILocation(line: 776, column: 3, scope: !1354)
!1365 = distinct !DISubprogram(name: "write_pending", scope: !2, file: !2, line: 188, type: !1366, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1366 = !DISubroutineType(types: !1367)
!1367 = !{null, !51, !50}
!1368 = !DILocalVariable(name: "outbuf", arg: 1, scope: !1365, file: !2, line: 188, type: !51)
!1369 = !DILocation(line: 188, column: 25, scope: !1365)
!1370 = !DILocalVariable(name: "bpout", arg: 2, scope: !1365, file: !2, line: 188, type: !50)
!1371 = !DILocation(line: 188, column: 40, scope: !1365)
!1372 = !DILocalVariable(name: "n_write", scope: !1365, file: !2, line: 190, type: !525)
!1373 = !DILocation(line: 190, column: 12, scope: !1365)
!1374 = !DILocation(line: 190, column: 23, scope: !1365)
!1375 = !DILocation(line: 190, column: 22, scope: !1365)
!1376 = !DILocation(line: 190, column: 31, scope: !1365)
!1377 = !DILocation(line: 190, column: 29, scope: !1365)
!1378 = !DILocation(line: 191, column: 14, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1365, file: !2, line: 191, column: 10)
!1380 = !DILocation(line: 191, column: 12, scope: !1379)
!1381 = !DILocation(line: 191, column: 10, scope: !1365)
!1382 = !DILocation(line: 193, column: 41, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1384, file: !2, line: 193, column: 14)
!1384 = distinct !DILexicalBlock(scope: !1379, file: !2, line: 192, column: 8)
!1385 = !DILocation(line: 193, column: 49, scope: !1383)
!1386 = !DILocation(line: 193, column: 14, scope: !1383)
!1387 = !DILocation(line: 193, column: 61, scope: !1383)
!1388 = !DILocation(line: 193, column: 58, scope: !1383)
!1389 = !DILocation(line: 193, column: 14, scope: !1384)
!1390 = !DILocation(line: 194, column: 12, scope: !1383)
!1391 = !DILocation(line: 195, column: 19, scope: !1384)
!1392 = !DILocation(line: 195, column: 11, scope: !1384)
!1393 = !DILocation(line: 195, column: 17, scope: !1384)
!1394 = !DILocation(line: 196, column: 8, scope: !1384)
!1395 = !DILocation(line: 197, column: 4, scope: !1365)
!1396 = distinct !DISubprogram(name: "next_line_num", scope: !2, file: !2, line: 132, type: !323, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1397 = !DILocalVariable(name: "endp", scope: !1396, file: !2, line: 134, type: !51)
!1398 = !DILocation(line: 134, column: 12, scope: !1396)
!1399 = !DILocation(line: 134, column: 19, scope: !1396)
!1400 = !DILocation(line: 135, column: 6, scope: !1396)
!1401 = !DILocation(line: 137, column: 16, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1403, file: !2, line: 137, column: 14)
!1403 = distinct !DILexicalBlock(scope: !1396, file: !2, line: 136, column: 8)
!1404 = !DILocation(line: 137, column: 21, scope: !1402)
!1405 = !DILocation(line: 137, column: 14, scope: !1402)
!1406 = !DILocation(line: 137, column: 24, scope: !1402)
!1407 = !DILocation(line: 137, column: 14, scope: !1403)
!1408 = !DILocation(line: 138, column: 12, scope: !1402)
!1409 = !DILocation(line: 139, column: 15, scope: !1403)
!1410 = !DILocation(line: 139, column: 18, scope: !1403)
!1411 = !DILocation(line: 140, column: 8, scope: !1403)
!1412 = !DILocation(line: 141, column: 13, scope: !1396)
!1413 = !DILocation(line: 141, column: 21, scope: !1396)
!1414 = !DILocation(line: 141, column: 18, scope: !1396)
!1415 = distinct !{!1415, !1400, !1416, !357}
!1416 = !DILocation(line: 141, column: 35, scope: !1396)
!1417 = !DILocation(line: 143, column: 10, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1396, file: !2, line: 143, column: 10)
!1419 = !DILocation(line: 143, column: 25, scope: !1418)
!1420 = !DILocation(line: 143, column: 10, scope: !1396)
!1421 = !DILocation(line: 144, column: 9, scope: !1418)
!1422 = !DILocation(line: 144, column: 26, scope: !1418)
!1423 = !DILocation(line: 144, column: 8, scope: !1418)
!1424 = !DILocation(line: 146, column: 18, scope: !1418)
!1425 = !DILocation(line: 147, column: 10, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1396, file: !2, line: 147, column: 10)
!1427 = !DILocation(line: 147, column: 27, scope: !1426)
!1428 = !DILocation(line: 147, column: 25, scope: !1426)
!1429 = !DILocation(line: 147, column: 10, scope: !1396)
!1430 = !DILocation(line: 148, column: 22, scope: !1426)
!1431 = !DILocation(line: 148, column: 8, scope: !1426)
!1432 = !DILocation(line: 149, column: 4, scope: !1396)
