; ModuleID = '/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/otherInputs/catCU/catOP.c'
source_filename = "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/otherInputs/catCU/catOP.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.option = type { ptr, i32, ptr, i32 }
%struct.infomap = type { ptr, ptr }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [39 x i8] c"Try '%s --help' for more information.\0A\00", align 1, !dbg !0
@program_name = external global ptr, align 8
@.str.1 = private unnamed_addr constant [39 x i8] c"   Usage: %s [OPTION]... [FILE]...\0A   \00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [47 x i8] c"   Concatenate FILE(s) to standard output.\0A   \00", align 1, !dbg !9
@stdout = external global ptr, align 8
@.str.3 = private unnamed_addr constant [359 x i8] c"   \0A     -A, --show-all           equivalent to -vET\0A     -b, --number-nonblank    number nonempty output lines, overrides -n\0A     -e                       equivalent to -vE\0A     -E, --show-ends          display $ at end of each line\0A     -n, --number             number all output lines\0A     -s, --squeeze-blank      suppress repeated empty output lines\0A   \00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [227 x i8] c"     -t                       equivalent to -vT\0A     -T, --show-tabs          display TAB characters as ^I\0A     -u                       (ignored)\0A     -v, --show-nonprinting   use ^ and M- notation, except for LFD and TAB\0A   \00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [48 x i8] c"      --help        display this help and exit\0A\00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [57 x i8] c"      --version     output version information and exit\0A\00", align 1, !dbg !29
@.str.7 = private unnamed_addr constant [152 x i8] c"   \0A   Examples:\0A     %s f - g  Output f's contents, then standard input, then g's contents.\0A     %s        Copy standard input to standard output.\0A   \00", align 1, !dbg !34
@.str.8 = private unnamed_addr constant [4 x i8] c"cat\00", align 1, !dbg !39
@main.long_options = internal constant [10 x %struct.option] [%struct.option { ptr @.str.9, i32 0, ptr null, i32 98 }, %struct.option { ptr @.str.10, i32 0, ptr null, i32 110 }, %struct.option { ptr @.str.11, i32 0, ptr null, i32 115 }, %struct.option { ptr @.str.12, i32 0, ptr null, i32 118 }, %struct.option { ptr @.str.13, i32 0, ptr null, i32 69 }, %struct.option { ptr @.str.14, i32 0, ptr null, i32 84 }, %struct.option { ptr @.str.15, i32 0, ptr null, i32 65 }, %struct.option { ptr @.str.16, i32 0, ptr null, i32 -130 }, %struct.option { ptr @.str.17, i32 0, ptr null, i32 -131 }, %struct.option zeroinitializer], align 16, !dbg !44
@.str.9 = private unnamed_addr constant [16 x i8] c"number-nonblank\00", align 1, !dbg !95
@.str.10 = private unnamed_addr constant [7 x i8] c"number\00", align 1, !dbg !100
@.str.11 = private unnamed_addr constant [14 x i8] c"squeeze-blank\00", align 1, !dbg !105
@.str.12 = private unnamed_addr constant [17 x i8] c"show-nonprinting\00", align 1, !dbg !110
@.str.13 = private unnamed_addr constant [10 x i8] c"show-ends\00", align 1, !dbg !115
@.str.14 = private unnamed_addr constant [10 x i8] c"show-tabs\00", align 1, !dbg !120
@.str.15 = private unnamed_addr constant [9 x i8] c"show-all\00", align 1, !dbg !122
@.str.16 = private unnamed_addr constant [5 x i8] c"help\00", align 1, !dbg !127
@.str.17 = private unnamed_addr constant [8 x i8] c"version\00", align 1, !dbg !132
@.str.18 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1, !dbg !137
@.str.19 = private unnamed_addr constant [10 x i8] c"coreutils\00", align 1, !dbg !142
@.str.20 = private unnamed_addr constant [24 x i8] c"/usr/local/share/locale\00", align 1, !dbg !144
@.str.21 = private unnamed_addr constant [11 x i8] c"benstuvAET\00", align 1, !dbg !149
@.str.22 = private unnamed_addr constant [14 x i8] c"GNU coreutils\00", align 1, !dbg !154
@Version = external global ptr, align 8
@.str.23 = private unnamed_addr constant [18 x i8] c"Torbjorn Granlund\00", align 1, !dbg !156
@.str.24 = private unnamed_addr constant [19 x i8] c"Torbj\C3\B6rn Granlund\00", align 1, !dbg !161
@.str.25 = private unnamed_addr constant [20 x i8] c"Richard M. Stallman\00", align 1, !dbg !166
@.str.26 = private unnamed_addr constant [16 x i8] c"standard output\00", align 1, !dbg !171
@.str.27 = private unnamed_addr constant [2 x i8] c"-\00", align 1, !dbg !173
@infile = internal global ptr null, align 8, !dbg !195
@optind = external global i32, align 4
@input_desc = internal global i32 0, align 4, !dbg !199
@.str.28 = private unnamed_addr constant [3 x i8] c"%s\00", align 1, !dbg !178
@.str.29 = private unnamed_addr constant [30 x i8] c"%s: input file is output file\00", align 1, !dbg !183
@pending_cr = internal global i8 0, align 1, !dbg !269
@.str.30 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1, !dbg !188
@.str.31 = private unnamed_addr constant [23 x i8] c"closing standard input\00", align 1, !dbg !190
@.str.32 = private unnamed_addr constant [56 x i8] c"\0AWith no FILE, or when FILE is -, read standard input.\0A\00", align 1, !dbg !201
@.str.33 = private unnamed_addr constant [2 x i8] c"[\00", align 1, !dbg !206
@.str.34 = private unnamed_addr constant [16 x i8] c"test invocation\00", align 1, !dbg !208
@.str.35 = private unnamed_addr constant [22 x i8] c"Multi-call invocation\00", align 1, !dbg !210
@.str.36 = private unnamed_addr constant [10 x i8] c"sha224sum\00", align 1, !dbg !215
@.str.37 = private unnamed_addr constant [15 x i8] c"sha2 utilities\00", align 1, !dbg !217
@.str.38 = private unnamed_addr constant [10 x i8] c"sha256sum\00", align 1, !dbg !222
@.str.39 = private unnamed_addr constant [10 x i8] c"sha384sum\00", align 1, !dbg !224
@.str.40 = private unnamed_addr constant [10 x i8] c"sha512sum\00", align 1, !dbg !226
@__const.emit_ancillary_info.infomap = private unnamed_addr constant [7 x %struct.infomap] [%struct.infomap { ptr @.str.33, ptr @.str.34 }, %struct.infomap { ptr @.str.19, ptr @.str.35 }, %struct.infomap { ptr @.str.36, ptr @.str.37 }, %struct.infomap { ptr @.str.38, ptr @.str.37 }, %struct.infomap { ptr @.str.39, ptr @.str.37 }, %struct.infomap { ptr @.str.40, ptr @.str.37 }, %struct.infomap zeroinitializer], align 16
@.str.41 = private unnamed_addr constant [4 x i8] c"en_\00", align 1, !dbg !228
@.str.42 = private unnamed_addr constant [71 x i8] c"Report any translation bugs to <https://translationproject.org/team/>\0A\00", align 1, !dbg !230
@.str.43 = private unnamed_addr constant [5 x i8] c"test\00", align 1, !dbg !235
@.str.44 = private unnamed_addr constant [27 x i8] c"Full documentation <%s%s>\0A\00", align 1, !dbg !237
@.str.45 = private unnamed_addr constant [40 x i8] c"https://www.gnu.org/software/coreutils/\00", align 1, !dbg !242
@.str.46 = private unnamed_addr constant [51 x i8] c"or available locally via: info '(coreutils) %s%s'\0A\00", align 1, !dbg !247
@.str.47 = private unnamed_addr constant [12 x i8] c" invocation\00", align 1, !dbg !252
@newlines2 = internal global i32 0, align 4, !dbg !259
@.str.48 = private unnamed_addr constant [22 x i8] c"cannot do ioctl on %s\00", align 1, !dbg !257
@line_num_print = internal global ptr getelementptr (i8, ptr @line_buf, i64 12), align 8, !dbg !267
@line_num_end = internal global ptr getelementptr (i8, ptr @line_buf, i64 17), align 8, !dbg !261
@line_num_start = internal global ptr getelementptr (i8, ptr @line_buf, i64 17), align 8, !dbg !263
@line_buf = internal global [20 x i8] c"                 0\09\00", align 16, !dbg !265
@.str.49 = private unnamed_addr constant [12 x i8] c"write error\00", align 1, !dbg !271

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local void @usage(i32 noundef %0) #0 !dbg !292 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !295, metadata !DIExpression()), !dbg !296
  %3 = load i32, ptr %2, align 4, !dbg !297
  %4 = icmp ne i32 %3, 0, !dbg !299
  br i1 %4, label %5, label %12, !dbg !300

5:                                                ; preds = %1
  br label %6, !dbg !301

6:                                                ; preds = %5
  %7 = load ptr, ptr @stderr, align 8, !dbg !302
  %8 = call ptr @gettext(ptr noundef @.str) #12, !dbg !302
  %9 = load ptr, ptr @program_name, align 8, !dbg !302
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef %8, ptr noundef %9), !dbg !302
  br label %11, !dbg !302

11:                                               ; preds = %6
  br label %35, !dbg !302

12:                                               ; preds = %1
  %13 = call ptr @gettext(ptr noundef @.str.1) #12, !dbg !304
  %14 = load ptr, ptr @program_name, align 8, !dbg !306
  %15 = call i32 (ptr, ...) @printf(ptr noundef %13, ptr noundef %14), !dbg !307
  %16 = call ptr @gettext(ptr noundef @.str.2) #12, !dbg !308
  %17 = load ptr, ptr @stdout, align 8, !dbg !308
  %18 = call i32 @fputs_unlocked(ptr noundef %16, ptr noundef %17), !dbg !308
  call void @emit_stdin_note(), !dbg !309
  %19 = call ptr @gettext(ptr noundef @.str.3) #12, !dbg !310
  %20 = load ptr, ptr @stdout, align 8, !dbg !310
  %21 = call i32 @fputs_unlocked(ptr noundef %19, ptr noundef %20), !dbg !310
  %22 = call ptr @gettext(ptr noundef @.str.4) #12, !dbg !311
  %23 = load ptr, ptr @stdout, align 8, !dbg !311
  %24 = call i32 @fputs_unlocked(ptr noundef %22, ptr noundef %23), !dbg !311
  %25 = call ptr @gettext(ptr noundef @.str.5) #12, !dbg !312
  %26 = load ptr, ptr @stdout, align 8, !dbg !312
  %27 = call i32 @fputs_unlocked(ptr noundef %25, ptr noundef %26), !dbg !312
  %28 = call ptr @gettext(ptr noundef @.str.6) #12, !dbg !313
  %29 = load ptr, ptr @stdout, align 8, !dbg !313
  %30 = call i32 @fputs_unlocked(ptr noundef %28, ptr noundef %29), !dbg !313
  %31 = call ptr @gettext(ptr noundef @.str.7) #12, !dbg !314
  %32 = load ptr, ptr @program_name, align 8, !dbg !315
  %33 = load ptr, ptr @program_name, align 8, !dbg !316
  %34 = call i32 (ptr, ...) @printf(ptr noundef %31, ptr noundef %32, ptr noundef %33), !dbg !317
  call void @emit_ancillary_info(ptr noundef @.str.8), !dbg !318
  br label %35

35:                                               ; preds = %12, %11
  %36 = load i32, ptr %2, align 4, !dbg !319
  call void @exit(i32 noundef %36) #13, !dbg !320
  unreachable, !dbg !320
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: nounwind
declare ptr @gettext(ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #2

declare i32 @fputs_unlocked(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define internal void @emit_stdin_note() #4 !dbg !321 {
  %1 = call ptr @gettext(ptr noundef @.str.32) #12, !dbg !324
  %2 = load ptr, ptr @stdout, align 8, !dbg !324
  %3 = call i32 @fputs_unlocked(ptr noundef %1, ptr noundef %2), !dbg !324
  ret void, !dbg !325
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_ancillary_info(ptr noundef %0) #4 !dbg !326 {
  %2 = alloca ptr, align 8
  %3 = alloca [7 x %struct.infomap], align 16
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !329, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata ptr %3, metadata !331, metadata !DIExpression()), !dbg !338
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.emit_ancillary_info.infomap, i64 112, i1 false), !dbg !338
  call void @llvm.dbg.declare(metadata ptr %4, metadata !339, metadata !DIExpression()), !dbg !340
  %8 = load ptr, ptr %2, align 8, !dbg !341
  store ptr %8, ptr %4, align 8, !dbg !340
  call void @llvm.dbg.declare(metadata ptr %5, metadata !342, metadata !DIExpression()), !dbg !344
  %9 = getelementptr inbounds [7 x %struct.infomap], ptr %3, i64 0, i64 0, !dbg !345
  store ptr %9, ptr %5, align 8, !dbg !344
  br label %10, !dbg !346

10:                                               ; preds = %25, %1
  %11 = load ptr, ptr %5, align 8, !dbg !347
  %12 = getelementptr inbounds %struct.infomap, ptr %11, i32 0, i32 0, !dbg !348
  %13 = load ptr, ptr %12, align 8, !dbg !348
  %14 = icmp ne ptr %13, null, !dbg !347
  br i1 %14, label %15, label %23, !dbg !349

15:                                               ; preds = %10
  %16 = load ptr, ptr %2, align 8, !dbg !350
  %17 = load ptr, ptr %5, align 8, !dbg !350
  %18 = getelementptr inbounds %struct.infomap, ptr %17, i32 0, i32 0, !dbg !350
  %19 = load ptr, ptr %18, align 8, !dbg !350
  %20 = call i32 @strcmp(ptr noundef %16, ptr noundef %19) #14, !dbg !350
  %21 = icmp eq i32 %20, 0, !dbg !350
  %22 = xor i1 %21, true, !dbg !351
  br label %23

23:                                               ; preds = %15, %10
  %24 = phi i1 [ false, %10 ], [ %22, %15 ], !dbg !352
  br i1 %24, label %25, label %28, !dbg !346

25:                                               ; preds = %23
  %26 = load ptr, ptr %5, align 8, !dbg !353
  %27 = getelementptr inbounds %struct.infomap, ptr %26, i32 1, !dbg !353
  store ptr %27, ptr %5, align 8, !dbg !353
  br label %10, !dbg !346, !llvm.loop !354

28:                                               ; preds = %23
  %29 = load ptr, ptr %5, align 8, !dbg !356
  %30 = getelementptr inbounds %struct.infomap, ptr %29, i32 0, i32 1, !dbg !358
  %31 = load ptr, ptr %30, align 8, !dbg !358
  %32 = icmp ne ptr %31, null, !dbg !356
  br i1 %32, label %33, label %37, !dbg !359

33:                                               ; preds = %28
  %34 = load ptr, ptr %5, align 8, !dbg !360
  %35 = getelementptr inbounds %struct.infomap, ptr %34, i32 0, i32 1, !dbg !361
  %36 = load ptr, ptr %35, align 8, !dbg !361
  store ptr %36, ptr %4, align 8, !dbg !362
  br label %37, !dbg !363

37:                                               ; preds = %33, %28
  call void @emit_bug_reporting_address(), !dbg !364
  call void @llvm.dbg.declare(metadata ptr %6, metadata !365, metadata !DIExpression()), !dbg !366
  %38 = call ptr @setlocale(i32 noundef 5, ptr noundef null) #12, !dbg !367
  store ptr %38, ptr %6, align 8, !dbg !366
  %39 = load ptr, ptr %6, align 8, !dbg !368
  %40 = icmp ne ptr %39, null, !dbg !368
  br i1 %40, label %41, label %49, !dbg !370

41:                                               ; preds = %37
  %42 = load ptr, ptr %6, align 8, !dbg !371
  %43 = call i32 @strncmp(ptr noundef %42, ptr noundef @.str.41, i64 noundef 3) #14, !dbg !371
  %44 = icmp ne i32 %43, 0, !dbg !371
  br i1 %44, label %45, label %49, !dbg !372

45:                                               ; preds = %41
  %46 = call ptr @gettext(ptr noundef @.str.42) #12, !dbg !373
  %47 = load ptr, ptr @stdout, align 8, !dbg !373
  %48 = call i32 @fputs_unlocked(ptr noundef %46, ptr noundef %47), !dbg !373
  br label %49, !dbg !375

49:                                               ; preds = %45, %41, %37
  call void @llvm.dbg.declare(metadata ptr %7, metadata !376, metadata !DIExpression()), !dbg !377
  %50 = load ptr, ptr %2, align 8, !dbg !378
  %51 = call i32 @strcmp(ptr noundef %50, ptr noundef @.str.33) #14, !dbg !378
  %52 = icmp eq i32 %51, 0, !dbg !378
  br i1 %52, label %53, label %54, !dbg !378

53:                                               ; preds = %49
  br label %56, !dbg !378

54:                                               ; preds = %49
  %55 = load ptr, ptr %2, align 8, !dbg !379
  br label %56, !dbg !378

56:                                               ; preds = %54, %53
  %57 = phi ptr [ @.str.43, %53 ], [ %55, %54 ], !dbg !378
  store ptr %57, ptr %7, align 8, !dbg !377
  %58 = call ptr @gettext(ptr noundef @.str.44) #12, !dbg !380
  %59 = load ptr, ptr %7, align 8, !dbg !381
  %60 = call i32 (ptr, ...) @printf(ptr noundef %58, ptr noundef @.str.45, ptr noundef %59), !dbg !382
  %61 = call ptr @gettext(ptr noundef @.str.46) #12, !dbg !383
  %62 = load ptr, ptr %4, align 8, !dbg !384
  %63 = load ptr, ptr %4, align 8, !dbg !385
  %64 = load ptr, ptr %2, align 8, !dbg !386
  %65 = icmp eq ptr %63, %64, !dbg !387
  %66 = zext i1 %65 to i64, !dbg !385
  %67 = select i1 %65, ptr @.str.47, ptr @.str.18, !dbg !385
  %68 = call i32 (ptr, ...) @printf(ptr noundef %61, ptr noundef %62, ptr noundef %67), !dbg !388
  ret void, !dbg !389
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #4 !dbg !46 {
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
  %17 = alloca i64, align 8
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !390, metadata !DIExpression()), !dbg !391
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !392, metadata !DIExpression()), !dbg !393
  call void @llvm.dbg.declare(metadata ptr %6, metadata !394, metadata !DIExpression()), !dbg !395
  store i8 0, ptr %6, align 1, !dbg !395
  call void @llvm.dbg.declare(metadata ptr %7, metadata !396, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata ptr %8, metadata !435, metadata !DIExpression()), !dbg !436
  store i8 0, ptr %8, align 1, !dbg !436
  call void @llvm.dbg.declare(metadata ptr %9, metadata !437, metadata !DIExpression()), !dbg !438
  store i8 0, ptr %9, align 1, !dbg !438
  call void @llvm.dbg.declare(metadata ptr %10, metadata !439, metadata !DIExpression()), !dbg !440
  store i8 0, ptr %10, align 1, !dbg !440
  call void @llvm.dbg.declare(metadata ptr %11, metadata !441, metadata !DIExpression()), !dbg !442
  store i8 0, ptr %11, align 1, !dbg !442
  call void @llvm.dbg.declare(metadata ptr %12, metadata !443, metadata !DIExpression()), !dbg !444
  store i8 0, ptr %12, align 1, !dbg !444
  call void @llvm.dbg.declare(metadata ptr %13, metadata !445, metadata !DIExpression()), !dbg !446
  store i8 0, ptr %13, align 1, !dbg !446
  call void @llvm.dbg.declare(metadata ptr %14, metadata !447, metadata !DIExpression()), !dbg !448
  store i32 0, ptr %14, align 4, !dbg !448
  %33 = load ptr, ptr %5, align 8, !dbg !449
  %34 = getelementptr inbounds ptr, ptr %33, i64 0, !dbg !449
  %35 = load ptr, ptr %34, align 8, !dbg !449
  call void @set_program_name(ptr noundef %35), !dbg !450
  %36 = call ptr @setlocale(i32 noundef 6, ptr noundef @.str.18) #12, !dbg !451
  %37 = call ptr @bindtextdomain(ptr noundef @.str.19, ptr noundef @.str.20) #12, !dbg !452
  %38 = call ptr @textdomain(ptr noundef @.str.19) #12, !dbg !453
  %39 = call i32 @atexit(ptr noundef @close_stdout) #12, !dbg !454
  call void @llvm.dbg.declare(metadata ptr %15, metadata !455, metadata !DIExpression()), !dbg !456
  br label %40, !dbg !457

40:                                               ; preds = %64, %2
  %41 = load i32, ptr %4, align 4, !dbg !458
  %42 = load ptr, ptr %5, align 8, !dbg !459
  %43 = call i32 @getopt_long(i32 noundef %41, ptr noundef %42, ptr noundef @.str.21, ptr noundef @main.long_options, ptr noundef null) #12, !dbg !460
  store i32 %43, ptr %15, align 4, !dbg !461
  %44 = icmp ne i32 %43, -1, !dbg !462
  br i1 %44, label %45, label %65, !dbg !457

45:                                               ; preds = %40
  %46 = load i32, ptr %15, align 4, !dbg !463
  switch i32 %46, label %63 [
    i32 98, label %47
    i32 101, label %48
    i32 110, label %49
    i32 115, label %50
    i32 116, label %51
    i32 117, label %52
    i32 118, label %53
    i32 65, label %54
    i32 69, label %55
    i32 84, label %56
    i32 -130, label %57
    i32 -131, label %58
  ], !dbg !465

47:                                               ; preds = %45
  store i8 1, ptr %8, align 1, !dbg !466
  store i8 1, ptr %9, align 1, !dbg !468
  br label %64, !dbg !469

48:                                               ; preds = %45
  store i8 1, ptr %11, align 1, !dbg !470
  store i8 1, ptr %12, align 1, !dbg !471
  br label %64, !dbg !472

49:                                               ; preds = %45
  store i8 1, ptr %8, align 1, !dbg !473
  br label %64, !dbg !474

50:                                               ; preds = %45
  store i8 1, ptr %10, align 1, !dbg !475
  br label %64, !dbg !476

51:                                               ; preds = %45
  store i8 1, ptr %13, align 1, !dbg !477
  store i8 1, ptr %12, align 1, !dbg !478
  br label %64, !dbg !479

52:                                               ; preds = %45
  br label %64, !dbg !480

53:                                               ; preds = %45
  store i8 1, ptr %12, align 1, !dbg !481
  br label %64, !dbg !482

54:                                               ; preds = %45
  store i8 1, ptr %12, align 1, !dbg !483
  store i8 1, ptr %11, align 1, !dbg !484
  store i8 1, ptr %13, align 1, !dbg !485
  br label %64, !dbg !486

55:                                               ; preds = %45
  store i8 1, ptr %11, align 1, !dbg !487
  br label %64, !dbg !488

56:                                               ; preds = %45
  store i8 1, ptr %13, align 1, !dbg !489
  br label %64, !dbg !490

57:                                               ; preds = %45
  call void @usage(i32 noundef 0) #15, !dbg !491
  unreachable, !dbg !491

58:                                               ; preds = %45
  %59 = load ptr, ptr @stdout, align 8, !dbg !492
  %60 = load ptr, ptr @Version, align 8, !dbg !492
  %61 = call ptr @proper_name_lite(ptr noundef @.str.23, ptr noundef @.str.24), !dbg !492
  %62 = call ptr @proper_name_lite(ptr noundef @.str.25, ptr noundef @.str.25), !dbg !492
  call void (ptr, ptr, ptr, ptr, ...) @version_etc(ptr noundef %59, ptr noundef @.str.8, ptr noundef @.str.22, ptr noundef %60, ptr noundef %61, ptr noundef %62, ptr noundef null), !dbg !492
  call void @exit(i32 noundef 0) #13, !dbg !492
  unreachable, !dbg !492

63:                                               ; preds = %45
  call void @usage(i32 noundef 1) #15, !dbg !493
  unreachable, !dbg !493

64:                                               ; preds = %56, %55, %54, %53, %52, %51, %50, %49, %48, %47
  br label %40, !dbg !457, !llvm.loop !494

65:                                               ; preds = %40
  %66 = call i32 @fstat(i32 noundef 1, ptr noundef %7) #12, !dbg !496
  %67 = icmp slt i32 %66, 0, !dbg !498
  br i1 %67, label %68, label %72, !dbg !499

68:                                               ; preds = %65
  %69 = call ptr @__errno_location() #16, !dbg !500
  %70 = load i32, ptr %69, align 4, !dbg !500
  %71 = call ptr @gettext(ptr noundef @.str.26) #12, !dbg !500
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %70, ptr noundef %71) #17, !dbg !500
  unreachable, !dbg !500

72:                                               ; preds = %65
  call void @llvm.dbg.declare(metadata ptr %16, metadata !501, metadata !DIExpression()), !dbg !506
  %73 = call i64 @io_blksize(ptr noundef %7), !dbg !507
  store i64 %73, ptr %16, align 8, !dbg !506
  call void @llvm.dbg.declare(metadata ptr %17, metadata !508, metadata !DIExpression()), !dbg !511
  call void @llvm.dbg.declare(metadata ptr %18, metadata !512, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.declare(metadata ptr %19, metadata !515, metadata !DIExpression()), !dbg !516
  store i32 -2, ptr %19, align 4, !dbg !516
  call void @llvm.dbg.declare(metadata ptr %20, metadata !517, metadata !DIExpression()), !dbg !518
  %74 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !519
  %75 = load i32, ptr %74, align 8, !dbg !519
  %76 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !519
  %77 = load i32, ptr %76, align 8, !dbg !519
  %78 = sub i32 %75, %77, !dbg !519
  %79 = icmp ne i32 %78, 0, !dbg !519
  br i1 %79, label %81, label %80, !dbg !520

80:                                               ; preds = %72
  br label %81, !dbg !520

81:                                               ; preds = %80, %72
  %82 = phi i1 [ true, %72 ], [ false, %80 ]
  %83 = xor i1 %82, true, !dbg !521
  %84 = zext i1 %83 to i8, !dbg !518
  store i8 %84, ptr %20, align 1, !dbg !518
  %85 = load i8, ptr %20, align 1, !dbg !522
  %86 = trunc i8 %85 to i1, !dbg !522
  br i1 %86, label %87, label %92, !dbg !524

87:                                               ; preds = %81
  %88 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 0, !dbg !525
  %89 = load i64, ptr %88, align 8, !dbg !525
  store i64 %89, ptr %17, align 8, !dbg !527
  %90 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !528
  %91 = load i64, ptr %90, align 8, !dbg !528
  store i64 %91, ptr %18, align 8, !dbg !529
  br label %92, !dbg !530

92:                                               ; preds = %87, %81
  call void @llvm.dbg.declare(metadata ptr %21, metadata !531, metadata !DIExpression()), !dbg !532
  %93 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !533
  %94 = load i32, ptr %93, align 8, !dbg !533
  %95 = and i32 %94, 61440, !dbg !533
  %96 = icmp eq i32 %95, 32768, !dbg !533
  %97 = zext i1 %96 to i32, !dbg !533
  %98 = icmp ne i32 %97, 0, !dbg !534
  %99 = zext i1 %98 to i8, !dbg !532
  store i8 %99, ptr %21, align 1, !dbg !532
  %100 = load i8, ptr %8, align 1, !dbg !535
  %101 = trunc i8 %100 to i1, !dbg !535
  br i1 %101, label %111, label %102, !dbg !537

102:                                              ; preds = %92
  %103 = load i8, ptr %11, align 1, !dbg !538
  %104 = trunc i8 %103 to i1, !dbg !538
  br i1 %104, label %111, label %105, !dbg !539

105:                                              ; preds = %102
  %106 = load i8, ptr %10, align 1, !dbg !540
  %107 = trunc i8 %106 to i1, !dbg !540
  br i1 %107, label %111, label %108, !dbg !541

108:                                              ; preds = %105
  %109 = load i32, ptr %14, align 4, !dbg !542
  %110 = or i32 %109, 0, !dbg !542
  store i32 %110, ptr %14, align 4, !dbg !542
  call void @xset_binary_mode(i32 noundef 1, i32 noundef 0), !dbg !544
  br label %111, !dbg !545

111:                                              ; preds = %108, %105, %102, %92
  store ptr @.str.27, ptr @infile, align 8, !dbg !546
  call void @llvm.dbg.declare(metadata ptr %22, metadata !547, metadata !DIExpression()), !dbg !548
  %112 = load i32, ptr @optind, align 4, !dbg !549
  store i32 %112, ptr %22, align 4, !dbg !548
  call void @llvm.dbg.declare(metadata ptr %23, metadata !550, metadata !DIExpression()), !dbg !551
  store i8 1, ptr %23, align 1, !dbg !551
  call void @llvm.dbg.declare(metadata ptr %24, metadata !552, metadata !DIExpression()), !dbg !553
  %113 = call i32 @getpagesize() #16, !dbg !554
  %114 = sext i32 %113 to i64, !dbg !554
  store i64 %114, ptr %24, align 8, !dbg !553
  br label %115, !dbg !555

115:                                              ; preds = %351, %111
  %116 = load i32, ptr %22, align 4, !dbg !556
  %117 = load i32, ptr %4, align 4, !dbg !559
  %118 = icmp slt i32 %116, %117, !dbg !560
  br i1 %118, label %119, label %125, !dbg !561

119:                                              ; preds = %115
  %120 = load ptr, ptr %5, align 8, !dbg !562
  %121 = load i32, ptr %22, align 4, !dbg !563
  %122 = sext i32 %121 to i64, !dbg !562
  %123 = getelementptr inbounds ptr, ptr %120, i64 %122, !dbg !562
  %124 = load ptr, ptr %123, align 8, !dbg !562
  store ptr %124, ptr @infile, align 8, !dbg !564
  br label %125, !dbg !565

125:                                              ; preds = %119, %115
  call void @llvm.dbg.declare(metadata ptr %25, metadata !566, metadata !DIExpression()), !dbg !567
  %126 = load ptr, ptr @infile, align 8, !dbg !568
  %127 = call i32 @strcmp(ptr noundef %126, ptr noundef @.str.27) #14, !dbg !568
  %128 = icmp eq i32 %127, 0, !dbg !568
  %129 = zext i1 %128 to i8, !dbg !567
  store i8 %129, ptr %25, align 1, !dbg !567
  %130 = load i8, ptr %25, align 1, !dbg !569
  %131 = trunc i8 %130 to i1, !dbg !569
  br i1 %131, label %132, label %138, !dbg !571

132:                                              ; preds = %125
  store i8 1, ptr %6, align 1, !dbg !572
  store i32 0, ptr @input_desc, align 4, !dbg !574
  %133 = load i32, ptr %14, align 4, !dbg !575
  %134 = and i32 %133, 0, !dbg !577
  %135 = icmp ne i32 %134, 0, !dbg !577
  br i1 %135, label %136, label %137, !dbg !578

136:                                              ; preds = %132
  call void @xset_binary_mode(i32 noundef 0, i32 noundef 0), !dbg !579
  br label %137, !dbg !579

137:                                              ; preds = %136, %132
  br label %150, !dbg !580

138:                                              ; preds = %125
  %139 = load ptr, ptr @infile, align 8, !dbg !581
  %140 = load i32, ptr %14, align 4, !dbg !583
  %141 = call i32 (ptr, i32, ...) @open(ptr noundef %139, i32 noundef %140), !dbg !584
  store i32 %141, ptr @input_desc, align 4, !dbg !585
  %142 = load i32, ptr @input_desc, align 4, !dbg !586
  %143 = icmp slt i32 %142, 0, !dbg !588
  br i1 %143, label %144, label %149, !dbg !589

144:                                              ; preds = %138
  %145 = call ptr @__errno_location() #16, !dbg !590
  %146 = load i32, ptr %145, align 4, !dbg !590
  %147 = load ptr, ptr @infile, align 8, !dbg !590
  %148 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %147), !dbg !590
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %146, ptr noundef @.str.28, ptr noundef %148) #17, !dbg !590
  store i8 0, ptr %23, align 1, !dbg !592
  br label %351, !dbg !593

149:                                              ; preds = %138
  br label %150

150:                                              ; preds = %149, %137
  %151 = load i32, ptr @input_desc, align 4, !dbg !594
  %152 = call i32 @fstat(i32 noundef %151, ptr noundef %7) #12, !dbg !596
  %153 = icmp slt i32 %152, 0, !dbg !597
  br i1 %153, label %154, label %159, !dbg !598

154:                                              ; preds = %150
  %155 = call ptr @__errno_location() #16, !dbg !599
  %156 = load i32, ptr %155, align 4, !dbg !599
  %157 = load ptr, ptr @infile, align 8, !dbg !599
  %158 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %157), !dbg !599
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %156, ptr noundef @.str.28, ptr noundef %158) #17, !dbg !599
  store i8 0, ptr %23, align 1, !dbg !601
  br label %338, !dbg !602

159:                                              ; preds = %150
  call void @llvm.dbg.declare(metadata ptr %26, metadata !603, metadata !DIExpression()), !dbg !604
  %160 = call i64 @io_blksize(ptr noundef %7), !dbg !605
  store i64 %160, ptr %26, align 8, !dbg !604
  %161 = load i32, ptr @input_desc, align 4, !dbg !606
  call void @fdadvise(i32 noundef %161, i64 noundef 0, i64 noundef 0, i32 noundef 2), !dbg !607
  %162 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !608
  %163 = load i32, ptr %162, align 8, !dbg !608
  %164 = and i32 %163, 61440, !dbg !608
  %165 = icmp eq i32 %164, 4096, !dbg !608
  br i1 %165, label %222, label %166, !dbg !610

166:                                              ; preds = %159
  %167 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !611
  %168 = load i32, ptr %167, align 8, !dbg !611
  %169 = and i32 %168, 61440, !dbg !611
  %170 = icmp eq i32 %169, 49152, !dbg !611
  br i1 %170, label %222, label %171, !dbg !612

171:                                              ; preds = %166
  %172 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !613
  %173 = load i32, ptr %172, align 8, !dbg !613
  %174 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !613
  %175 = load i32, ptr %174, align 8, !dbg !613
  %176 = sub i32 %173, %175, !dbg !613
  %177 = icmp ne i32 %176, 0, !dbg !613
  br i1 %177, label %222, label %178, !dbg !614

178:                                              ; preds = %171
  %179 = load i8, ptr %20, align 1, !dbg !615
  %180 = trunc i8 %179 to i1, !dbg !615
  br i1 %180, label %181, label %222, !dbg !616

181:                                              ; preds = %178
  %182 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 0, !dbg !617
  %183 = load i64, ptr %182, align 8, !dbg !617
  %184 = load i64, ptr %17, align 8, !dbg !618
  %185 = icmp eq i64 %183, %184, !dbg !619
  br i1 %185, label %186, label %222, !dbg !620

186:                                              ; preds = %181
  %187 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !621
  %188 = load i64, ptr %187, align 8, !dbg !621
  %189 = load i64, ptr %18, align 8, !dbg !622
  %190 = icmp eq i64 %188, %189, !dbg !623
  br i1 %190, label %191, label %222, !dbg !624

191:                                              ; preds = %186
  call void @llvm.dbg.declare(metadata ptr %27, metadata !625, metadata !DIExpression()), !dbg !629
  %192 = load i32, ptr @input_desc, align 4, !dbg !630
  %193 = call i64 @lseek(i32 noundef %192, i64 noundef 0, i32 noundef 1) #12, !dbg !631
  store i64 %193, ptr %27, align 8, !dbg !629
  %194 = load i64, ptr %27, align 8, !dbg !632
  %195 = icmp sle i64 0, %194, !dbg !634
  br i1 %195, label %196, label %221, !dbg !635

196:                                              ; preds = %191
  %197 = load i32, ptr %19, align 4, !dbg !636
  %198 = icmp slt i32 %197, -1, !dbg !639
  br i1 %198, label %199, label %201, !dbg !640

199:                                              ; preds = %196
  %200 = call i32 (i32, i32, ...) @rpl_fcntl(i32 noundef 1, i32 noundef 3), !dbg !641
  store i32 %200, ptr %19, align 4, !dbg !642
  br label %201, !dbg !643

201:                                              ; preds = %199, %196
  call void @llvm.dbg.declare(metadata ptr %28, metadata !644, metadata !DIExpression()), !dbg !645
  %202 = load i32, ptr %19, align 4, !dbg !646
  %203 = icmp sle i32 0, %202, !dbg !647
  br i1 %203, label %204, label %208, !dbg !648

204:                                              ; preds = %201
  %205 = load i32, ptr %19, align 4, !dbg !649
  %206 = and i32 %205, 1024, !dbg !650
  %207 = icmp ne i32 %206, 0, !dbg !648
  br label %208

208:                                              ; preds = %204, %201
  %209 = phi i1 [ false, %201 ], [ %207, %204 ], !dbg !651
  %210 = zext i1 %209 to i64, !dbg !652
  %211 = select i1 %209, i32 2, i32 1, !dbg !652
  store i32 %211, ptr %28, align 4, !dbg !645
  %212 = load i64, ptr %27, align 8, !dbg !653
  %213 = load i32, ptr %28, align 4, !dbg !655
  %214 = call i64 @lseek(i32 noundef 1, i64 noundef 0, i32 noundef %213) #12, !dbg !656
  %215 = icmp slt i64 %212, %214, !dbg !657
  br i1 %215, label %216, label %220, !dbg !658

216:                                              ; preds = %208
  %217 = call ptr @gettext(ptr noundef @.str.29) #12, !dbg !659
  %218 = load ptr, ptr @infile, align 8, !dbg !659
  %219 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %218), !dbg !659
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef 0, ptr noundef %217, ptr noundef %219) #17, !dbg !659
  store i8 0, ptr %23, align 1, !dbg !661
  br label %338, !dbg !662

220:                                              ; preds = %208
  br label %221, !dbg !663

221:                                              ; preds = %220, %191
  br label %222, !dbg !664

222:                                              ; preds = %221, %186, %181, %178, %171, %166, %159
  call void @llvm.dbg.declare(metadata ptr %29, metadata !665, metadata !DIExpression()), !dbg !666
  %223 = load i8, ptr %8, align 1, !dbg !667
  %224 = trunc i8 %223 to i1, !dbg !667
  br i1 %224, label %286, label %225, !dbg !669

225:                                              ; preds = %222
  %226 = load i8, ptr %11, align 1, !dbg !670
  %227 = trunc i8 %226 to i1, !dbg !670
  br i1 %227, label %286, label %228, !dbg !671

228:                                              ; preds = %225
  %229 = load i8, ptr %12, align 1, !dbg !672
  %230 = trunc i8 %229 to i1, !dbg !672
  br i1 %230, label %286, label %231, !dbg !673

231:                                              ; preds = %228
  %232 = load i8, ptr %13, align 1, !dbg !674
  %233 = trunc i8 %232 to i1, !dbg !674
  br i1 %233, label %286, label %234, !dbg !675

234:                                              ; preds = %231
  %235 = load i8, ptr %10, align 1, !dbg !676
  %236 = trunc i8 %235 to i1, !dbg !676
  br i1 %236, label %286, label %237, !dbg !677

237:                                              ; preds = %234
  call void @llvm.dbg.declare(metadata ptr %30, metadata !678, metadata !DIExpression()), !dbg !680
  %238 = load i8, ptr %21, align 1, !dbg !681
  %239 = trunc i8 %238 to i1, !dbg !681
  br i1 %239, label %240, label %247, !dbg !682

240:                                              ; preds = %237
  %241 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !683
  %242 = load i32, ptr %241, align 8, !dbg !683
  %243 = and i32 %242, 61440, !dbg !683
  %244 = icmp eq i32 %243, 32768, !dbg !683
  br i1 %244, label %245, label %247, !dbg !681

245:                                              ; preds = %240
  %246 = call i32 @copy_cat(), !dbg !684
  br label %248, !dbg !681

247:                                              ; preds = %240, %237
  br label %248, !dbg !681

248:                                              ; preds = %247, %245
  %249 = phi i32 [ %246, %245 ], [ 0, %247 ], !dbg !681
  store i32 %249, ptr %30, align 4, !dbg !680
  %250 = load i32, ptr %30, align 4, !dbg !685
  %251 = icmp ne i32 %250, 0, !dbg !687
  br i1 %251, label %252, label %262, !dbg !688

252:                                              ; preds = %248
  store ptr null, ptr %29, align 8, !dbg !689
  %253 = load i32, ptr %30, align 4, !dbg !691
  %254 = icmp slt i32 0, %253, !dbg !692
  %255 = zext i1 %254 to i32, !dbg !692
  %256 = load i8, ptr %23, align 1, !dbg !693
  %257 = trunc i8 %256 to i1, !dbg !693
  %258 = zext i1 %257 to i32, !dbg !693
  %259 = and i32 %258, %255, !dbg !693
  %260 = icmp ne i32 %259, 0, !dbg !693
  %261 = zext i1 %260 to i8, !dbg !693
  store i8 %261, ptr %23, align 1, !dbg !693
  br label %285, !dbg !694

262:                                              ; preds = %248
  %263 = load i64, ptr %26, align 8, !dbg !695
  %264 = load i64, ptr %16, align 8, !dbg !695
  %265 = icmp sgt i64 %263, %264, !dbg !695
  br i1 %265, label %266, label %268, !dbg !695

266:                                              ; preds = %262
  %267 = load i64, ptr %26, align 8, !dbg !695
  br label %270, !dbg !695

268:                                              ; preds = %262
  %269 = load i64, ptr %16, align 8, !dbg !695
  br label %270, !dbg !695

270:                                              ; preds = %268, %266
  %271 = phi i64 [ %267, %266 ], [ %269, %268 ], !dbg !695
  store i64 %271, ptr %26, align 8, !dbg !697
  %272 = load i64, ptr %24, align 8, !dbg !698
  %273 = load i64, ptr %26, align 8, !dbg !699
  %274 = call noalias nonnull ptr @xalignalloc(i64 noundef %272, i64 noundef %273) #18, !dbg !700
  store ptr %274, ptr %29, align 8, !dbg !701
  %275 = load ptr, ptr %29, align 8, !dbg !702
  %276 = load i64, ptr %26, align 8, !dbg !703
  %277 = call zeroext i1 @simple_cat(ptr noundef %275, i64 noundef %276), !dbg !704
  %278 = zext i1 %277 to i32, !dbg !704
  %279 = load i8, ptr %23, align 1, !dbg !705
  %280 = trunc i8 %279 to i1, !dbg !705
  %281 = zext i1 %280 to i32, !dbg !705
  %282 = and i32 %281, %278, !dbg !705
  %283 = icmp ne i32 %282, 0, !dbg !705
  %284 = zext i1 %283 to i8, !dbg !705
  store i8 %284, ptr %23, align 1, !dbg !705
  br label %285

285:                                              ; preds = %270, %252
  br label %336, !dbg !706

286:                                              ; preds = %234, %231, %228, %225, %222
  %287 = load i64, ptr %24, align 8, !dbg !707
  %288 = load i64, ptr %26, align 8, !dbg !709
  %289 = add nsw i64 %288, 1, !dbg !710
  %290 = call noalias nonnull ptr @xalignalloc(i64 noundef %287, i64 noundef %289) #18, !dbg !711
  store ptr %290, ptr %29, align 8, !dbg !712
  call void @llvm.dbg.declare(metadata ptr %31, metadata !713, metadata !DIExpression()), !dbg !714
  %291 = load i64, ptr %26, align 8, !dbg !715
  %292 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %291, i64 4), !dbg !715
  %293 = extractvalue { i64, i1 } %292, 1, !dbg !715
  %294 = extractvalue { i64, i1 } %292, 0, !dbg !715
  store i64 %294, ptr %31, align 8, !dbg !715
  br i1 %293, label %306, label %295, !dbg !717

295:                                              ; preds = %286
  %296 = load i64, ptr %31, align 8, !dbg !718
  %297 = load i64, ptr %16, align 8, !dbg !718
  %298 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %296, i64 %297), !dbg !718
  %299 = extractvalue { i64, i1 } %298, 1, !dbg !718
  %300 = extractvalue { i64, i1 } %298, 0, !dbg !718
  store i64 %300, ptr %31, align 8, !dbg !718
  br i1 %299, label %306, label %301, !dbg !719

301:                                              ; preds = %295
  %302 = load i64, ptr %31, align 8, !dbg !720
  %303 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %302, i64 19), !dbg !720
  %304 = extractvalue { i64, i1 } %303, 1, !dbg !720
  %305 = extractvalue { i64, i1 } %303, 0, !dbg !720
  store i64 %305, ptr %31, align 8, !dbg !720
  br i1 %304, label %306, label %307, !dbg !721

306:                                              ; preds = %301, %295, %286
  call void @xalloc_die() #15, !dbg !722
  unreachable, !dbg !722

307:                                              ; preds = %301
  call void @llvm.dbg.declare(metadata ptr %32, metadata !723, metadata !DIExpression()), !dbg !724
  %308 = load i64, ptr %24, align 8, !dbg !725
  %309 = load i64, ptr %31, align 8, !dbg !726
  %310 = call noalias nonnull ptr @xalignalloc(i64 noundef %308, i64 noundef %309) #18, !dbg !727
  store ptr %310, ptr %32, align 8, !dbg !724
  %311 = load ptr, ptr %29, align 8, !dbg !728
  %312 = load i64, ptr %26, align 8, !dbg !729
  %313 = load ptr, ptr %32, align 8, !dbg !730
  %314 = load i64, ptr %16, align 8, !dbg !731
  %315 = load i8, ptr %12, align 1, !dbg !732
  %316 = trunc i8 %315 to i1, !dbg !732
  %317 = load i8, ptr %13, align 1, !dbg !733
  %318 = trunc i8 %317 to i1, !dbg !733
  %319 = load i8, ptr %8, align 1, !dbg !734
  %320 = trunc i8 %319 to i1, !dbg !734
  %321 = load i8, ptr %9, align 1, !dbg !735
  %322 = trunc i8 %321 to i1, !dbg !735
  %323 = load i8, ptr %11, align 1, !dbg !736
  %324 = trunc i8 %323 to i1, !dbg !736
  %325 = load i8, ptr %10, align 1, !dbg !737
  %326 = trunc i8 %325 to i1, !dbg !737
  %327 = call zeroext i1 @cat(ptr noundef %311, i64 noundef %312, ptr noundef %313, i64 noundef %314, i1 noundef zeroext %316, i1 noundef zeroext %318, i1 noundef zeroext %320, i1 noundef zeroext %322, i1 noundef zeroext %324, i1 noundef zeroext %326), !dbg !738
  %328 = zext i1 %327 to i32, !dbg !738
  %329 = load i8, ptr %23, align 1, !dbg !739
  %330 = trunc i8 %329 to i1, !dbg !739
  %331 = zext i1 %330 to i32, !dbg !739
  %332 = and i32 %331, %328, !dbg !739
  %333 = icmp ne i32 %332, 0, !dbg !739
  %334 = zext i1 %333 to i8, !dbg !739
  store i8 %334, ptr %23, align 1, !dbg !739
  %335 = load ptr, ptr %32, align 8, !dbg !740
  call void @alignfree(ptr noundef %335), !dbg !741
  br label %336

336:                                              ; preds = %307, %285
  %337 = load ptr, ptr %29, align 8, !dbg !742
  call void @alignfree(ptr noundef %337), !dbg !743
  br label %338, !dbg !743

338:                                              ; preds = %336, %216, %154
  call void @llvm.dbg.label(metadata !744), !dbg !745
  %339 = load i8, ptr %25, align 1, !dbg !746
  %340 = trunc i8 %339 to i1, !dbg !746
  br i1 %340, label %350, label %341, !dbg !748

341:                                              ; preds = %338
  %342 = load i32, ptr @input_desc, align 4, !dbg !749
  %343 = call i32 @close(i32 noundef %342), !dbg !750
  %344 = icmp slt i32 %343, 0, !dbg !751
  br i1 %344, label %345, label %350, !dbg !752

345:                                              ; preds = %341
  %346 = call ptr @__errno_location() #16, !dbg !753
  %347 = load i32, ptr %346, align 4, !dbg !753
  %348 = load ptr, ptr @infile, align 8, !dbg !753
  %349 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %348), !dbg !753
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %347, ptr noundef @.str.28, ptr noundef %349) #17, !dbg !753
  store i8 0, ptr %23, align 1, !dbg !755
  br label %350, !dbg !756

350:                                              ; preds = %345, %341, %338
  br label %351, !dbg !757

351:                                              ; preds = %350, %144
  %352 = load i32, ptr %22, align 4, !dbg !758
  %353 = add nsw i32 %352, 1, !dbg !758
  store i32 %353, ptr %22, align 4, !dbg !758
  %354 = load i32, ptr %4, align 4, !dbg !759
  %355 = icmp slt i32 %353, %354, !dbg !760
  br i1 %355, label %115, label %356, !dbg !757, !llvm.loop !761

356:                                              ; preds = %351
  %357 = load i8, ptr @pending_cr, align 1, !dbg !763
  %358 = trunc i8 %357 to i1, !dbg !763
  br i1 %358, label %359, label %364, !dbg !765

359:                                              ; preds = %356
  %360 = call i64 @full_write(i32 noundef 1, ptr noundef @.str.30, i64 noundef 1), !dbg !766
  %361 = icmp ne i64 %360, 1, !dbg !769
  br i1 %361, label %362, label %363, !dbg !770

362:                                              ; preds = %359
  call void @write_error(), !dbg !771
  br label %363, !dbg !771

363:                                              ; preds = %362, %359
  br label %364, !dbg !772

364:                                              ; preds = %363, %356
  %365 = load i8, ptr %6, align 1, !dbg !773
  %366 = trunc i8 %365 to i1, !dbg !773
  br i1 %366, label %367, label %374, !dbg !775

367:                                              ; preds = %364
  %368 = call i32 @close(i32 noundef 0), !dbg !776
  %369 = icmp slt i32 %368, 0, !dbg !777
  br i1 %369, label %370, label %374, !dbg !778

370:                                              ; preds = %367
  %371 = call ptr @__errno_location() #16, !dbg !779
  %372 = load i32, ptr %371, align 4, !dbg !779
  %373 = call ptr @gettext(ptr noundef @.str.31) #12, !dbg !779
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %372, ptr noundef %373) #17, !dbg !779
  unreachable, !dbg !779

374:                                              ; preds = %367, %364
  %375 = load i8, ptr %23, align 1, !dbg !780
  %376 = trunc i8 %375 to i1, !dbg !780
  %377 = zext i1 %376 to i64, !dbg !780
  %378 = select i1 %376, i32 0, i32 1, !dbg !780
  ret i32 %378, !dbg !781
}

declare void @set_program_name(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @setlocale(i32 noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @bindtextdomain(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @textdomain(ptr noundef) #3

; Function Attrs: nounwind
declare i32 @atexit(ptr noundef) #3

declare void @close_stdout() #2

; Function Attrs: nounwind
declare i32 @getopt_long(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

declare void @version_etc(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ...) #2

declare ptr @proper_name_lite(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i32 @fstat(i32 noundef, ptr noundef) #3

; Function Attrs: cold
declare void @error(i32 noundef, i32 noundef, ptr noundef, ...) #6

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #7

; Function Attrs: noinline nounwind uwtable
define internal i64 @io_blksize(ptr noundef %0) #4 !dbg !782 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !787, metadata !DIExpression()), !dbg !788
  call void @llvm.dbg.declare(metadata ptr %4, metadata !789, metadata !DIExpression()), !dbg !790
  %7 = load ptr, ptr %3, align 8, !dbg !791
  %8 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 9, !dbg !791
  %9 = load i64, ptr %8, align 8, !dbg !791
  %10 = icmp slt i64 0, %9, !dbg !791
  br i1 %10, label %11, label %20, !dbg !791

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8, !dbg !791
  %13 = getelementptr inbounds %struct.stat, ptr %12, i32 0, i32 9, !dbg !791
  %14 = load i64, ptr %13, align 8, !dbg !791
  %15 = icmp ule i64 %14, 2305843009213693952, !dbg !791
  br i1 %15, label %16, label %20, !dbg !791

16:                                               ; preds = %11
  %17 = load ptr, ptr %3, align 8, !dbg !791
  %18 = getelementptr inbounds %struct.stat, ptr %17, i32 0, i32 9, !dbg !791
  %19 = load i64, ptr %18, align 8, !dbg !791
  br label %21, !dbg !791

20:                                               ; preds = %11, %1
  br label %21, !dbg !791

21:                                               ; preds = %20, %16
  %22 = phi i64 [ %19, %16 ], [ 512, %20 ], !dbg !791
  %23 = icmp sle i64 %22, 0, !dbg !792
  br i1 %23, label %24, label %25, !dbg !791

24:                                               ; preds = %21
  br label %42, !dbg !791

25:                                               ; preds = %21
  %26 = load ptr, ptr %3, align 8, !dbg !793
  %27 = getelementptr inbounds %struct.stat, ptr %26, i32 0, i32 9, !dbg !793
  %28 = load i64, ptr %27, align 8, !dbg !793
  %29 = icmp slt i64 0, %28, !dbg !793
  br i1 %29, label %30, label %39, !dbg !793

30:                                               ; preds = %25
  %31 = load ptr, ptr %3, align 8, !dbg !793
  %32 = getelementptr inbounds %struct.stat, ptr %31, i32 0, i32 9, !dbg !793
  %33 = load i64, ptr %32, align 8, !dbg !793
  %34 = icmp ule i64 %33, 2305843009213693952, !dbg !793
  br i1 %34, label %35, label %39, !dbg !793

35:                                               ; preds = %30
  %36 = load ptr, ptr %3, align 8, !dbg !793
  %37 = getelementptr inbounds %struct.stat, ptr %36, i32 0, i32 9, !dbg !793
  %38 = load i64, ptr %37, align 8, !dbg !793
  br label %40, !dbg !793

39:                                               ; preds = %30, %25
  br label %40, !dbg !793

40:                                               ; preds = %39, %35
  %41 = phi i64 [ %38, %35 ], [ 512, %39 ], !dbg !793
  br label %42, !dbg !791

42:                                               ; preds = %40, %24
  %43 = phi i64 [ 262144, %24 ], [ %41, %40 ], !dbg !791
  store i64 %43, ptr %4, align 8, !dbg !790
  %44 = load i64, ptr %4, align 8, !dbg !794
  %45 = srem i64 262143, %44, !dbg !795
  %46 = sub nsw i64 262143, %45, !dbg !796
  %47 = load i64, ptr %4, align 8, !dbg !797
  %48 = add nsw i64 %47, %46, !dbg !797
  store i64 %48, ptr %4, align 8, !dbg !797
  %49 = load ptr, ptr %3, align 8, !dbg !798
  %50 = getelementptr inbounds %struct.stat, ptr %49, i32 0, i32 3, !dbg !798
  %51 = load i32, ptr %50, align 8, !dbg !798
  %52 = and i32 %51, 61440, !dbg !798
  %53 = icmp eq i32 %52, 32768, !dbg !798
  br i1 %53, label %54, label %80, !dbg !800

54:                                               ; preds = %42
  %55 = load i64, ptr %4, align 8, !dbg !801
  %56 = load i64, ptr %4, align 8, !dbg !802
  %57 = sub nsw i64 %56, 1, !dbg !803
  %58 = and i64 %55, %57, !dbg !804
  %59 = icmp ne i64 %58, 0, !dbg !804
  br i1 %59, label %60, label %80, !dbg !805

60:                                               ; preds = %54
  call void @llvm.dbg.declare(metadata ptr %5, metadata !806, metadata !DIExpression()), !dbg !808
  %61 = load i64, ptr %4, align 8, !dbg !809
  store i64 %61, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !810, metadata !DIExpression()), !dbg !818
  %62 = load i64, ptr %2, align 8, !dbg !820
  %63 = icmp eq i64 %62, 0, !dbg !821
  br i1 %63, label %64, label %65, !dbg !820

64:                                               ; preds = %60
  br label %69, !dbg !820

65:                                               ; preds = %60
  %66 = load i64, ptr %2, align 8, !dbg !822
  %67 = call i64 @llvm.ctlz.i64(i64 %66, i1 true), !dbg !823
  %68 = trunc i64 %67 to i32, !dbg !823
  br label %69, !dbg !820

69:                                               ; preds = %64, %65
  %70 = phi i32 [ 64, %64 ], [ %68, %65 ], !dbg !820
  store i32 %70, ptr %5, align 4, !dbg !808
  call void @llvm.dbg.declare(metadata ptr %6, metadata !824, metadata !DIExpression()), !dbg !828
  %71 = load i32, ptr %5, align 4, !dbg !829
  %72 = sub nsw i32 64, %71, !dbg !830
  %73 = zext i32 %72 to i64, !dbg !831
  %74 = shl i64 1, %73, !dbg !831
  store i64 %74, ptr %6, align 8, !dbg !828
  %75 = load i64, ptr %6, align 8, !dbg !832
  %76 = icmp ule i64 %75, 9223372036854775807, !dbg !834
  br i1 %76, label %77, label %79, !dbg !835

77:                                               ; preds = %69
  %78 = load i64, ptr %6, align 8, !dbg !836
  store i64 %78, ptr %4, align 8, !dbg !837
  br label %79, !dbg !838

79:                                               ; preds = %77, %69
  br label %80, !dbg !839

80:                                               ; preds = %79, %54, %42
  %81 = load i64, ptr %4, align 8, !dbg !840
  %82 = icmp ult i64 4611686018427387904, %81, !dbg !840
  br i1 %82, label %83, label %84, !dbg !840

83:                                               ; preds = %80
  br label %86, !dbg !840

84:                                               ; preds = %80
  %85 = load i64, ptr %4, align 8, !dbg !840
  br label %86, !dbg !840

86:                                               ; preds = %84, %83
  %87 = phi i64 [ 4611686018427387904, %83 ], [ %85, %84 ], !dbg !840
  ret i64 %87, !dbg !841
}

declare void @xset_binary_mode(i32 noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare i32 @getpagesize() #7

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #8

declare i32 @open(ptr noundef, i32 noundef, ...) #2

declare ptr @quotearg_n_style_colon(i32 noundef, i32 noundef, ptr noundef) #2

declare void @fdadvise(i32 noundef, i64 noundef, i64 noundef, i32 noundef) #2

; Function Attrs: nounwind
declare i64 @lseek(i32 noundef, i64 noundef, i32 noundef) #3

declare i32 @rpl_fcntl(i32 noundef, i32 noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @copy_cat() #4 !dbg !842 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  call void @llvm.dbg.declare(metadata ptr %2, metadata !845, metadata !DIExpression()), !dbg !848
  store i64 9223372035781033984, ptr %2, align 8, !dbg !848
  call void @llvm.dbg.declare(metadata ptr %3, metadata !849, metadata !DIExpression()), !dbg !851
  store i8 0, ptr %3, align 1, !dbg !851
  br label %4, !dbg !852

4:                                                ; preds = %47, %0
  %5 = load i32, ptr @input_desc, align 4, !dbg !853
  %6 = load i64, ptr %2, align 8, !dbg !855
  %7 = call i64 @rpl_copy_file_range(i32 noundef %5, ptr noundef null, i32 noundef 1, ptr noundef null, i64 noundef %6, i32 noundef 0), !dbg !856
  switch i64 %7, label %46 [
    i64 0, label %8
    i64 -1, label %12
  ], !dbg !857

8:                                                ; preds = %4
  %9 = load i8, ptr %3, align 1, !dbg !858
  %10 = trunc i8 %9 to i1, !dbg !858
  %11 = zext i1 %10 to i32, !dbg !858
  store i32 %11, ptr %1, align 4, !dbg !860
  br label %48, !dbg !860

12:                                               ; preds = %4
  %13 = call ptr @__errno_location() #16, !dbg !861
  %14 = load i32, ptr %13, align 4, !dbg !861
  %15 = icmp eq i32 %14, 38, !dbg !863
  br i1 %15, label %40, label %16, !dbg !864

16:                                               ; preds = %12
  %17 = call ptr @__errno_location() #16, !dbg !865
  %18 = load i32, ptr %17, align 4, !dbg !865
  %19 = call zeroext i1 @is_ENOTSUP(i32 noundef %18), !dbg !866
  br i1 %19, label %40, label %20, !dbg !867

20:                                               ; preds = %16
  %21 = call ptr @__errno_location() #16, !dbg !868
  %22 = load i32, ptr %21, align 4, !dbg !868
  %23 = icmp eq i32 %22, 22, !dbg !869
  br i1 %23, label %40, label %24, !dbg !870

24:                                               ; preds = %20
  %25 = call ptr @__errno_location() #16, !dbg !871
  %26 = load i32, ptr %25, align 4, !dbg !871
  %27 = icmp eq i32 %26, 9, !dbg !872
  br i1 %27, label %40, label %28, !dbg !873

28:                                               ; preds = %24
  %29 = call ptr @__errno_location() #16, !dbg !874
  %30 = load i32, ptr %29, align 4, !dbg !874
  %31 = icmp eq i32 %30, 18, !dbg !875
  br i1 %31, label %40, label %32, !dbg !876

32:                                               ; preds = %28
  %33 = call ptr @__errno_location() #16, !dbg !877
  %34 = load i32, ptr %33, align 4, !dbg !877
  %35 = icmp eq i32 %34, 26, !dbg !878
  br i1 %35, label %40, label %36, !dbg !879

36:                                               ; preds = %32
  %37 = call ptr @__errno_location() #16, !dbg !880
  %38 = load i32, ptr %37, align 4, !dbg !880
  %39 = icmp eq i32 %38, 1, !dbg !881
  br i1 %39, label %40, label %41, !dbg !882

40:                                               ; preds = %36, %32, %28, %24, %20, %16, %12
  store i32 0, ptr %1, align 4, !dbg !883
  br label %48, !dbg !883

41:                                               ; preds = %36
  %42 = call ptr @__errno_location() #16, !dbg !884
  %43 = load i32, ptr %42, align 4, !dbg !884
  %44 = load ptr, ptr @infile, align 8, !dbg !884
  %45 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %44), !dbg !884
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %43, ptr noundef @.str.28, ptr noundef %45) #17, !dbg !884
  store i32 -1, ptr %1, align 4, !dbg !885
  br label %48, !dbg !885

46:                                               ; preds = %4
  br label %47, !dbg !886

47:                                               ; preds = %46
  store i8 1, ptr %3, align 1, !dbg !887
  br label %4, !dbg !888, !llvm.loop !889

48:                                               ; preds = %41, %40, %8
  %49 = load i32, ptr %1, align 4, !dbg !892
  ret i32 %49, !dbg !892
}

; Function Attrs: allocsize(1)
declare noalias nonnull ptr @xalignalloc(i64 noundef, i64 noundef) #9

; Function Attrs: noinline nounwind uwtable
define internal zeroext i1 @simple_cat(ptr noundef %0, i64 noundef %1) #4 !dbg !893 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !896, metadata !DIExpression()), !dbg !897
  store i64 %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !898, metadata !DIExpression()), !dbg !899
  br label %7, !dbg !900

7:                                                ; preds = %2, %30
  call void @llvm.dbg.declare(metadata ptr %6, metadata !901, metadata !DIExpression()), !dbg !903
  %8 = load i32, ptr @input_desc, align 4, !dbg !904
  %9 = load ptr, ptr %4, align 8, !dbg !905
  %10 = load i64, ptr %5, align 8, !dbg !906
  %11 = call i64 @safe_read(i32 noundef %8, ptr noundef %9, i64 noundef %10), !dbg !907
  store i64 %11, ptr %6, align 8, !dbg !903
  %12 = load i64, ptr %6, align 8, !dbg !908
  %13 = icmp slt i64 %12, 0, !dbg !910
  br i1 %13, label %14, label %19, !dbg !911

14:                                               ; preds = %7
  %15 = call ptr @__errno_location() #16, !dbg !912
  %16 = load i32, ptr %15, align 4, !dbg !912
  %17 = load ptr, ptr @infile, align 8, !dbg !912
  %18 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %17), !dbg !912
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %16, ptr noundef @.str.28, ptr noundef %18) #17, !dbg !912
  store i1 false, ptr %3, align 1, !dbg !914
  br label %31, !dbg !914

19:                                               ; preds = %7
  %20 = load i64, ptr %6, align 8, !dbg !915
  %21 = icmp eq i64 %20, 0, !dbg !917
  br i1 %21, label %22, label %23, !dbg !918

22:                                               ; preds = %19
  store i1 true, ptr %3, align 1, !dbg !919
  br label %31, !dbg !919

23:                                               ; preds = %19
  %24 = load ptr, ptr %4, align 8, !dbg !920
  %25 = load i64, ptr %6, align 8, !dbg !922
  %26 = call i64 @full_write(i32 noundef 1, ptr noundef %24, i64 noundef %25), !dbg !923
  %27 = load i64, ptr %6, align 8, !dbg !924
  %28 = icmp ne i64 %26, %27, !dbg !925
  br i1 %28, label %29, label %30, !dbg !926

29:                                               ; preds = %23
  call void @write_error(), !dbg !927
  br label %30, !dbg !927

30:                                               ; preds = %29, %23
  br label %7, !dbg !900, !llvm.loop !928

31:                                               ; preds = %22, %14
  %32 = load i1, ptr %3, align 1, !dbg !930
  ret i1 %32, !dbg !930
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: noreturn
declare void @xalloc_die() #10

; Function Attrs: noinline nounwind uwtable
define internal zeroext i1 @cat(ptr noundef %0, i64 noundef %1, ptr noundef %2, i64 noundef %3, i1 noundef zeroext %4, i1 noundef zeroext %5, i1 noundef zeroext %6, i1 noundef zeroext %7, i1 noundef zeroext %8, i1 noundef zeroext %9) #4 !dbg !931 {
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
  call void @llvm.dbg.declare(metadata ptr %12, metadata !934, metadata !DIExpression()), !dbg !935
  store i64 %1, ptr %13, align 8
  call void @llvm.dbg.declare(metadata ptr %13, metadata !936, metadata !DIExpression()), !dbg !937
  store ptr %2, ptr %14, align 8
  call void @llvm.dbg.declare(metadata ptr %14, metadata !938, metadata !DIExpression()), !dbg !939
  store i64 %3, ptr %15, align 8
  call void @llvm.dbg.declare(metadata ptr %15, metadata !940, metadata !DIExpression()), !dbg !941
  %33 = zext i1 %4 to i8
  store i8 %33, ptr %16, align 1
  call void @llvm.dbg.declare(metadata ptr %16, metadata !942, metadata !DIExpression()), !dbg !943
  %34 = zext i1 %5 to i8
  store i8 %34, ptr %17, align 1
  call void @llvm.dbg.declare(metadata ptr %17, metadata !944, metadata !DIExpression()), !dbg !945
  %35 = zext i1 %6 to i8
  store i8 %35, ptr %18, align 1
  call void @llvm.dbg.declare(metadata ptr %18, metadata !946, metadata !DIExpression()), !dbg !947
  %36 = zext i1 %7 to i8
  store i8 %36, ptr %19, align 1
  call void @llvm.dbg.declare(metadata ptr %19, metadata !948, metadata !DIExpression()), !dbg !949
  %37 = zext i1 %8 to i8
  store i8 %37, ptr %20, align 1
  call void @llvm.dbg.declare(metadata ptr %20, metadata !950, metadata !DIExpression()), !dbg !951
  %38 = zext i1 %9 to i8
  store i8 %38, ptr %21, align 1
  call void @llvm.dbg.declare(metadata ptr %21, metadata !952, metadata !DIExpression()), !dbg !953
  call void @llvm.dbg.declare(metadata ptr %22, metadata !954, metadata !DIExpression()), !dbg !956
  call void @llvm.dbg.declare(metadata ptr %23, metadata !957, metadata !DIExpression()), !dbg !958
  %39 = load i32, ptr @newlines2, align 4, !dbg !959
  store i32 %39, ptr %23, align 4, !dbg !958
  call void @llvm.dbg.declare(metadata ptr %24, metadata !960, metadata !DIExpression()), !dbg !961
  store i8 1, ptr %24, align 1, !dbg !961
  call void @llvm.dbg.declare(metadata ptr %25, metadata !962, metadata !DIExpression()), !dbg !963
  %40 = load ptr, ptr %12, align 8, !dbg !964
  store ptr %40, ptr %25, align 8, !dbg !963
  call void @llvm.dbg.declare(metadata ptr %26, metadata !965, metadata !DIExpression()), !dbg !966
  %41 = load ptr, ptr %25, align 8, !dbg !967
  %42 = getelementptr inbounds i8, ptr %41, i64 1, !dbg !968
  store ptr %42, ptr %26, align 8, !dbg !966
  call void @llvm.dbg.declare(metadata ptr %27, metadata !969, metadata !DIExpression()), !dbg !970
  %43 = load ptr, ptr %14, align 8, !dbg !971
  store ptr %43, ptr %27, align 8, !dbg !970
  br label %44, !dbg !972

44:                                               ; preds = %10, %372
  br label %45, !dbg !973

45:                                               ; preds = %202, %44
  %46 = load ptr, ptr %14, align 8, !dbg !975
  %47 = load i64, ptr %15, align 8, !dbg !978
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !979
  %49 = load ptr, ptr %27, align 8, !dbg !980
  %50 = icmp ule ptr %48, %49, !dbg !981
  br i1 %50, label %51, label %80, !dbg !982

51:                                               ; preds = %45
  call void @llvm.dbg.declare(metadata ptr %28, metadata !983, metadata !DIExpression()), !dbg !985
  %52 = load ptr, ptr %14, align 8, !dbg !986
  store ptr %52, ptr %28, align 8, !dbg !985
  call void @llvm.dbg.declare(metadata ptr %29, metadata !987, metadata !DIExpression()), !dbg !988
  br label %53, !dbg !989

53:                                               ; preds = %69, %51
  %54 = load ptr, ptr %28, align 8, !dbg !990
  %55 = load i64, ptr %15, align 8, !dbg !993
  %56 = call i64 @full_write(i32 noundef 1, ptr noundef %54, i64 noundef %55), !dbg !994
  %57 = load i64, ptr %15, align 8, !dbg !995
  %58 = icmp ne i64 %56, %57, !dbg !996
  br i1 %58, label %59, label %60, !dbg !997

59:                                               ; preds = %53
  call void @write_error(), !dbg !998
  br label %60, !dbg !998

60:                                               ; preds = %59, %53
  %61 = load i64, ptr %15, align 8, !dbg !999
  %62 = load ptr, ptr %28, align 8, !dbg !1000
  %63 = getelementptr inbounds i8, ptr %62, i64 %61, !dbg !1000
  store ptr %63, ptr %28, align 8, !dbg !1000
  %64 = load ptr, ptr %27, align 8, !dbg !1001
  %65 = load ptr, ptr %28, align 8, !dbg !1002
  %66 = ptrtoint ptr %64 to i64, !dbg !1003
  %67 = ptrtoint ptr %65 to i64, !dbg !1003
  %68 = sub i64 %66, %67, !dbg !1003
  store i64 %68, ptr %29, align 8, !dbg !1004
  br label %69, !dbg !1005

69:                                               ; preds = %60
  %70 = load i64, ptr %15, align 8, !dbg !1006
  %71 = load i64, ptr %29, align 8, !dbg !1007
  %72 = icmp sle i64 %70, %71, !dbg !1008
  br i1 %72, label %53, label %73, !dbg !1005, !llvm.loop !1009

73:                                               ; preds = %69
  %74 = load ptr, ptr %14, align 8, !dbg !1011
  %75 = load ptr, ptr %28, align 8, !dbg !1012
  %76 = load i64, ptr %29, align 8, !dbg !1013
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %74, ptr align 1 %75, i64 %76, i1 false), !dbg !1014
  %77 = load ptr, ptr %14, align 8, !dbg !1015
  %78 = load i64, ptr %29, align 8, !dbg !1016
  %79 = getelementptr inbounds i8, ptr %77, i64 %78, !dbg !1017
  store ptr %79, ptr %27, align 8, !dbg !1018
  br label %80, !dbg !1019

80:                                               ; preds = %73, %45
  %81 = load ptr, ptr %26, align 8, !dbg !1020
  %82 = load ptr, ptr %25, align 8, !dbg !1022
  %83 = icmp ugt ptr %81, %82, !dbg !1023
  br i1 %83, label %84, label %155, !dbg !1024

84:                                               ; preds = %80
  call void @llvm.dbg.declare(metadata ptr %30, metadata !1025, metadata !DIExpression()), !dbg !1027
  store i8 0, ptr %30, align 1, !dbg !1027
  call void @llvm.dbg.declare(metadata ptr %31, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i32 0, ptr %31, align 4, !dbg !1029
  %85 = load i8, ptr %24, align 1, !dbg !1030
  %86 = trunc i8 %85 to i1, !dbg !1030
  br i1 %86, label %87, label %120, !dbg !1032

87:                                               ; preds = %84
  %88 = load i32, ptr @input_desc, align 4, !dbg !1033
  %89 = call i32 (i32, i64, ...) @ioctl(i32 noundef %88, i64 noundef 21531, ptr noundef %31) #12, !dbg !1034
  %90 = icmp slt i32 %89, 0, !dbg !1035
  br i1 %90, label %91, label %120, !dbg !1036

91:                                               ; preds = %87
  %92 = call ptr @__errno_location() #16, !dbg !1037
  %93 = load i32, ptr %92, align 4, !dbg !1037
  %94 = icmp eq i32 %93, 95, !dbg !1040
  br i1 %94, label %111, label %95, !dbg !1041

95:                                               ; preds = %91
  %96 = call ptr @__errno_location() #16, !dbg !1042
  %97 = load i32, ptr %96, align 4, !dbg !1042
  %98 = icmp eq i32 %97, 25, !dbg !1043
  br i1 %98, label %111, label %99, !dbg !1044

99:                                               ; preds = %95
  %100 = call ptr @__errno_location() #16, !dbg !1045
  %101 = load i32, ptr %100, align 4, !dbg !1045
  %102 = icmp eq i32 %101, 22, !dbg !1046
  br i1 %102, label %111, label %103, !dbg !1047

103:                                              ; preds = %99
  %104 = call ptr @__errno_location() #16, !dbg !1048
  %105 = load i32, ptr %104, align 4, !dbg !1048
  %106 = icmp eq i32 %105, 19, !dbg !1049
  br i1 %106, label %111, label %107, !dbg !1050

107:                                              ; preds = %103
  %108 = call ptr @__errno_location() #16, !dbg !1051
  %109 = load i32, ptr %108, align 4, !dbg !1051
  %110 = icmp eq i32 %109, 38, !dbg !1052
  br i1 %110, label %111, label %112, !dbg !1053

111:                                              ; preds = %107, %103, %99, %95, %91
  store i8 0, ptr %24, align 1, !dbg !1054
  br label %119, !dbg !1055

112:                                              ; preds = %107
  %113 = call ptr @__errno_location() #16, !dbg !1056
  %114 = load i32, ptr %113, align 4, !dbg !1056
  %115 = call ptr @gettext(ptr noundef @.str.48) #12, !dbg !1056
  %116 = load ptr, ptr @infile, align 8, !dbg !1056
  %117 = call ptr @quotearg_style(i32 noundef 4, ptr noundef %116), !dbg !1056
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %114, ptr noundef %115, ptr noundef %117) #17, !dbg !1056
  %118 = load i32, ptr %23, align 4, !dbg !1058
  store i32 %118, ptr @newlines2, align 4, !dbg !1059
  store i1 false, ptr %11, align 1, !dbg !1060
  br label %373, !dbg !1060

119:                                              ; preds = %111
  br label %120, !dbg !1061

120:                                              ; preds = %119, %87, %84
  %121 = load i32, ptr %31, align 4, !dbg !1062
  %122 = icmp ne i32 %121, 0, !dbg !1064
  br i1 %122, label %123, label %124, !dbg !1065

123:                                              ; preds = %120
  store i8 1, ptr %30, align 1, !dbg !1066
  br label %124, !dbg !1067

124:                                              ; preds = %123, %120
  %125 = load i8, ptr %30, align 1, !dbg !1068
  %126 = trunc i8 %125 to i1, !dbg !1068
  br i1 %126, label %129, label %127, !dbg !1070

127:                                              ; preds = %124
  %128 = load ptr, ptr %14, align 8, !dbg !1071
  call void @write_pending(ptr noundef %128, ptr noundef %27), !dbg !1072
  br label %129, !dbg !1072

129:                                              ; preds = %127, %124
  call void @llvm.dbg.declare(metadata ptr %32, metadata !1073, metadata !DIExpression()), !dbg !1074
  %130 = load i32, ptr @input_desc, align 4, !dbg !1075
  %131 = load ptr, ptr %12, align 8, !dbg !1076
  %132 = load i64, ptr %13, align 8, !dbg !1077
  %133 = call i64 @safe_read(i32 noundef %130, ptr noundef %131, i64 noundef %132), !dbg !1078
  store i64 %133, ptr %32, align 8, !dbg !1074
  %134 = load i64, ptr %32, align 8, !dbg !1079
  %135 = icmp slt i64 %134, 0, !dbg !1081
  br i1 %135, label %136, label %143, !dbg !1082

136:                                              ; preds = %129
  %137 = call ptr @__errno_location() #16, !dbg !1083
  %138 = load i32, ptr %137, align 4, !dbg !1083
  %139 = load ptr, ptr @infile, align 8, !dbg !1083
  %140 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %139), !dbg !1083
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %138, ptr noundef @.str.28, ptr noundef %140) #17, !dbg !1083
  %141 = load ptr, ptr %14, align 8, !dbg !1085
  call void @write_pending(ptr noundef %141, ptr noundef %27), !dbg !1086
  %142 = load i32, ptr %23, align 4, !dbg !1087
  store i32 %142, ptr @newlines2, align 4, !dbg !1088
  store i1 false, ptr %11, align 1, !dbg !1089
  br label %373, !dbg !1089

143:                                              ; preds = %129
  %144 = load i64, ptr %32, align 8, !dbg !1090
  %145 = icmp eq i64 %144, 0, !dbg !1092
  br i1 %145, label %146, label %149, !dbg !1093

146:                                              ; preds = %143
  %147 = load ptr, ptr %14, align 8, !dbg !1094
  call void @write_pending(ptr noundef %147, ptr noundef %27), !dbg !1096
  %148 = load i32, ptr %23, align 4, !dbg !1097
  store i32 %148, ptr @newlines2, align 4, !dbg !1098
  store i1 true, ptr %11, align 1, !dbg !1099
  br label %373, !dbg !1099

149:                                              ; preds = %143
  %150 = load ptr, ptr %12, align 8, !dbg !1100
  store ptr %150, ptr %26, align 8, !dbg !1101
  %151 = load ptr, ptr %26, align 8, !dbg !1102
  %152 = load i64, ptr %32, align 8, !dbg !1103
  %153 = getelementptr inbounds i8, ptr %151, i64 %152, !dbg !1104
  store ptr %153, ptr %25, align 8, !dbg !1105
  %154 = load ptr, ptr %25, align 8, !dbg !1106
  store i8 10, ptr %154, align 1, !dbg !1107
  br label %198, !dbg !1108

155:                                              ; preds = %80
  %156 = load i32, ptr %23, align 4, !dbg !1109
  %157 = add nsw i32 %156, 1, !dbg !1109
  store i32 %157, ptr %23, align 4, !dbg !1109
  %158 = icmp sgt i32 %157, 0, !dbg !1112
  br i1 %158, label %159, label %181, !dbg !1113

159:                                              ; preds = %155
  %160 = load i32, ptr %23, align 4, !dbg !1114
  %161 = icmp sge i32 %160, 2, !dbg !1117
  br i1 %161, label %162, label %170, !dbg !1118

162:                                              ; preds = %159
  store i32 2, ptr %23, align 4, !dbg !1119
  %163 = load i8, ptr %21, align 1, !dbg !1121
  %164 = trunc i8 %163 to i1, !dbg !1121
  br i1 %164, label %165, label %169, !dbg !1123

165:                                              ; preds = %162
  %166 = load ptr, ptr %26, align 8, !dbg !1124
  %167 = getelementptr inbounds i8, ptr %166, i32 1, !dbg !1124
  store ptr %167, ptr %26, align 8, !dbg !1124
  %168 = load i8, ptr %166, align 1, !dbg !1126
  store i8 %168, ptr %22, align 1, !dbg !1127
  br label %202, !dbg !1128

169:                                              ; preds = %162
  br label %170, !dbg !1129

170:                                              ; preds = %169, %159
  %171 = load i8, ptr %18, align 1, !dbg !1130
  %172 = trunc i8 %171 to i1, !dbg !1130
  br i1 %172, label %173, label %180, !dbg !1132

173:                                              ; preds = %170
  %174 = load i8, ptr %19, align 1, !dbg !1133
  %175 = trunc i8 %174 to i1, !dbg !1133
  br i1 %175, label %180, label %176, !dbg !1134

176:                                              ; preds = %173
  call void @next_line_num(), !dbg !1135
  %177 = load ptr, ptr %27, align 8, !dbg !1137
  %178 = load ptr, ptr @line_num_print, align 8, !dbg !1138
  %179 = call ptr @stpcpy(ptr noundef %177, ptr noundef %178) #12, !dbg !1139
  store ptr %179, ptr %27, align 8, !dbg !1140
  br label %180, !dbg !1141

180:                                              ; preds = %176, %173, %170
  br label %181, !dbg !1142

181:                                              ; preds = %180, %155
  %182 = load i8, ptr %20, align 1, !dbg !1143
  %183 = trunc i8 %182 to i1, !dbg !1143
  br i1 %183, label %184, label %195, !dbg !1145

184:                                              ; preds = %181
  %185 = load i8, ptr @pending_cr, align 1, !dbg !1146
  %186 = trunc i8 %185 to i1, !dbg !1146
  br i1 %186, label %187, label %192, !dbg !1149

187:                                              ; preds = %184
  %188 = load ptr, ptr %27, align 8, !dbg !1150
  %189 = getelementptr inbounds i8, ptr %188, i32 1, !dbg !1150
  store ptr %189, ptr %27, align 8, !dbg !1150
  store i8 94, ptr %188, align 1, !dbg !1152
  %190 = load ptr, ptr %27, align 8, !dbg !1153
  %191 = getelementptr inbounds i8, ptr %190, i32 1, !dbg !1153
  store ptr %191, ptr %27, align 8, !dbg !1153
  store i8 77, ptr %190, align 1, !dbg !1154
  store i8 0, ptr @pending_cr, align 1, !dbg !1155
  br label %192, !dbg !1156

192:                                              ; preds = %187, %184
  %193 = load ptr, ptr %27, align 8, !dbg !1157
  %194 = getelementptr inbounds i8, ptr %193, i32 1, !dbg !1157
  store ptr %194, ptr %27, align 8, !dbg !1157
  store i8 36, ptr %193, align 1, !dbg !1158
  br label %195, !dbg !1159

195:                                              ; preds = %192, %181
  %196 = load ptr, ptr %27, align 8, !dbg !1160
  %197 = getelementptr inbounds i8, ptr %196, i32 1, !dbg !1160
  store ptr %197, ptr %27, align 8, !dbg !1160
  store i8 10, ptr %196, align 1, !dbg !1161
  br label %198

198:                                              ; preds = %195, %149
  %199 = load ptr, ptr %26, align 8, !dbg !1162
  %200 = getelementptr inbounds i8, ptr %199, i32 1, !dbg !1162
  store ptr %200, ptr %26, align 8, !dbg !1162
  %201 = load i8, ptr %199, align 1, !dbg !1163
  store i8 %201, ptr %22, align 1, !dbg !1164
  br label %202, !dbg !1165

202:                                              ; preds = %198, %165
  %203 = load i8, ptr %22, align 1, !dbg !1166
  %204 = zext i8 %203 to i32, !dbg !1166
  %205 = icmp eq i32 %204, 10, !dbg !1167
  br i1 %205, label %45, label %206, !dbg !1165, !llvm.loop !1168

206:                                              ; preds = %202
  %207 = load i8, ptr @pending_cr, align 1, !dbg !1170
  %208 = trunc i8 %207 to i1, !dbg !1170
  br i1 %208, label %209, label %212, !dbg !1172

209:                                              ; preds = %206
  %210 = load ptr, ptr %27, align 8, !dbg !1173
  %211 = getelementptr inbounds i8, ptr %210, i32 1, !dbg !1173
  store ptr %211, ptr %27, align 8, !dbg !1173
  store i8 13, ptr %210, align 1, !dbg !1175
  store i8 0, ptr @pending_cr, align 1, !dbg !1176
  br label %212, !dbg !1177

212:                                              ; preds = %209, %206
  %213 = load i32, ptr %23, align 4, !dbg !1178
  %214 = icmp sge i32 %213, 0, !dbg !1180
  br i1 %214, label %215, label %222, !dbg !1181

215:                                              ; preds = %212
  %216 = load i8, ptr %18, align 1, !dbg !1182
  %217 = trunc i8 %216 to i1, !dbg !1182
  br i1 %217, label %218, label %222, !dbg !1183

218:                                              ; preds = %215
  call void @next_line_num(), !dbg !1184
  %219 = load ptr, ptr %27, align 8, !dbg !1186
  %220 = load ptr, ptr @line_num_print, align 8, !dbg !1187
  %221 = call ptr @stpcpy(ptr noundef %219, ptr noundef %220) #12, !dbg !1188
  store ptr %221, ptr %27, align 8, !dbg !1189
  br label %222, !dbg !1190

222:                                              ; preds = %218, %215, %212
  %223 = load i8, ptr %16, align 1, !dbg !1191
  %224 = trunc i8 %223 to i1, !dbg !1191
  br i1 %224, label %225, label %316, !dbg !1193

225:                                              ; preds = %222
  br label %226, !dbg !1194

226:                                              ; preds = %225, %311
  %227 = load i8, ptr %22, align 1, !dbg !1196
  %228 = zext i8 %227 to i32, !dbg !1196
  %229 = icmp sge i32 %228, 32, !dbg !1199
  br i1 %229, label %230, label %285, !dbg !1200

230:                                              ; preds = %226
  %231 = load i8, ptr %22, align 1, !dbg !1201
  %232 = zext i8 %231 to i32, !dbg !1201
  %233 = icmp slt i32 %232, 127, !dbg !1204
  br i1 %233, label %234, label %238, !dbg !1205

234:                                              ; preds = %230
  %235 = load i8, ptr %22, align 1, !dbg !1206
  %236 = load ptr, ptr %27, align 8, !dbg !1207
  %237 = getelementptr inbounds i8, ptr %236, i32 1, !dbg !1207
  store ptr %237, ptr %27, align 8, !dbg !1207
  store i8 %235, ptr %236, align 1, !dbg !1208
  br label %284, !dbg !1209

238:                                              ; preds = %230
  %239 = load i8, ptr %22, align 1, !dbg !1210
  %240 = zext i8 %239 to i32, !dbg !1210
  %241 = icmp eq i32 %240, 127, !dbg !1212
  br i1 %241, label %242, label %247, !dbg !1213

242:                                              ; preds = %238
  %243 = load ptr, ptr %27, align 8, !dbg !1214
  %244 = getelementptr inbounds i8, ptr %243, i32 1, !dbg !1214
  store ptr %244, ptr %27, align 8, !dbg !1214
  store i8 94, ptr %243, align 1, !dbg !1216
  %245 = load ptr, ptr %27, align 8, !dbg !1217
  %246 = getelementptr inbounds i8, ptr %245, i32 1, !dbg !1217
  store ptr %246, ptr %27, align 8, !dbg !1217
  store i8 63, ptr %245, align 1, !dbg !1218
  br label %283, !dbg !1219

247:                                              ; preds = %238
  %248 = load ptr, ptr %27, align 8, !dbg !1220
  %249 = getelementptr inbounds i8, ptr %248, i32 1, !dbg !1220
  store ptr %249, ptr %27, align 8, !dbg !1220
  store i8 77, ptr %248, align 1, !dbg !1222
  %250 = load ptr, ptr %27, align 8, !dbg !1223
  %251 = getelementptr inbounds i8, ptr %250, i32 1, !dbg !1223
  store ptr %251, ptr %27, align 8, !dbg !1223
  store i8 45, ptr %250, align 1, !dbg !1224
  %252 = load i8, ptr %22, align 1, !dbg !1225
  %253 = zext i8 %252 to i32, !dbg !1225
  %254 = icmp sge i32 %253, 160, !dbg !1227
  br i1 %254, label %255, label %272, !dbg !1228

255:                                              ; preds = %247
  %256 = load i8, ptr %22, align 1, !dbg !1229
  %257 = zext i8 %256 to i32, !dbg !1229
  %258 = icmp slt i32 %257, 255, !dbg !1232
  br i1 %258, label %259, label %266, !dbg !1233

259:                                              ; preds = %255
  %260 = load i8, ptr %22, align 1, !dbg !1234
  %261 = zext i8 %260 to i32, !dbg !1234
  %262 = sub nsw i32 %261, 128, !dbg !1235
  %263 = trunc i32 %262 to i8, !dbg !1234
  %264 = load ptr, ptr %27, align 8, !dbg !1236
  %265 = getelementptr inbounds i8, ptr %264, i32 1, !dbg !1236
  store ptr %265, ptr %27, align 8, !dbg !1236
  store i8 %263, ptr %264, align 1, !dbg !1237
  br label %271, !dbg !1238

266:                                              ; preds = %255
  %267 = load ptr, ptr %27, align 8, !dbg !1239
  %268 = getelementptr inbounds i8, ptr %267, i32 1, !dbg !1239
  store ptr %268, ptr %27, align 8, !dbg !1239
  store i8 94, ptr %267, align 1, !dbg !1241
  %269 = load ptr, ptr %27, align 8, !dbg !1242
  %270 = getelementptr inbounds i8, ptr %269, i32 1, !dbg !1242
  store ptr %270, ptr %27, align 8, !dbg !1242
  store i8 63, ptr %269, align 1, !dbg !1243
  br label %271

271:                                              ; preds = %266, %259
  br label %282, !dbg !1244

272:                                              ; preds = %247
  %273 = load ptr, ptr %27, align 8, !dbg !1245
  %274 = getelementptr inbounds i8, ptr %273, i32 1, !dbg !1245
  store ptr %274, ptr %27, align 8, !dbg !1245
  store i8 94, ptr %273, align 1, !dbg !1247
  %275 = load i8, ptr %22, align 1, !dbg !1248
  %276 = zext i8 %275 to i32, !dbg !1248
  %277 = sub nsw i32 %276, 128, !dbg !1249
  %278 = add nsw i32 %277, 64, !dbg !1250
  %279 = trunc i32 %278 to i8, !dbg !1248
  %280 = load ptr, ptr %27, align 8, !dbg !1251
  %281 = getelementptr inbounds i8, ptr %280, i32 1, !dbg !1251
  store ptr %281, ptr %27, align 8, !dbg !1251
  store i8 %279, ptr %280, align 1, !dbg !1252
  br label %282

282:                                              ; preds = %272, %271
  br label %283

283:                                              ; preds = %282, %242
  br label %284

284:                                              ; preds = %283, %234
  br label %311, !dbg !1253

285:                                              ; preds = %226
  %286 = load i8, ptr %22, align 1, !dbg !1254
  %287 = zext i8 %286 to i32, !dbg !1254
  %288 = icmp eq i32 %287, 9, !dbg !1256
  br i1 %288, label %289, label %295, !dbg !1257

289:                                              ; preds = %285
  %290 = load i8, ptr %17, align 1, !dbg !1258
  %291 = trunc i8 %290 to i1, !dbg !1258
  br i1 %291, label %295, label %292, !dbg !1259

292:                                              ; preds = %289
  %293 = load ptr, ptr %27, align 8, !dbg !1260
  %294 = getelementptr inbounds i8, ptr %293, i32 1, !dbg !1260
  store ptr %294, ptr %27, align 8, !dbg !1260
  store i8 9, ptr %293, align 1, !dbg !1261
  br label %310, !dbg !1262

295:                                              ; preds = %289, %285
  %296 = load i8, ptr %22, align 1, !dbg !1263
  %297 = zext i8 %296 to i32, !dbg !1263
  %298 = icmp eq i32 %297, 10, !dbg !1265
  br i1 %298, label %299, label %300, !dbg !1266

299:                                              ; preds = %295
  store i32 -1, ptr %23, align 4, !dbg !1267
  br label %315, !dbg !1269

300:                                              ; preds = %295
  %301 = load ptr, ptr %27, align 8, !dbg !1270
  %302 = getelementptr inbounds i8, ptr %301, i32 1, !dbg !1270
  store ptr %302, ptr %27, align 8, !dbg !1270
  store i8 94, ptr %301, align 1, !dbg !1272
  %303 = load i8, ptr %22, align 1, !dbg !1273
  %304 = zext i8 %303 to i32, !dbg !1273
  %305 = add nsw i32 %304, 64, !dbg !1274
  %306 = trunc i32 %305 to i8, !dbg !1273
  %307 = load ptr, ptr %27, align 8, !dbg !1275
  %308 = getelementptr inbounds i8, ptr %307, i32 1, !dbg !1275
  store ptr %308, ptr %27, align 8, !dbg !1275
  store i8 %306, ptr %307, align 1, !dbg !1276
  br label %309

309:                                              ; preds = %300
  br label %310

310:                                              ; preds = %309, %292
  br label %311

311:                                              ; preds = %310, %284
  %312 = load ptr, ptr %26, align 8, !dbg !1277
  %313 = getelementptr inbounds i8, ptr %312, i32 1, !dbg !1277
  store ptr %313, ptr %26, align 8, !dbg !1277
  %314 = load i8, ptr %312, align 1, !dbg !1278
  store i8 %314, ptr %22, align 1, !dbg !1279
  br label %226, !dbg !1194, !llvm.loop !1280

315:                                              ; preds = %299
  br label %372, !dbg !1282

316:                                              ; preds = %222
  br label %317, !dbg !1283

317:                                              ; preds = %316, %367
  %318 = load i8, ptr %22, align 1, !dbg !1285
  %319 = zext i8 %318 to i32, !dbg !1285
  %320 = icmp eq i32 %319, 9, !dbg !1288
  br i1 %320, label %321, label %333, !dbg !1289

321:                                              ; preds = %317
  %322 = load i8, ptr %17, align 1, !dbg !1290
  %323 = trunc i8 %322 to i1, !dbg !1290
  br i1 %323, label %324, label %333, !dbg !1291

324:                                              ; preds = %321
  %325 = load ptr, ptr %27, align 8, !dbg !1292
  %326 = getelementptr inbounds i8, ptr %325, i32 1, !dbg !1292
  store ptr %326, ptr %27, align 8, !dbg !1292
  store i8 94, ptr %325, align 1, !dbg !1294
  %327 = load i8, ptr %22, align 1, !dbg !1295
  %328 = zext i8 %327 to i32, !dbg !1295
  %329 = add nsw i32 %328, 64, !dbg !1296
  %330 = trunc i32 %329 to i8, !dbg !1295
  %331 = load ptr, ptr %27, align 8, !dbg !1297
  %332 = getelementptr inbounds i8, ptr %331, i32 1, !dbg !1297
  store ptr %332, ptr %27, align 8, !dbg !1297
  store i8 %330, ptr %331, align 1, !dbg !1298
  br label %367, !dbg !1299

333:                                              ; preds = %321, %317
  %334 = load i8, ptr %22, align 1, !dbg !1300
  %335 = zext i8 %334 to i32, !dbg !1300
  %336 = icmp ne i32 %335, 10, !dbg !1302
  br i1 %336, label %337, label %365, !dbg !1303

337:                                              ; preds = %333
  %338 = load i8, ptr %22, align 1, !dbg !1304
  %339 = zext i8 %338 to i32, !dbg !1304
  %340 = icmp eq i32 %339, 13, !dbg !1307
  br i1 %340, label %341, label %360, !dbg !1308

341:                                              ; preds = %337
  %342 = load ptr, ptr %26, align 8, !dbg !1309
  %343 = load i8, ptr %342, align 1, !dbg !1310
  %344 = sext i8 %343 to i32, !dbg !1310
  %345 = icmp eq i32 %344, 10, !dbg !1311
  br i1 %345, label %346, label %360, !dbg !1312

346:                                              ; preds = %341
  %347 = load i8, ptr %20, align 1, !dbg !1313
  %348 = trunc i8 %347 to i1, !dbg !1313
  br i1 %348, label %349, label %360, !dbg !1314

349:                                              ; preds = %346
  %350 = load ptr, ptr %26, align 8, !dbg !1315
  %351 = load ptr, ptr %25, align 8, !dbg !1318
  %352 = icmp eq ptr %350, %351, !dbg !1319
  br i1 %352, label %353, label %354, !dbg !1320

353:                                              ; preds = %349
  store i8 1, ptr @pending_cr, align 1, !dbg !1321
  br label %359, !dbg !1322

354:                                              ; preds = %349
  %355 = load ptr, ptr %27, align 8, !dbg !1323
  %356 = getelementptr inbounds i8, ptr %355, i32 1, !dbg !1323
  store ptr %356, ptr %27, align 8, !dbg !1323
  store i8 94, ptr %355, align 1, !dbg !1325
  %357 = load ptr, ptr %27, align 8, !dbg !1326
  %358 = getelementptr inbounds i8, ptr %357, i32 1, !dbg !1326
  store ptr %358, ptr %27, align 8, !dbg !1326
  store i8 77, ptr %357, align 1, !dbg !1327
  br label %359

359:                                              ; preds = %354, %353
  br label %364, !dbg !1328

360:                                              ; preds = %346, %341, %337
  %361 = load i8, ptr %22, align 1, !dbg !1329
  %362 = load ptr, ptr %27, align 8, !dbg !1330
  %363 = getelementptr inbounds i8, ptr %362, i32 1, !dbg !1330
  store ptr %363, ptr %27, align 8, !dbg !1330
  store i8 %361, ptr %362, align 1, !dbg !1331
  br label %364

364:                                              ; preds = %360, %359
  br label %366, !dbg !1332

365:                                              ; preds = %333
  store i32 -1, ptr %23, align 4, !dbg !1333
  br label %371, !dbg !1335

366:                                              ; preds = %364
  br label %367

367:                                              ; preds = %366, %324
  %368 = load ptr, ptr %26, align 8, !dbg !1336
  %369 = getelementptr inbounds i8, ptr %368, i32 1, !dbg !1336
  store ptr %369, ptr %26, align 8, !dbg !1336
  %370 = load i8, ptr %368, align 1, !dbg !1337
  store i8 %370, ptr %22, align 1, !dbg !1338
  br label %317, !dbg !1283, !llvm.loop !1339

371:                                              ; preds = %365
  br label %372

372:                                              ; preds = %371, %315
  br label %44, !dbg !972, !llvm.loop !1341

373:                                              ; preds = %146, %136, %112
  %374 = load i1, ptr %11, align 1, !dbg !1343
  ret i1 %374, !dbg !1343
}

declare void @alignfree(ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #1

declare i32 @close(i32 noundef) #2

declare i64 @full_write(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define internal void @write_error() #4 !dbg !1344 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata ptr %1, metadata !1345, metadata !DIExpression()), !dbg !1346
  %2 = call ptr @__errno_location() #16, !dbg !1347
  %3 = load i32, ptr %2, align 4, !dbg !1347
  store i32 %3, ptr %1, align 4, !dbg !1346
  %4 = load ptr, ptr @stdout, align 8, !dbg !1348
  %5 = call i32 @fflush_unlocked(ptr noundef %4), !dbg !1348
  %6 = load ptr, ptr @stdout, align 8, !dbg !1349
  %7 = call i32 @fpurge(ptr noundef %6), !dbg !1350
  %8 = load ptr, ptr @stdout, align 8, !dbg !1351
  call void @clearerr_unlocked(ptr noundef %8) #12, !dbg !1351
  %9 = load i32, ptr %1, align 4, !dbg !1352
  %10 = call ptr @gettext(ptr noundef @.str.49) #12, !dbg !1352
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %9, ptr noundef %10) #17, !dbg !1352
  unreachable, !dbg !1352
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #11

declare void @emit_bug_reporting_address() #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #1

declare i64 @rpl_copy_file_range(i32 noundef, ptr noundef, i32 noundef, ptr noundef, i64 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define internal zeroext i1 @is_ENOTSUP(i32 noundef %0) #4 !dbg !1353 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1356, metadata !DIExpression()), !dbg !1357
  %3 = load i32, ptr %2, align 4, !dbg !1358
  %4 = icmp eq i32 %3, 95, !dbg !1359
  br i1 %4, label %6, label %5, !dbg !1360

5:                                                ; preds = %1
  br label %6, !dbg !1360

6:                                                ; preds = %5, %1
  %7 = phi i1 [ true, %1 ], [ false, %5 ]
  ret i1 %7, !dbg !1361
}

declare i64 @safe_read(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #11

; Function Attrs: nounwind
declare i32 @ioctl(i32 noundef, i64 noundef, ...) #3

declare ptr @quotearg_style(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define internal void @write_pending(ptr noundef %0, ptr noundef %1) #4 !dbg !1362 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1365, metadata !DIExpression()), !dbg !1366
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1367, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1369, metadata !DIExpression()), !dbg !1370
  %6 = load ptr, ptr %4, align 8, !dbg !1371
  %7 = load ptr, ptr %6, align 8, !dbg !1372
  %8 = load ptr, ptr %3, align 8, !dbg !1373
  %9 = ptrtoint ptr %7 to i64, !dbg !1374
  %10 = ptrtoint ptr %8 to i64, !dbg !1374
  %11 = sub i64 %9, %10, !dbg !1374
  store i64 %11, ptr %5, align 8, !dbg !1370
  %12 = load i64, ptr %5, align 8, !dbg !1375
  %13 = icmp slt i64 0, %12, !dbg !1377
  br i1 %13, label %14, label %24, !dbg !1378

14:                                               ; preds = %2
  %15 = load ptr, ptr %3, align 8, !dbg !1379
  %16 = load i64, ptr %5, align 8, !dbg !1382
  %17 = call i64 @full_write(i32 noundef 1, ptr noundef %15, i64 noundef %16), !dbg !1383
  %18 = load i64, ptr %5, align 8, !dbg !1384
  %19 = icmp ne i64 %17, %18, !dbg !1385
  br i1 %19, label %20, label %21, !dbg !1386

20:                                               ; preds = %14
  call void @write_error(), !dbg !1387
  br label %21, !dbg !1387

21:                                               ; preds = %20, %14
  %22 = load ptr, ptr %3, align 8, !dbg !1388
  %23 = load ptr, ptr %4, align 8, !dbg !1389
  store ptr %22, ptr %23, align 8, !dbg !1390
  br label %24, !dbg !1391

24:                                               ; preds = %21, %2
  ret void, !dbg !1392
}

; Function Attrs: noinline nounwind uwtable
define internal void @next_line_num() #4 !dbg !1393 {
  %1 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !1394, metadata !DIExpression()), !dbg !1395
  %2 = load ptr, ptr @line_num_end, align 8, !dbg !1396
  store ptr %2, ptr %1, align 8, !dbg !1395
  br label %3, !dbg !1397

3:                                                ; preds = %13, %0
  %4 = load ptr, ptr %1, align 8, !dbg !1398
  %5 = load i8, ptr %4, align 1, !dbg !1401
  %6 = add i8 %5, 1, !dbg !1401
  store i8 %6, ptr %4, align 1, !dbg !1401
  %7 = sext i8 %5 to i32, !dbg !1402
  %8 = icmp slt i32 %7, 57, !dbg !1403
  br i1 %8, label %9, label %10, !dbg !1404

9:                                                ; preds = %3
  br label %31, !dbg !1405

10:                                               ; preds = %3
  %11 = load ptr, ptr %1, align 8, !dbg !1406
  %12 = getelementptr inbounds i8, ptr %11, i32 -1, !dbg !1406
  store ptr %12, ptr %1, align 8, !dbg !1406
  store i8 48, ptr %11, align 1, !dbg !1407
  br label %13, !dbg !1408

13:                                               ; preds = %10
  %14 = load ptr, ptr %1, align 8, !dbg !1409
  %15 = load ptr, ptr @line_num_start, align 8, !dbg !1410
  %16 = icmp uge ptr %14, %15, !dbg !1411
  br i1 %16, label %3, label %17, !dbg !1408, !llvm.loop !1412

17:                                               ; preds = %13
  %18 = load ptr, ptr @line_num_start, align 8, !dbg !1414
  %19 = icmp ugt ptr %18, @line_buf, !dbg !1416
  br i1 %19, label %20, label %23, !dbg !1417

20:                                               ; preds = %17
  %21 = load ptr, ptr @line_num_start, align 8, !dbg !1418
  %22 = getelementptr inbounds i8, ptr %21, i32 -1, !dbg !1418
  store ptr %22, ptr @line_num_start, align 8, !dbg !1418
  store i8 49, ptr %22, align 1, !dbg !1419
  br label %24, !dbg !1420

23:                                               ; preds = %17
  store i8 62, ptr @line_buf, align 16, !dbg !1421
  br label %24

24:                                               ; preds = %23, %20
  %25 = load ptr, ptr @line_num_start, align 8, !dbg !1422
  %26 = load ptr, ptr @line_num_print, align 8, !dbg !1424
  %27 = icmp ult ptr %25, %26, !dbg !1425
  br i1 %27, label %28, label %31, !dbg !1426

28:                                               ; preds = %24
  %29 = load ptr, ptr @line_num_print, align 8, !dbg !1427
  %30 = getelementptr inbounds i8, ptr %29, i32 -1, !dbg !1427
  store ptr %30, ptr @line_num_print, align 8, !dbg !1427
  br label %31, !dbg !1428

31:                                               ; preds = %9, %28, %24
  ret void, !dbg !1429
}

; Function Attrs: nounwind
declare ptr @stpcpy(ptr noundef, ptr noundef) #3

declare i32 @fflush_unlocked(ptr noundef) #2

declare i32 @fpurge(ptr noundef) #2

; Function Attrs: nounwind
declare void @clearerr_unlocked(ptr noundef) #3

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #12 = { nounwind }
attributes #13 = { noreturn nounwind }
attributes #14 = { nounwind willreturn memory(read) }
attributes #15 = { noreturn }
attributes #16 = { nounwind willreturn memory(none) }
attributes #17 = { cold }
attributes #18 = { allocsize(1) }

!llvm.dbg.cu = !{!52}
!llvm.module.flags = !{!284, !285, !286, !287, !288, !289, !290}
!llvm.ident = !{!291}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 87, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "inputs/otherInputs/catCU/catOP.c", directory: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli", checksumkind: CSK_MD5, checksum: "d7786fab9352ce2571dfe43048d42415")
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
!45 = distinct !DIGlobalVariable(name: "long_options", scope: !46, file: !2, line: 546, type: !274, isLocal: true, isDefinition: true)
!46 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 530, type: !47, scopeLine: 531, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !52, retainedNodes: !273)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!52 = distinct !DICompileUnit(language: DW_LANG_C11, file: !53, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !54, retainedTypes: !88, globals: !94, splitDebugInlining: false, nameTableKind: None)
!53 = !DIFile(filename: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/otherInputs/catCU/catOP.c", directory: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "d7786fab9352ce2571dfe43048d42415")
!54 = !{!55, !60, !75, !84}
!55 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !56, line: 302, baseType: !49, size: 32, elements: !57)
!56 = !DIFile(filename: "coreutils/src/system.h", directory: "/home/felicitas/Desktop/DOC/MM", checksumkind: CSK_MD5, checksum: "92e5fbfd24e0c15a11a979ebe932d636")
!57 = !{!58, !59}
!58 = !DIEnumerator(name: "GETOPT_HELP_CHAR", value: -130)
!59 = !DIEnumerator(name: "GETOPT_VERSION_CHAR", value: -131)
!60 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "quoting_style", file: !61, line: 42, baseType: !62, size: 32, elements: !63)
!61 = !DIFile(filename: "coreutils/lib/quotearg.h", directory: "/home/felicitas/Desktop/DOC/MM", checksumkind: CSK_MD5, checksum: "f10dd3600418f68d04449866ba8ba7b6")
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
!75 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !76, line: 44, baseType: !62, size: 32, elements: !77)
!76 = !DIFile(filename: "coreutils/lib/fadvise.h", directory: "/home/felicitas/Desktop/DOC/MM", checksumkind: CSK_MD5, checksum: "297997f3abc0c062b01935a648f2a046")
!77 = !{!78, !79, !80, !81, !82, !83}
!78 = !DIEnumerator(name: "FADVISE_NORMAL", value: 0)
!79 = !DIEnumerator(name: "FADVISE_SEQUENTIAL", value: 2)
!80 = !DIEnumerator(name: "FADVISE_NOREUSE", value: 5)
!81 = !DIEnumerator(name: "FADVISE_DONTNEED", value: 4)
!82 = !DIEnumerator(name: "FADVISE_WILLNEED", value: 3)
!83 = !DIEnumerator(name: "FADVISE_RANDOM", value: 1)
!84 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !85, line: 78, baseType: !62, size: 32, elements: !86)
!85 = !DIFile(filename: "coreutils/src/ioblksize.h", directory: "/home/felicitas/Desktop/DOC/MM", checksumkind: CSK_MD5, checksum: "2998e8d108a2ac8d0ff710ad69cfcb06")
!86 = !{!87}
!87 = !DIEnumerator(name: "IO_BUFSIZE", value: 262144)
!88 = !{!89, !51, !90, !91, !62}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!90 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !92, line: 18, baseType: !93)
!92 = !DIFile(filename: "/usr/lib/llvm-18/lib/clang/18/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!93 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!94 = !{!0, !7, !9, !14, !19, !24, !29, !34, !39, !95, !100, !105, !110, !115, !120, !122, !127, !132, !44, !137, !142, !144, !149, !154, !156, !161, !166, !171, !173, !178, !183, !188, !190, !195, !199, !201, !206, !208, !210, !215, !217, !222, !224, !226, !228, !230, !235, !237, !242, !247, !252, !257, !259, !261, !263, !265, !267, !269, !271}
!95 = !DIGlobalVariableExpression(var: !96, expr: !DIExpression())
!96 = distinct !DIGlobalVariable(scope: null, file: !2, line: 548, type: !97, isLocal: true, isDefinition: true)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 16)
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(scope: null, file: !2, line: 549, type: !102, isLocal: true, isDefinition: true)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !103)
!103 = !{!104}
!104 = !DISubrange(count: 7)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression())
!106 = distinct !DIGlobalVariable(scope: null, file: !2, line: 550, type: !107, isLocal: true, isDefinition: true)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 14)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(scope: null, file: !2, line: 551, type: !112, isLocal: true, isDefinition: true)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: 17)
!115 = !DIGlobalVariableExpression(var: !116, expr: !DIExpression())
!116 = distinct !DIGlobalVariable(scope: null, file: !2, line: 552, type: !117, isLocal: true, isDefinition: true)
!117 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !118)
!118 = !{!119}
!119 = !DISubrange(count: 10)
!120 = !DIGlobalVariableExpression(var: !121, expr: !DIExpression())
!121 = distinct !DIGlobalVariable(scope: null, file: !2, line: 553, type: !117, isLocal: true, isDefinition: true)
!122 = !DIGlobalVariableExpression(var: !123, expr: !DIExpression())
!123 = distinct !DIGlobalVariable(scope: null, file: !2, line: 554, type: !124, isLocal: true, isDefinition: true)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 9)
!127 = !DIGlobalVariableExpression(var: !128, expr: !DIExpression())
!128 = distinct !DIGlobalVariable(scope: null, file: !2, line: 555, type: !129, isLocal: true, isDefinition: true)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !130)
!130 = !{!131}
!131 = !DISubrange(count: 5)
!132 = !DIGlobalVariableExpression(var: !133, expr: !DIExpression())
!133 = distinct !DIGlobalVariable(scope: null, file: !2, line: 556, type: !134, isLocal: true, isDefinition: true)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 8)
!137 = !DIGlobalVariableExpression(var: !138, expr: !DIExpression())
!138 = distinct !DIGlobalVariable(scope: null, file: !2, line: 562, type: !139, isLocal: true, isDefinition: true)
!139 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 8, elements: !140)
!140 = !{!141}
!141 = !DISubrange(count: 1)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(scope: null, file: !2, line: 563, type: !117, isLocal: true, isDefinition: true)
!144 = !DIGlobalVariableExpression(var: !145, expr: !DIExpression())
!145 = distinct !DIGlobalVariable(scope: null, file: !2, line: 563, type: !146, isLocal: true, isDefinition: true)
!146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !147)
!147 = !{!148}
!148 = !DISubrange(count: 24)
!149 = !DIGlobalVariableExpression(var: !150, expr: !DIExpression())
!150 = distinct !DIGlobalVariable(scope: null, file: !2, line: 575, type: !151, isLocal: true, isDefinition: true)
!151 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !152)
!152 = !{!153}
!153 = !DISubrange(count: 11)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(scope: null, file: !2, line: 627, type: !107, isLocal: true, isDefinition: true)
!156 = !DIGlobalVariableExpression(var: !157, expr: !DIExpression())
!157 = distinct !DIGlobalVariable(scope: null, file: !2, line: 627, type: !158, isLocal: true, isDefinition: true)
!158 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !159)
!159 = !{!160}
!160 = !DISubrange(count: 18)
!161 = !DIGlobalVariableExpression(var: !162, expr: !DIExpression())
!162 = distinct !DIGlobalVariable(scope: null, file: !2, line: 627, type: !163, isLocal: true, isDefinition: true)
!163 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !164)
!164 = !{!165}
!165 = !DISubrange(count: 19)
!166 = !DIGlobalVariableExpression(var: !167, expr: !DIExpression())
!167 = distinct !DIGlobalVariable(scope: null, file: !2, line: 627, type: !168, isLocal: true, isDefinition: true)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !169)
!169 = !{!170}
!170 = !DISubrange(count: 20)
!171 = !DIGlobalVariableExpression(var: !172, expr: !DIExpression())
!172 = distinct !DIGlobalVariable(scope: null, file: !2, line: 637, type: !97, isLocal: true, isDefinition: true)
!173 = !DIGlobalVariableExpression(var: !174, expr: !DIExpression())
!174 = distinct !DIGlobalVariable(scope: null, file: !2, line: 664, type: !175, isLocal: true, isDefinition: true)
!175 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !176)
!176 = !{!177}
!177 = !DISubrange(count: 2)
!178 = !DIGlobalVariableExpression(var: !179, expr: !DIExpression())
!179 = distinct !DIGlobalVariable(scope: null, file: !2, line: 687, type: !180, isLocal: true, isDefinition: true)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 3)
!183 = !DIGlobalVariableExpression(var: !184, expr: !DIExpression())
!184 = distinct !DIGlobalVariable(scope: null, file: !2, line: 720, type: !185, isLocal: true, isDefinition: true)
!185 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 240, elements: !186)
!186 = !{!187}
!187 = !DISubrange(count: 30)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(scope: null, file: !2, line: 805, type: !175, isLocal: true, isDefinition: true)
!190 = !DIGlobalVariableExpression(var: !191, expr: !DIExpression())
!191 = distinct !DIGlobalVariable(scope: null, file: !2, line: 810, type: !192, isLocal: true, isDefinition: true)
!192 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 184, elements: !193)
!193 = !{!194}
!194 = !DISubrange(count: 23)
!195 = !DIGlobalVariableExpression(var: !196, expr: !DIExpression())
!196 = distinct !DIGlobalVariable(name: "infile", scope: !52, file: !2, line: 51, type: !197, isLocal: true, isDefinition: true)
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!198 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!199 = !DIGlobalVariableExpression(var: !200, expr: !DIExpression())
!200 = distinct !DIGlobalVariable(name: "input_desc", scope: !52, file: !2, line: 54, type: !49, isLocal: true, isDefinition: true)
!201 = !DIGlobalVariableExpression(var: !202, expr: !DIExpression())
!202 = distinct !DIGlobalVariable(scope: null, file: !56, line: 533, type: !203, isLocal: true, isDefinition: true)
!203 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 448, elements: !204)
!204 = !{!205}
!205 = !DISubrange(count: 56)
!206 = !DIGlobalVariableExpression(var: !207, expr: !DIExpression())
!207 = distinct !DIGlobalVariable(scope: null, file: !56, line: 634, type: !175, isLocal: true, isDefinition: true)
!208 = !DIGlobalVariableExpression(var: !209, expr: !DIExpression())
!209 = distinct !DIGlobalVariable(scope: null, file: !56, line: 634, type: !97, isLocal: true, isDefinition: true)
!210 = !DIGlobalVariableExpression(var: !211, expr: !DIExpression())
!211 = distinct !DIGlobalVariable(scope: null, file: !56, line: 635, type: !212, isLocal: true, isDefinition: true)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !213)
!213 = !{!214}
!214 = !DISubrange(count: 22)
!215 = !DIGlobalVariableExpression(var: !216, expr: !DIExpression())
!216 = distinct !DIGlobalVariable(scope: null, file: !56, line: 636, type: !117, isLocal: true, isDefinition: true)
!217 = !DIGlobalVariableExpression(var: !218, expr: !DIExpression())
!218 = distinct !DIGlobalVariable(scope: null, file: !56, line: 636, type: !219, isLocal: true, isDefinition: true)
!219 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !220)
!220 = !{!221}
!221 = !DISubrange(count: 15)
!222 = !DIGlobalVariableExpression(var: !223, expr: !DIExpression())
!223 = distinct !DIGlobalVariable(scope: null, file: !56, line: 637, type: !117, isLocal: true, isDefinition: true)
!224 = !DIGlobalVariableExpression(var: !225, expr: !DIExpression())
!225 = distinct !DIGlobalVariable(scope: null, file: !56, line: 638, type: !117, isLocal: true, isDefinition: true)
!226 = !DIGlobalVariableExpression(var: !227, expr: !DIExpression())
!227 = distinct !DIGlobalVariable(scope: null, file: !56, line: 639, type: !117, isLocal: true, isDefinition: true)
!228 = !DIGlobalVariableExpression(var: !229, expr: !DIExpression())
!229 = distinct !DIGlobalVariable(scope: null, file: !56, line: 657, type: !41, isLocal: true, isDefinition: true)
!230 = !DIGlobalVariableExpression(var: !231, expr: !DIExpression())
!231 = distinct !DIGlobalVariable(scope: null, file: !56, line: 663, type: !232, isLocal: true, isDefinition: true)
!232 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 568, elements: !233)
!233 = !{!234}
!234 = !DISubrange(count: 71)
!235 = !DIGlobalVariableExpression(var: !236, expr: !DIExpression())
!236 = distinct !DIGlobalVariable(scope: null, file: !56, line: 669, type: !129, isLocal: true, isDefinition: true)
!237 = !DIGlobalVariableExpression(var: !238, expr: !DIExpression())
!238 = distinct !DIGlobalVariable(scope: null, file: !56, line: 670, type: !239, isLocal: true, isDefinition: true)
!239 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !240)
!240 = !{!241}
!241 = !DISubrange(count: 27)
!242 = !DIGlobalVariableExpression(var: !243, expr: !DIExpression())
!243 = distinct !DIGlobalVariable(scope: null, file: !56, line: 671, type: !244, isLocal: true, isDefinition: true)
!244 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !245)
!245 = !{!246}
!246 = !DISubrange(count: 40)
!247 = !DIGlobalVariableExpression(var: !248, expr: !DIExpression())
!248 = distinct !DIGlobalVariable(scope: null, file: !56, line: 672, type: !249, isLocal: true, isDefinition: true)
!249 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 408, elements: !250)
!250 = !{!251}
!251 = !DISubrange(count: 51)
!252 = !DIGlobalVariableExpression(var: !253, expr: !DIExpression())
!253 = distinct !DIGlobalVariable(scope: null, file: !56, line: 673, type: !254, isLocal: true, isDefinition: true)
!254 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !255)
!255 = !{!256}
!256 = !DISubrange(count: 12)
!257 = !DIGlobalVariableExpression(var: !258, expr: !DIExpression())
!258 = distinct !DIGlobalVariable(scope: null, file: !2, line: 295, type: !212, isLocal: true, isDefinition: true)
!259 = !DIGlobalVariableExpression(var: !260, expr: !DIExpression())
!260 = distinct !DIGlobalVariable(name: "newlines2", scope: !52, file: !2, line: 78, type: !49, isLocal: true, isDefinition: true)
!261 = !DIGlobalVariableExpression(var: !262, expr: !DIExpression())
!262 = distinct !DIGlobalVariable(name: "line_num_end", scope: !52, file: !2, line: 75, type: !51, isLocal: true, isDefinition: true)
!263 = !DIGlobalVariableExpression(var: !264, expr: !DIExpression())
!264 = distinct !DIGlobalVariable(name: "line_num_start", scope: !52, file: !2, line: 72, type: !51, isLocal: true, isDefinition: true)
!265 = !DIGlobalVariableExpression(var: !266, expr: !DIExpression())
!266 = distinct !DIGlobalVariable(name: "line_buf", scope: !52, file: !2, line: 60, type: !168, isLocal: true, isDefinition: true)
!267 = !DIGlobalVariableExpression(var: !268, expr: !DIExpression())
!268 = distinct !DIGlobalVariable(name: "line_num_print", scope: !52, file: !2, line: 69, type: !51, isLocal: true, isDefinition: true)
!269 = !DIGlobalVariableExpression(var: !270, expr: !DIExpression())
!270 = distinct !DIGlobalVariable(name: "pending_cr", scope: !52, file: !2, line: 81, type: !90, isLocal: true, isDefinition: true)
!271 = !DIGlobalVariableExpression(var: !272, expr: !DIExpression())
!272 = distinct !DIGlobalVariable(scope: null, file: !56, line: 747, type: !254, isLocal: true, isDefinition: true)
!273 = !{}
!274 = !DICompositeType(tag: DW_TAG_array_type, baseType: !275, size: 2560, elements: !118)
!275 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !276)
!276 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "option", file: !277, line: 50, size: 256, elements: !278)
!277 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/getopt_ext.h", directory: "", checksumkind: CSK_MD5, checksum: "3b9516601798e99ca8a1ad9f5208e7ec")
!278 = !{!279, !280, !281, !283}
!279 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !276, file: !277, line: 52, baseType: !197, size: 64)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "has_arg", scope: !276, file: !277, line: 55, baseType: !49, size: 32, offset: 64)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !276, file: !277, line: 56, baseType: !282, size: 64, offset: 128)
!282 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!283 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !276, file: !277, line: 57, baseType: !49, size: 32, offset: 192)
!284 = !{i32 7, !"Dwarf Version", i32 5}
!285 = !{i32 2, !"Debug Info Version", i32 3}
!286 = !{i32 1, !"wchar_size", i32 4}
!287 = !{i32 8, !"PIC Level", i32 2}
!288 = !{i32 7, !"PIE Level", i32 2}
!289 = !{i32 7, !"uwtable", i32 2}
!290 = !{i32 7, !"frame-pointer", i32 2}
!291 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!292 = distinct !DISubprogram(name: "usage", scope: !2, file: !2, line: 84, type: !293, scopeLine: 85, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !52, retainedNodes: !273)
!293 = !DISubroutineType(types: !294)
!294 = !{null, !49}
!295 = !DILocalVariable(name: "status", arg: 1, scope: !292, file: !2, line: 84, type: !49)
!296 = !DILocation(line: 84, column: 15, scope: !292)
!297 = !DILocation(line: 86, column: 10, scope: !298)
!298 = distinct !DILexicalBlock(scope: !292, file: !2, line: 86, column: 10)
!299 = !DILocation(line: 86, column: 17, scope: !298)
!300 = !DILocation(line: 86, column: 10, scope: !292)
!301 = !DILocation(line: 87, column: 8, scope: !298)
!302 = !DILocation(line: 87, column: 8, scope: !303)
!303 = distinct !DILexicalBlock(scope: !298, file: !2, line: 87, column: 8)
!304 = !DILocation(line: 90, column: 18, scope: !305)
!305 = distinct !DILexicalBlock(scope: !298, file: !2, line: 89, column: 8)
!306 = !DILocation(line: 93, column: 18, scope: !305)
!307 = !DILocation(line: 90, column: 10, scope: !305)
!308 = !DILocation(line: 94, column: 10, scope: !305)
!309 = !DILocation(line: 98, column: 10, scope: !305)
!310 = !DILocation(line: 100, column: 10, scope: !305)
!311 = !DILocation(line: 109, column: 10, scope: !305)
!312 = !DILocation(line: 115, column: 10, scope: !305)
!313 = !DILocation(line: 116, column: 10, scope: !305)
!314 = !DILocation(line: 117, column: 18, scope: !305)
!315 = !DILocation(line: 123, column: 18, scope: !305)
!316 = !DILocation(line: 123, column: 32, scope: !305)
!317 = !DILocation(line: 117, column: 10, scope: !305)
!318 = !DILocation(line: 124, column: 10, scope: !305)
!319 = !DILocation(line: 126, column: 12, scope: !292)
!320 = !DILocation(line: 126, column: 6, scope: !292)
!321 = distinct !DISubprogram(name: "emit_stdin_note", scope: !56, file: !56, line: 531, type: !322, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52)
!322 = !DISubroutineType(types: !323)
!323 = !{null}
!324 = !DILocation(line: 533, column: 3, scope: !321)
!325 = !DILocation(line: 536, column: 1, scope: !321)
!326 = distinct !DISubprogram(name: "emit_ancillary_info", scope: !56, file: !56, line: 631, type: !327, scopeLine: 632, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!327 = !DISubroutineType(types: !328)
!328 = !{null, !197}
!329 = !DILocalVariable(name: "program", arg: 1, scope: !326, file: !56, line: 631, type: !197)
!330 = !DILocation(line: 631, column: 34, scope: !326)
!331 = !DILocalVariable(name: "infomap", scope: !326, file: !56, line: 633, type: !332)
!332 = !DICompositeType(tag: DW_TAG_array_type, baseType: !333, size: 896, elements: !103)
!333 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !334)
!334 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "infomap", scope: !326, file: !56, line: 633, size: 128, elements: !335)
!335 = !{!336, !337}
!336 = !DIDerivedType(tag: DW_TAG_member, name: "program", scope: !334, file: !56, line: 633, baseType: !197, size: 64)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "node", scope: !334, file: !56, line: 633, baseType: !197, size: 64, offset: 64)
!338 = !DILocation(line: 633, column: 67, scope: !326)
!339 = !DILocalVariable(name: "node", scope: !326, file: !56, line: 643, type: !197)
!340 = !DILocation(line: 643, column: 15, scope: !326)
!341 = !DILocation(line: 643, column: 22, scope: !326)
!342 = !DILocalVariable(name: "map_prog", scope: !326, file: !56, line: 644, type: !343)
!343 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !333, size: 64)
!344 = !DILocation(line: 644, column: 25, scope: !326)
!345 = !DILocation(line: 644, column: 36, scope: !326)
!346 = !DILocation(line: 646, column: 3, scope: !326)
!347 = !DILocation(line: 646, column: 10, scope: !326)
!348 = !DILocation(line: 646, column: 20, scope: !326)
!349 = !DILocation(line: 646, column: 28, scope: !326)
!350 = !DILocation(line: 646, column: 33, scope: !326)
!351 = !DILocation(line: 646, column: 31, scope: !326)
!352 = !DILocation(line: 0, scope: !326)
!353 = !DILocation(line: 647, column: 13, scope: !326)
!354 = distinct !{!354, !346, !353, !355}
!355 = !{!"llvm.loop.mustprogress"}
!356 = !DILocation(line: 649, column: 7, scope: !357)
!357 = distinct !DILexicalBlock(scope: !326, file: !56, line: 649, column: 7)
!358 = !DILocation(line: 649, column: 17, scope: !357)
!359 = !DILocation(line: 649, column: 7, scope: !326)
!360 = !DILocation(line: 650, column: 12, scope: !357)
!361 = !DILocation(line: 650, column: 22, scope: !357)
!362 = !DILocation(line: 650, column: 10, scope: !357)
!363 = !DILocation(line: 650, column: 5, scope: !357)
!364 = !DILocation(line: 652, column: 3, scope: !326)
!365 = !DILocalVariable(name: "lc_messages", scope: !326, file: !56, line: 656, type: !197)
!366 = !DILocation(line: 656, column: 15, scope: !326)
!367 = !DILocation(line: 656, column: 29, scope: !326)
!368 = !DILocation(line: 657, column: 7, scope: !369)
!369 = distinct !DILexicalBlock(scope: !326, file: !56, line: 657, column: 7)
!370 = !DILocation(line: 657, column: 19, scope: !369)
!371 = !DILocation(line: 657, column: 22, scope: !369)
!372 = !DILocation(line: 657, column: 7, scope: !326)
!373 = !DILocation(line: 663, column: 7, scope: !374)
!374 = distinct !DILexicalBlock(scope: !369, file: !56, line: 658, column: 5)
!375 = !DILocation(line: 665, column: 5, scope: !374)
!376 = !DILocalVariable(name: "url_program", scope: !326, file: !56, line: 669, type: !197)
!377 = !DILocation(line: 669, column: 15, scope: !326)
!378 = !DILocation(line: 669, column: 29, scope: !326)
!379 = !DILocation(line: 669, column: 61, scope: !326)
!380 = !DILocation(line: 670, column: 11, scope: !326)
!381 = !DILocation(line: 671, column: 24, scope: !326)
!382 = !DILocation(line: 670, column: 3, scope: !326)
!383 = !DILocation(line: 672, column: 11, scope: !326)
!384 = !DILocation(line: 673, column: 11, scope: !326)
!385 = !DILocation(line: 673, column: 17, scope: !326)
!386 = !DILocation(line: 673, column: 25, scope: !326)
!387 = !DILocation(line: 673, column: 22, scope: !326)
!388 = !DILocation(line: 672, column: 3, scope: !326)
!389 = !DILocation(line: 674, column: 1, scope: !326)
!390 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !2, line: 530, type: !49)
!391 = !DILocation(line: 530, column: 14, scope: !46)
!392 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !2, line: 530, type: !50)
!393 = !DILocation(line: 530, column: 27, scope: !46)
!394 = !DILocalVariable(name: "have_read_stdin", scope: !46, file: !2, line: 533, type: !90)
!395 = !DILocation(line: 533, column: 11, scope: !46)
!396 = !DILocalVariable(name: "stat_buf", scope: !46, file: !2, line: 535, type: !397)
!397 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !398, line: 26, size: 1152, elements: !399)
!398 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_stat.h", directory: "", checksumkind: CSK_MD5, checksum: "59591d2af474d06a64835bfc23e4bb5d")
!399 = !{!400, !403, !405, !407, !409, !411, !413, !414, !415, !418, !420, !422, !430, !431, !432}
!400 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !397, file: !398, line: 31, baseType: !401, size: 64)
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !402, line: 145, baseType: !93)
!402 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e1865d9fe29fe1b5ced550b7ba458f9e")
!403 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !397, file: !398, line: 36, baseType: !404, size: 64, offset: 64)
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !402, line: 148, baseType: !93)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !397, file: !398, line: 44, baseType: !406, size: 64, offset: 128)
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !402, line: 151, baseType: !93)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !397, file: !398, line: 45, baseType: !408, size: 32, offset: 192)
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !402, line: 150, baseType: !62)
!409 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !397, file: !398, line: 47, baseType: !410, size: 32, offset: 224)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !402, line: 146, baseType: !62)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !397, file: !398, line: 48, baseType: !412, size: 32, offset: 256)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !402, line: 147, baseType: !62)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !397, file: !398, line: 50, baseType: !49, size: 32, offset: 288)
!414 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !397, file: !398, line: 52, baseType: !401, size: 64, offset: 320)
!415 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !397, file: !398, line: 57, baseType: !416, size: 64, offset: 384)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !402, line: 152, baseType: !417)
!417 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !397, file: !398, line: 61, baseType: !419, size: 64, offset: 448)
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !402, line: 175, baseType: !417)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !397, file: !398, line: 63, baseType: !421, size: 64, offset: 512)
!421 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !402, line: 180, baseType: !417)
!422 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !397, file: !398, line: 74, baseType: !423, size: 128, offset: 576)
!423 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !424, line: 11, size: 128, elements: !425)
!424 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!425 = !{!426, !428}
!426 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !423, file: !424, line: 16, baseType: !427, size: 64)
!427 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !402, line: 160, baseType: !417)
!428 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !423, file: !424, line: 21, baseType: !429, size: 64, offset: 64)
!429 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !402, line: 197, baseType: !417)
!430 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !397, file: !398, line: 75, baseType: !423, size: 128, offset: 704)
!431 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !397, file: !398, line: 76, baseType: !423, size: 128, offset: 832)
!432 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !397, file: !398, line: 89, baseType: !433, size: 192, offset: 960)
!433 = !DICompositeType(tag: DW_TAG_array_type, baseType: !429, size: 192, elements: !181)
!434 = !DILocation(line: 535, column: 18, scope: !46)
!435 = !DILocalVariable(name: "number", scope: !46, file: !2, line: 538, type: !90)
!436 = !DILocation(line: 538, column: 11, scope: !46)
!437 = !DILocalVariable(name: "number_nonblank", scope: !46, file: !2, line: 539, type: !90)
!438 = !DILocation(line: 539, column: 11, scope: !46)
!439 = !DILocalVariable(name: "squeeze_blank", scope: !46, file: !2, line: 540, type: !90)
!440 = !DILocation(line: 540, column: 11, scope: !46)
!441 = !DILocalVariable(name: "show_ends", scope: !46, file: !2, line: 541, type: !90)
!442 = !DILocation(line: 541, column: 11, scope: !46)
!443 = !DILocalVariable(name: "show_nonprinting", scope: !46, file: !2, line: 542, type: !90)
!444 = !DILocation(line: 542, column: 11, scope: !46)
!445 = !DILocalVariable(name: "show_tabs", scope: !46, file: !2, line: 543, type: !90)
!446 = !DILocation(line: 543, column: 11, scope: !46)
!447 = !DILocalVariable(name: "file_open_mode", scope: !46, file: !2, line: 544, type: !49)
!448 = !DILocation(line: 544, column: 10, scope: !46)
!449 = !DILocation(line: 561, column: 24, scope: !46)
!450 = !DILocation(line: 561, column: 6, scope: !46)
!451 = !DILocation(line: 562, column: 6, scope: !46)
!452 = !DILocation(line: 563, column: 6, scope: !46)
!453 = !DILocation(line: 564, column: 6, scope: !46)
!454 = !DILocation(line: 570, column: 6, scope: !46)
!455 = !DILocalVariable(name: "c", scope: !46, file: !2, line: 574, type: !49)
!456 = !DILocation(line: 574, column: 10, scope: !46)
!457 = !DILocation(line: 575, column: 6, scope: !46)
!458 = !DILocation(line: 575, column: 31, scope: !46)
!459 = !DILocation(line: 575, column: 37, scope: !46)
!460 = !DILocation(line: 575, column: 18, scope: !46)
!461 = !DILocation(line: 575, column: 16, scope: !46)
!462 = !DILocation(line: 575, column: 81, scope: !46)
!463 = !DILocation(line: 578, column: 18, scope: !464)
!464 = distinct !DILexicalBlock(scope: !46, file: !2, line: 577, column: 8)
!465 = !DILocation(line: 578, column: 10, scope: !464)
!466 = !DILocation(line: 581, column: 21, scope: !467)
!467 = distinct !DILexicalBlock(scope: !464, file: !2, line: 579, column: 12)
!468 = !DILocation(line: 582, column: 30, scope: !467)
!469 = !DILocation(line: 583, column: 14, scope: !467)
!470 = !DILocation(line: 586, column: 24, scope: !467)
!471 = !DILocation(line: 587, column: 31, scope: !467)
!472 = !DILocation(line: 588, column: 14, scope: !467)
!473 = !DILocation(line: 591, column: 21, scope: !467)
!474 = !DILocation(line: 592, column: 14, scope: !467)
!475 = !DILocation(line: 595, column: 28, scope: !467)
!476 = !DILocation(line: 596, column: 14, scope: !467)
!477 = !DILocation(line: 599, column: 24, scope: !467)
!478 = !DILocation(line: 600, column: 31, scope: !467)
!479 = !DILocation(line: 601, column: 14, scope: !467)
!480 = !DILocation(line: 605, column: 14, scope: !467)
!481 = !DILocation(line: 608, column: 31, scope: !467)
!482 = !DILocation(line: 609, column: 14, scope: !467)
!483 = !DILocation(line: 612, column: 31, scope: !467)
!484 = !DILocation(line: 613, column: 24, scope: !467)
!485 = !DILocation(line: 614, column: 24, scope: !467)
!486 = !DILocation(line: 615, column: 14, scope: !467)
!487 = !DILocation(line: 618, column: 24, scope: !467)
!488 = !DILocation(line: 619, column: 14, scope: !467)
!489 = !DILocation(line: 622, column: 24, scope: !467)
!490 = !DILocation(line: 623, column: 14, scope: !467)
!491 = !DILocation(line: 625, column: 12, scope: !467)
!492 = !DILocation(line: 627, column: 12, scope: !467)
!493 = !DILocation(line: 630, column: 14, scope: !467)
!494 = distinct !{!494, !457, !495, !355}
!495 = !DILocation(line: 632, column: 8, scope: !46)
!496 = !DILocation(line: 636, column: 10, scope: !497)
!497 = distinct !DILexicalBlock(scope: !46, file: !2, line: 636, column: 10)
!498 = !DILocation(line: 636, column: 43, scope: !497)
!499 = !DILocation(line: 636, column: 10, scope: !46)
!500 = !DILocation(line: 637, column: 8, scope: !497)
!501 = !DILocalVariable(name: "outsize", scope: !46, file: !2, line: 640, type: !502)
!502 = !DIDerivedType(tag: DW_TAG_typedef, name: "idx_t", file: !503, line: 130, baseType: !504)
!503 = !DIFile(filename: "coreutils/lib/idx.h", directory: "/home/felicitas/Desktop/DOC/MM", checksumkind: CSK_MD5, checksum: "9a27a7b69b899883fdd541cc17d53261")
!504 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", file: !505, line: 18, baseType: !417)
!505 = !DIFile(filename: "/usr/lib/llvm-18/lib/clang/18/include/__stddef_ptrdiff_t.h", directory: "", checksumkind: CSK_MD5, checksum: "21e0c40f3315797d915cc7ea60040a98")
!506 = !DILocation(line: 640, column: 12, scope: !46)
!507 = !DILocation(line: 640, column: 22, scope: !46)
!508 = !DILocalVariable(name: "out_dev", scope: !46, file: !2, line: 643, type: !509)
!509 = !DIDerivedType(tag: DW_TAG_typedef, name: "dev_t", file: !510, line: 59, baseType: !401)
!510 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "", checksumkind: CSK_MD5, checksum: "7fb02a803b0c9b11cb5276b77d21e9d8")
!511 = !DILocation(line: 643, column: 12, scope: !46)
!512 = !DILocalVariable(name: "out_ino", scope: !46, file: !2, line: 644, type: !513)
!513 = !DIDerivedType(tag: DW_TAG_typedef, name: "ino_t", file: !510, line: 47, baseType: !404)
!514 = !DILocation(line: 644, column: 12, scope: !46)
!515 = !DILocalVariable(name: "out_flags", scope: !46, file: !2, line: 645, type: !49)
!516 = !DILocation(line: 645, column: 10, scope: !46)
!517 = !DILocalVariable(name: "have_out_dev", scope: !46, file: !2, line: 646, type: !90)
!518 = !DILocation(line: 646, column: 11, scope: !46)
!519 = !DILocation(line: 646, column: 29, scope: !46)
!520 = !DILocation(line: 646, column: 53, scope: !46)
!521 = !DILocation(line: 646, column: 26, scope: !46)
!522 = !DILocation(line: 647, column: 10, scope: !523)
!523 = distinct !DILexicalBlock(scope: !46, file: !2, line: 647, column: 10)
!524 = !DILocation(line: 647, column: 10, scope: !46)
!525 = !DILocation(line: 649, column: 29, scope: !526)
!526 = distinct !DILexicalBlock(scope: !523, file: !2, line: 648, column: 8)
!527 = !DILocation(line: 649, column: 18, scope: !526)
!528 = !DILocation(line: 650, column: 29, scope: !526)
!529 = !DILocation(line: 650, column: 18, scope: !526)
!530 = !DILocation(line: 651, column: 7, scope: !526)
!531 = !DILocalVariable(name: "out_isreg", scope: !46, file: !2, line: 654, type: !90)
!532 = !DILocation(line: 654, column: 11, scope: !46)
!533 = !DILocation(line: 654, column: 23, scope: !46)
!534 = !DILocation(line: 654, column: 50, scope: !46)
!535 = !DILocation(line: 656, column: 13, scope: !536)
!536 = distinct !DILexicalBlock(scope: !46, file: !2, line: 656, column: 10)
!537 = !DILocation(line: 656, column: 20, scope: !536)
!538 = !DILocation(line: 656, column: 23, scope: !536)
!539 = !DILocation(line: 656, column: 33, scope: !536)
!540 = !DILocation(line: 656, column: 36, scope: !536)
!541 = !DILocation(line: 656, column: 10, scope: !46)
!542 = !DILocation(line: 658, column: 25, scope: !543)
!543 = distinct !DILexicalBlock(scope: !536, file: !2, line: 657, column: 8)
!544 = !DILocation(line: 659, column: 10, scope: !543)
!545 = !DILocation(line: 660, column: 8, scope: !543)
!546 = !DILocation(line: 664, column: 13, scope: !46)
!547 = !DILocalVariable(name: "argind", scope: !46, file: !2, line: 665, type: !49)
!548 = !DILocation(line: 665, column: 10, scope: !46)
!549 = !DILocation(line: 665, column: 19, scope: !46)
!550 = !DILocalVariable(name: "ok", scope: !46, file: !2, line: 666, type: !90)
!551 = !DILocation(line: 666, column: 11, scope: !46)
!552 = !DILocalVariable(name: "page_size", scope: !46, file: !2, line: 667, type: !502)
!553 = !DILocation(line: 667, column: 12, scope: !46)
!554 = !DILocation(line: 667, column: 24, scope: !46)
!555 = !DILocation(line: 669, column: 6, scope: !46)
!556 = !DILocation(line: 671, column: 14, scope: !557)
!557 = distinct !DILexicalBlock(scope: !558, file: !2, line: 671, column: 14)
!558 = distinct !DILexicalBlock(scope: !46, file: !2, line: 670, column: 8)
!559 = !DILocation(line: 671, column: 23, scope: !557)
!560 = !DILocation(line: 671, column: 21, scope: !557)
!561 = !DILocation(line: 671, column: 14, scope: !558)
!562 = !DILocation(line: 672, column: 21, scope: !557)
!563 = !DILocation(line: 672, column: 26, scope: !557)
!564 = !DILocation(line: 672, column: 19, scope: !557)
!565 = !DILocation(line: 672, column: 12, scope: !557)
!566 = !DILocalVariable(name: "reading_stdin", scope: !558, file: !2, line: 674, type: !90)
!567 = !DILocation(line: 674, column: 15, scope: !558)
!568 = !DILocation(line: 674, column: 31, scope: !558)
!569 = !DILocation(line: 675, column: 14, scope: !570)
!570 = distinct !DILexicalBlock(scope: !558, file: !2, line: 675, column: 14)
!571 = !DILocation(line: 675, column: 14, scope: !558)
!572 = !DILocation(line: 677, column: 30, scope: !573)
!573 = distinct !DILexicalBlock(scope: !570, file: !2, line: 676, column: 12)
!574 = !DILocation(line: 678, column: 25, scope: !573)
!575 = !DILocation(line: 679, column: 18, scope: !576)
!576 = distinct !DILexicalBlock(scope: !573, file: !2, line: 679, column: 18)
!577 = !DILocation(line: 679, column: 33, scope: !576)
!578 = !DILocation(line: 679, column: 18, scope: !573)
!579 = !DILocation(line: 680, column: 16, scope: !576)
!580 = !DILocation(line: 681, column: 12, scope: !573)
!581 = !DILocation(line: 684, column: 33, scope: !582)
!582 = distinct !DILexicalBlock(scope: !570, file: !2, line: 683, column: 12)
!583 = !DILocation(line: 684, column: 41, scope: !582)
!584 = !DILocation(line: 684, column: 27, scope: !582)
!585 = !DILocation(line: 684, column: 25, scope: !582)
!586 = !DILocation(line: 685, column: 18, scope: !587)
!587 = distinct !DILexicalBlock(scope: !582, file: !2, line: 685, column: 18)
!588 = !DILocation(line: 685, column: 29, scope: !587)
!589 = !DILocation(line: 685, column: 18, scope: !582)
!590 = !DILocation(line: 687, column: 18, scope: !591)
!591 = distinct !DILexicalBlock(scope: !587, file: !2, line: 686, column: 16)
!592 = !DILocation(line: 688, column: 21, scope: !591)
!593 = !DILocation(line: 689, column: 18, scope: !591)
!594 = !DILocation(line: 693, column: 21, scope: !595)
!595 = distinct !DILexicalBlock(scope: !558, file: !2, line: 693, column: 14)
!596 = !DILocation(line: 693, column: 14, scope: !595)
!597 = !DILocation(line: 693, column: 44, scope: !595)
!598 = !DILocation(line: 693, column: 14, scope: !558)
!599 = !DILocation(line: 695, column: 14, scope: !600)
!600 = distinct !DILexicalBlock(scope: !595, file: !2, line: 694, column: 12)
!601 = !DILocation(line: 696, column: 17, scope: !600)
!602 = !DILocation(line: 697, column: 14, scope: !600)
!603 = !DILocalVariable(name: "insize", scope: !558, file: !2, line: 701, type: !502)
!604 = !DILocation(line: 701, column: 16, scope: !558)
!605 = !DILocation(line: 701, column: 25, scope: !558)
!606 = !DILocation(line: 703, column: 20, scope: !558)
!607 = !DILocation(line: 703, column: 10, scope: !558)
!608 = !DILocation(line: 709, column: 17, scope: !609)
!609 = distinct !DILexicalBlock(scope: !558, file: !2, line: 709, column: 14)
!610 = !DILocation(line: 709, column: 45, scope: !609)
!611 = !DILocation(line: 709, column: 48, scope: !609)
!612 = !DILocation(line: 709, column: 76, scope: !609)
!613 = !DILocation(line: 709, column: 79, scope: !609)
!614 = !DILocation(line: 709, column: 131, scope: !609)
!615 = !DILocation(line: 709, column: 134, scope: !609)
!616 = !DILocation(line: 709, column: 147, scope: !609)
!617 = !DILocation(line: 709, column: 159, scope: !609)
!618 = !DILocation(line: 709, column: 169, scope: !609)
!619 = !DILocation(line: 709, column: 166, scope: !609)
!620 = !DILocation(line: 709, column: 177, scope: !609)
!621 = !DILocation(line: 709, column: 189, scope: !609)
!622 = !DILocation(line: 709, column: 199, scope: !609)
!623 = !DILocation(line: 709, column: 196, scope: !609)
!624 = !DILocation(line: 709, column: 14, scope: !558)
!625 = !DILocalVariable(name: "in_pos", scope: !626, file: !2, line: 711, type: !627)
!626 = distinct !DILexicalBlock(scope: !609, file: !2, line: 710, column: 12)
!627 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_t", file: !628, line: 64, baseType: !416)
!628 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "1e435c46987a169d9f9186f63a512303")
!629 = !DILocation(line: 711, column: 18, scope: !626)
!630 = !DILocation(line: 711, column: 34, scope: !626)
!631 = !DILocation(line: 711, column: 27, scope: !626)
!632 = !DILocation(line: 712, column: 21, scope: !633)
!633 = distinct !DILexicalBlock(scope: !626, file: !2, line: 712, column: 16)
!634 = !DILocation(line: 712, column: 18, scope: !633)
!635 = !DILocation(line: 712, column: 16, scope: !626)
!636 = !DILocation(line: 714, column: 20, scope: !637)
!637 = distinct !DILexicalBlock(scope: !638, file: !2, line: 714, column: 20)
!638 = distinct !DILexicalBlock(scope: !633, file: !2, line: 713, column: 14)
!639 = !DILocation(line: 714, column: 30, scope: !637)
!640 = !DILocation(line: 714, column: 20, scope: !638)
!641 = !DILocation(line: 715, column: 30, scope: !637)
!642 = !DILocation(line: 715, column: 28, scope: !637)
!643 = !DILocation(line: 715, column: 18, scope: !637)
!644 = !DILocalVariable(name: "whence", scope: !638, file: !2, line: 716, type: !49)
!645 = !DILocation(line: 716, column: 20, scope: !638)
!646 = !DILocation(line: 716, column: 35, scope: !638)
!647 = !DILocation(line: 716, column: 32, scope: !638)
!648 = !DILocation(line: 716, column: 45, scope: !638)
!649 = !DILocation(line: 716, column: 48, scope: !638)
!650 = !DILocation(line: 716, column: 58, scope: !638)
!651 = !DILocation(line: 0, scope: !638)
!652 = !DILocation(line: 716, column: 30, scope: !638)
!653 = !DILocation(line: 718, column: 20, scope: !654)
!654 = distinct !DILexicalBlock(scope: !638, file: !2, line: 718, column: 20)
!655 = !DILocation(line: 718, column: 54, scope: !654)
!656 = !DILocation(line: 718, column: 29, scope: !654)
!657 = !DILocation(line: 718, column: 27, scope: !654)
!658 = !DILocation(line: 718, column: 20, scope: !638)
!659 = !DILocation(line: 720, column: 20, scope: !660)
!660 = distinct !DILexicalBlock(scope: !654, file: !2, line: 719, column: 18)
!661 = !DILocation(line: 721, column: 23, scope: !660)
!662 = !DILocation(line: 723, column: 20, scope: !660)
!663 = !DILocation(line: 725, column: 13, scope: !638)
!664 = !DILocation(line: 726, column: 11, scope: !626)
!665 = !DILocalVariable(name: "inbuf", scope: !558, file: !2, line: 729, type: !51)
!666 = !DILocation(line: 729, column: 16, scope: !558)
!667 = !DILocation(line: 735, column: 17, scope: !668)
!668 = distinct !DILexicalBlock(scope: !558, file: !2, line: 735, column: 14)
!669 = !DILocation(line: 735, column: 24, scope: !668)
!670 = !DILocation(line: 735, column: 27, scope: !668)
!671 = !DILocation(line: 735, column: 37, scope: !668)
!672 = !DILocation(line: 735, column: 40, scope: !668)
!673 = !DILocation(line: 735, column: 57, scope: !668)
!674 = !DILocation(line: 735, column: 60, scope: !668)
!675 = !DILocation(line: 735, column: 70, scope: !668)
!676 = !DILocation(line: 735, column: 73, scope: !668)
!677 = !DILocation(line: 735, column: 14, scope: !558)
!678 = !DILocalVariable(name: "copy_cat_status", scope: !679, file: !2, line: 738, type: !49)
!679 = distinct !DILexicalBlock(scope: !668, file: !2, line: 737, column: 12)
!680 = !DILocation(line: 738, column: 18, scope: !679)
!681 = !DILocation(line: 738, column: 36, scope: !679)
!682 = !DILocation(line: 738, column: 46, scope: !679)
!683 = !DILocation(line: 738, column: 49, scope: !679)
!684 = !DILocation(line: 738, column: 78, scope: !679)
!685 = !DILocation(line: 740, column: 18, scope: !686)
!686 = distinct !DILexicalBlock(scope: !679, file: !2, line: 740, column: 18)
!687 = !DILocation(line: 740, column: 34, scope: !686)
!688 = !DILocation(line: 740, column: 18, scope: !679)
!689 = !DILocation(line: 742, column: 24, scope: !690)
!690 = distinct !DILexicalBlock(scope: !686, file: !2, line: 741, column: 16)
!691 = !DILocation(line: 743, column: 28, scope: !690)
!692 = !DILocation(line: 743, column: 26, scope: !690)
!693 = !DILocation(line: 743, column: 21, scope: !690)
!694 = !DILocation(line: 744, column: 16, scope: !690)
!695 = !DILocation(line: 747, column: 27, scope: !696)
!696 = distinct !DILexicalBlock(scope: !686, file: !2, line: 746, column: 16)
!697 = !DILocation(line: 747, column: 25, scope: !696)
!698 = !DILocation(line: 748, column: 39, scope: !696)
!699 = !DILocation(line: 748, column: 50, scope: !696)
!700 = !DILocation(line: 748, column: 26, scope: !696)
!701 = !DILocation(line: 748, column: 24, scope: !696)
!702 = !DILocation(line: 749, column: 36, scope: !696)
!703 = !DILocation(line: 749, column: 43, scope: !696)
!704 = !DILocation(line: 749, column: 24, scope: !696)
!705 = !DILocation(line: 749, column: 21, scope: !696)
!706 = !DILocation(line: 751, column: 12, scope: !679)
!707 = !DILocation(line: 755, column: 35, scope: !708)
!708 = distinct !DILexicalBlock(scope: !668, file: !2, line: 753, column: 12)
!709 = !DILocation(line: 755, column: 46, scope: !708)
!710 = !DILocation(line: 755, column: 53, scope: !708)
!711 = !DILocation(line: 755, column: 22, scope: !708)
!712 = !DILocation(line: 755, column: 20, scope: !708)
!713 = !DILocalVariable(name: "bufsize", scope: !708, file: !2, line: 778, type: !502)
!714 = !DILocation(line: 778, column: 20, scope: !708)
!715 = !DILocation(line: 779, column: 18, scope: !716)
!716 = distinct !DILexicalBlock(scope: !708, file: !2, line: 779, column: 18)
!717 = !DILocation(line: 779, column: 48, scope: !716)
!718 = !DILocation(line: 779, column: 51, scope: !716)
!719 = !DILocation(line: 779, column: 88, scope: !716)
!720 = !DILocation(line: 779, column: 91, scope: !716)
!721 = !DILocation(line: 779, column: 18, scope: !708)
!722 = !DILocation(line: 782, column: 16, scope: !716)
!723 = !DILocalVariable(name: "outbuf", scope: !708, file: !2, line: 783, type: !51)
!724 = !DILocation(line: 783, column: 20, scope: !708)
!725 = !DILocation(line: 783, column: 42, scope: !708)
!726 = !DILocation(line: 783, column: 53, scope: !708)
!727 = !DILocation(line: 783, column: 29, scope: !708)
!728 = !DILocation(line: 785, column: 25, scope: !708)
!729 = !DILocation(line: 785, column: 32, scope: !708)
!730 = !DILocation(line: 785, column: 40, scope: !708)
!731 = !DILocation(line: 785, column: 48, scope: !708)
!732 = !DILocation(line: 785, column: 57, scope: !708)
!733 = !DILocation(line: 785, column: 75, scope: !708)
!734 = !DILocation(line: 785, column: 86, scope: !708)
!735 = !DILocation(line: 785, column: 94, scope: !708)
!736 = !DILocation(line: 785, column: 111, scope: !708)
!737 = !DILocation(line: 785, column: 122, scope: !708)
!738 = !DILocation(line: 785, column: 20, scope: !708)
!739 = !DILocation(line: 785, column: 17, scope: !708)
!740 = !DILocation(line: 789, column: 25, scope: !708)
!741 = !DILocation(line: 789, column: 14, scope: !708)
!742 = !DILocation(line: 792, column: 21, scope: !558)
!743 = !DILocation(line: 792, column: 10, scope: !558)
!744 = !DILabel(scope: !558, name: "contin", file: !2, line: 794)
!745 = !DILocation(line: 794, column: 8, scope: !558)
!746 = !DILocation(line: 795, column: 15, scope: !747)
!747 = distinct !DILexicalBlock(scope: !558, file: !2, line: 795, column: 14)
!748 = !DILocation(line: 795, column: 29, scope: !747)
!749 = !DILocation(line: 795, column: 39, scope: !747)
!750 = !DILocation(line: 795, column: 32, scope: !747)
!751 = !DILocation(line: 795, column: 51, scope: !747)
!752 = !DILocation(line: 795, column: 14, scope: !558)
!753 = !DILocation(line: 797, column: 14, scope: !754)
!754 = distinct !DILexicalBlock(scope: !747, file: !2, line: 796, column: 12)
!755 = !DILocation(line: 798, column: 17, scope: !754)
!756 = !DILocation(line: 799, column: 12, scope: !754)
!757 = !DILocation(line: 800, column: 8, scope: !558)
!758 = !DILocation(line: 801, column: 13, scope: !46)
!759 = !DILocation(line: 801, column: 24, scope: !46)
!760 = !DILocation(line: 801, column: 22, scope: !46)
!761 = distinct !{!761, !555, !762, !355}
!762 = !DILocation(line: 801, column: 28, scope: !46)
!763 = !DILocation(line: 803, column: 10, scope: !764)
!764 = distinct !DILexicalBlock(scope: !46, file: !2, line: 803, column: 10)
!765 = !DILocation(line: 803, column: 10, scope: !46)
!766 = !DILocation(line: 805, column: 14, scope: !767)
!767 = distinct !DILexicalBlock(scope: !768, file: !2, line: 805, column: 14)
!768 = distinct !DILexicalBlock(scope: !764, file: !2, line: 804, column: 8)
!769 = !DILocation(line: 805, column: 50, scope: !767)
!770 = !DILocation(line: 805, column: 14, scope: !768)
!771 = !DILocation(line: 806, column: 12, scope: !767)
!772 = !DILocation(line: 807, column: 8, scope: !768)
!773 = !DILocation(line: 809, column: 10, scope: !774)
!774 = distinct !DILexicalBlock(scope: !46, file: !2, line: 809, column: 10)
!775 = !DILocation(line: 809, column: 26, scope: !774)
!776 = !DILocation(line: 809, column: 29, scope: !774)
!777 = !DILocation(line: 809, column: 50, scope: !774)
!778 = !DILocation(line: 809, column: 10, scope: !46)
!779 = !DILocation(line: 810, column: 8, scope: !774)
!780 = !DILocation(line: 812, column: 13, scope: !46)
!781 = !DILocation(line: 812, column: 6, scope: !46)
!782 = distinct !DISubprogram(name: "io_blksize", scope: !85, file: !85, line: 80, type: !783, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!783 = !DISubroutineType(types: !784)
!784 = !{!502, !785}
!785 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !786, size: 64)
!786 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !397)
!787 = !DILocalVariable(name: "st", arg: 1, scope: !782, file: !85, line: 80, type: !785)
!788 = !DILocation(line: 80, column: 32, scope: !782)
!789 = !DILocalVariable(name: "blocksize", scope: !782, file: !85, line: 83, type: !502)
!790 = !DILocation(line: 83, column: 9, scope: !782)
!791 = !DILocation(line: 83, column: 21, scope: !782)
!792 = !DILocation(line: 83, column: 38, scope: !782)
!793 = !DILocation(line: 83, column: 58, scope: !782)
!794 = !DILocation(line: 87, column: 54, scope: !782)
!795 = !DILocation(line: 87, column: 52, scope: !782)
!796 = !DILocation(line: 87, column: 33, scope: !782)
!797 = !DILocation(line: 87, column: 13, scope: !782)
!798 = !DILocation(line: 95, column: 7, scope: !799)
!799 = distinct !DILexicalBlock(scope: !782, file: !85, line: 95, column: 7)
!800 = !DILocation(line: 95, column: 29, scope: !799)
!801 = !DILocation(line: 95, column: 32, scope: !799)
!802 = !DILocation(line: 95, column: 45, scope: !799)
!803 = !DILocation(line: 95, column: 55, scope: !799)
!804 = !DILocation(line: 95, column: 42, scope: !799)
!805 = !DILocation(line: 95, column: 7, scope: !782)
!806 = !DILocalVariable(name: "leading_zeros", scope: !807, file: !85, line: 97, type: !49)
!807 = distinct !DILexicalBlock(scope: !799, file: !85, line: 96, column: 5)
!808 = !DILocation(line: 97, column: 11, scope: !807)
!809 = !DILocation(line: 97, column: 27, scope: !807)
!810 = !DILocalVariable(name: "__x", arg: 1, scope: !811, file: !812, line: 77, type: !815)
!811 = distinct !DISubprogram(name: "__clz64_inline", scope: !812, file: !812, line: 77, type: !813, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!812 = !DIFile(filename: "/usr/include/stdbit.h", directory: "", checksumkind: CSK_MD5, checksum: "412f44bf40a3f45759bb1a1dec873b38")
!813 = !DISubroutineType(types: !814)
!814 = !{!62, !815}
!815 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !816, line: 27, baseType: !817)
!816 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "256fcabbefa27ca8cf5e6d37525e6e16")
!817 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !402, line: 45, baseType: !93)
!818 = !DILocation(line: 77, column: 26, scope: !811, inlinedAt: !819)
!819 = distinct !DILocation(line: 97, column: 27, scope: !807)
!820 = !DILocation(line: 79, column: 10, scope: !811, inlinedAt: !819)
!821 = !DILocation(line: 79, column: 14, scope: !811, inlinedAt: !819)
!822 = !DILocation(line: 79, column: 59, scope: !811, inlinedAt: !819)
!823 = !DILocation(line: 79, column: 42, scope: !811, inlinedAt: !819)
!824 = !DILocalVariable(name: "power", scope: !825, file: !85, line: 100, type: !827)
!825 = distinct !DILexicalBlock(scope: !826, file: !85, line: 99, column: 9)
!826 = distinct !DILexicalBlock(scope: !807, file: !85, line: 98, column: 11)
!827 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!828 = !DILocation(line: 100, column: 30, scope: !825)
!829 = !DILocation(line: 100, column: 62, scope: !825)
!830 = !DILocation(line: 100, column: 60, scope: !825)
!831 = !DILocation(line: 100, column: 43, scope: !825)
!832 = !DILocation(line: 101, column: 15, scope: !833)
!833 = distinct !DILexicalBlock(scope: !825, file: !85, line: 101, column: 15)
!834 = !DILocation(line: 101, column: 21, scope: !833)
!835 = !DILocation(line: 101, column: 15, scope: !825)
!836 = !DILocation(line: 102, column: 25, scope: !833)
!837 = !DILocation(line: 102, column: 23, scope: !833)
!838 = !DILocation(line: 102, column: 13, scope: !833)
!839 = !DILocation(line: 104, column: 5, scope: !807)
!840 = !DILocation(line: 108, column: 10, scope: !782)
!841 = !DILocation(line: 108, column: 3, scope: !782)
!842 = distinct !DISubprogram(name: "copy_cat", scope: !2, file: !2, line: 501, type: !843, scopeLine: 502, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!843 = !DISubroutineType(types: !844)
!844 = !{!49}
!845 = !DILocalVariable(name: "copy_max", scope: !842, file: !2, line: 506, type: !846)
!846 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !628, line: 78, baseType: !847)
!847 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ssize_t", file: !402, line: 194, baseType: !417)
!848 = !DILocation(line: 506, column: 14, scope: !842)
!849 = !DILocalVariable(name: "some_copied", scope: !850, file: !2, line: 514, type: !90)
!850 = distinct !DILexicalBlock(scope: !842, file: !2, line: 514, column: 6)
!851 = !DILocation(line: 514, column: 16, scope: !850)
!852 = !DILocation(line: 514, column: 11, scope: !850)
!853 = !DILocation(line: 515, column: 33, scope: !854)
!854 = distinct !DILexicalBlock(scope: !850, file: !2, line: 514, column: 6)
!855 = !DILocation(line: 515, column: 78, scope: !854)
!856 = !DILocation(line: 515, column: 16, scope: !854)
!857 = !DILocation(line: 515, column: 8, scope: !854)
!858 = !DILocation(line: 518, column: 19, scope: !859)
!859 = distinct !DILexicalBlock(scope: !854, file: !2, line: 516, column: 10)
!860 = !DILocation(line: 518, column: 12, scope: !859)
!861 = !DILocation(line: 521, column: 16, scope: !862)
!862 = distinct !DILexicalBlock(scope: !859, file: !2, line: 521, column: 16)
!863 = !DILocation(line: 521, column: 22, scope: !862)
!864 = !DILocation(line: 521, column: 32, scope: !862)
!865 = !DILocation(line: 521, column: 47, scope: !862)
!866 = !DILocation(line: 521, column: 35, scope: !862)
!867 = !DILocation(line: 521, column: 54, scope: !862)
!868 = !DILocation(line: 521, column: 57, scope: !862)
!869 = !DILocation(line: 521, column: 63, scope: !862)
!870 = !DILocation(line: 521, column: 73, scope: !862)
!871 = !DILocation(line: 521, column: 76, scope: !862)
!872 = !DILocation(line: 521, column: 82, scope: !862)
!873 = !DILocation(line: 521, column: 91, scope: !862)
!874 = !DILocation(line: 521, column: 94, scope: !862)
!875 = !DILocation(line: 521, column: 100, scope: !862)
!876 = !DILocation(line: 521, column: 109, scope: !862)
!877 = !DILocation(line: 521, column: 112, scope: !862)
!878 = !DILocation(line: 521, column: 118, scope: !862)
!879 = !DILocation(line: 521, column: 129, scope: !862)
!880 = !DILocation(line: 521, column: 132, scope: !862)
!881 = !DILocation(line: 521, column: 138, scope: !862)
!882 = !DILocation(line: 521, column: 16, scope: !859)
!883 = !DILocation(line: 522, column: 14, scope: !862)
!884 = !DILocation(line: 523, column: 12, scope: !859)
!885 = !DILocation(line: 524, column: 12, scope: !859)
!886 = !DILocation(line: 525, column: 10, scope: !859)
!887 = !DILocation(line: 514, column: 51, scope: !854)
!888 = !DILocation(line: 514, column: 6, scope: !854)
!889 = distinct !{!889, !890, !891}
!890 = !DILocation(line: 514, column: 6, scope: !850)
!891 = !DILocation(line: 525, column: 10, scope: !850)
!892 = !DILocation(line: 526, column: 4, scope: !842)
!893 = distinct !DISubprogram(name: "simple_cat", scope: !2, file: !2, line: 156, type: !894, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!894 = !DISubroutineType(types: !895)
!895 = !{!90, !51, !502}
!896 = !DILocalVariable(name: "buf", arg: 1, scope: !893, file: !2, line: 156, type: !51)
!897 = !DILocation(line: 156, column: 22, scope: !893)
!898 = !DILocalVariable(name: "bufsize", arg: 2, scope: !893, file: !2, line: 156, type: !502)
!899 = !DILocation(line: 156, column: 33, scope: !893)
!900 = !DILocation(line: 160, column: 6, scope: !893)
!901 = !DILocalVariable(name: "n_read", scope: !902, file: !2, line: 164, type: !504)
!902 = distinct !DILexicalBlock(scope: !893, file: !2, line: 161, column: 8)
!903 = !DILocation(line: 164, column: 20, scope: !902)
!904 = !DILocation(line: 164, column: 40, scope: !902)
!905 = !DILocation(line: 164, column: 52, scope: !902)
!906 = !DILocation(line: 164, column: 57, scope: !902)
!907 = !DILocation(line: 164, column: 29, scope: !902)
!908 = !DILocation(line: 165, column: 14, scope: !909)
!909 = distinct !DILexicalBlock(scope: !902, file: !2, line: 165, column: 14)
!910 = !DILocation(line: 165, column: 21, scope: !909)
!911 = !DILocation(line: 165, column: 14, scope: !902)
!912 = !DILocation(line: 167, column: 14, scope: !913)
!913 = distinct !DILexicalBlock(scope: !909, file: !2, line: 166, column: 12)
!914 = !DILocation(line: 168, column: 14, scope: !913)
!915 = !DILocation(line: 173, column: 14, scope: !916)
!916 = distinct !DILexicalBlock(scope: !902, file: !2, line: 173, column: 14)
!917 = !DILocation(line: 173, column: 21, scope: !916)
!918 = !DILocation(line: 173, column: 14, scope: !902)
!919 = !DILocation(line: 174, column: 12, scope: !916)
!920 = !DILocation(line: 178, column: 41, scope: !921)
!921 = distinct !DILexicalBlock(scope: !902, file: !2, line: 178, column: 14)
!922 = !DILocation(line: 178, column: 46, scope: !921)
!923 = !DILocation(line: 178, column: 14, scope: !921)
!924 = !DILocation(line: 178, column: 57, scope: !921)
!925 = !DILocation(line: 178, column: 54, scope: !921)
!926 = !DILocation(line: 178, column: 14, scope: !902)
!927 = !DILocation(line: 179, column: 12, scope: !921)
!928 = distinct !{!928, !900, !929}
!929 = !DILocation(line: 180, column: 8, scope: !893)
!930 = !DILocation(line: 181, column: 4, scope: !893)
!931 = distinct !DISubprogram(name: "cat", scope: !2, file: !2, line: 212, type: !932, scopeLine: 215, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!932 = !DISubroutineType(types: !933)
!933 = !{!90, !51, !502, !51, !502, !90, !90, !90, !90, !90, !90}
!934 = !DILocalVariable(name: "inbuf", arg: 1, scope: !931, file: !2, line: 212, type: !51)
!935 = !DILocation(line: 212, column: 15, scope: !931)
!936 = !DILocalVariable(name: "insize", arg: 2, scope: !931, file: !2, line: 212, type: !502)
!937 = !DILocation(line: 212, column: 28, scope: !931)
!938 = !DILocalVariable(name: "outbuf", arg: 3, scope: !931, file: !2, line: 212, type: !51)
!939 = !DILocation(line: 212, column: 42, scope: !931)
!940 = !DILocalVariable(name: "outsize", arg: 4, scope: !931, file: !2, line: 212, type: !502)
!941 = !DILocation(line: 212, column: 56, scope: !931)
!942 = !DILocalVariable(name: "show_nonprinting", arg: 5, scope: !931, file: !2, line: 213, type: !90)
!943 = !DILocation(line: 213, column: 14, scope: !931)
!944 = !DILocalVariable(name: "show_tabs", arg: 6, scope: !931, file: !2, line: 213, type: !90)
!945 = !DILocation(line: 213, column: 37, scope: !931)
!946 = !DILocalVariable(name: "number", arg: 7, scope: !931, file: !2, line: 213, type: !90)
!947 = !DILocation(line: 213, column: 53, scope: !931)
!948 = !DILocalVariable(name: "number_nonblank", arg: 8, scope: !931, file: !2, line: 213, type: !90)
!949 = !DILocation(line: 213, column: 66, scope: !931)
!950 = !DILocalVariable(name: "show_ends", arg: 9, scope: !931, file: !2, line: 214, type: !90)
!951 = !DILocation(line: 214, column: 14, scope: !931)
!952 = !DILocalVariable(name: "squeeze_blank", arg: 10, scope: !931, file: !2, line: 214, type: !90)
!953 = !DILocation(line: 214, column: 30, scope: !931)
!954 = !DILocalVariable(name: "ch", scope: !931, file: !2, line: 217, type: !955)
!955 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!956 = !DILocation(line: 217, column: 20, scope: !931)
!957 = !DILocalVariable(name: "newlines", scope: !931, file: !2, line: 224, type: !49)
!958 = !DILocation(line: 224, column: 10, scope: !931)
!959 = !DILocation(line: 224, column: 21, scope: !931)
!960 = !DILocalVariable(name: "use_fionread", scope: !931, file: !2, line: 229, type: !90)
!961 = !DILocation(line: 229, column: 11, scope: !931)
!962 = !DILocalVariable(name: "eob", scope: !931, file: !2, line: 237, type: !51)
!963 = !DILocation(line: 237, column: 12, scope: !931)
!964 = !DILocation(line: 237, column: 18, scope: !931)
!965 = !DILocalVariable(name: "bpin", scope: !931, file: !2, line: 240, type: !51)
!966 = !DILocation(line: 240, column: 12, scope: !931)
!967 = !DILocation(line: 240, column: 19, scope: !931)
!968 = !DILocation(line: 240, column: 23, scope: !931)
!969 = !DILocalVariable(name: "bpout", scope: !931, file: !2, line: 243, type: !51)
!970 = !DILocation(line: 243, column: 12, scope: !931)
!971 = !DILocation(line: 243, column: 20, scope: !931)
!972 = !DILocation(line: 245, column: 6, scope: !931)
!973 = !DILocation(line: 247, column: 10, scope: !974)
!974 = distinct !DILexicalBlock(scope: !931, file: !2, line: 246, column: 8)
!975 = !DILocation(line: 251, column: 18, scope: !976)
!976 = distinct !DILexicalBlock(scope: !977, file: !2, line: 251, column: 18)
!977 = distinct !DILexicalBlock(scope: !974, file: !2, line: 248, column: 12)
!978 = !DILocation(line: 251, column: 27, scope: !976)
!979 = !DILocation(line: 251, column: 25, scope: !976)
!980 = !DILocation(line: 251, column: 38, scope: !976)
!981 = !DILocation(line: 251, column: 35, scope: !976)
!982 = !DILocation(line: 251, column: 18, scope: !977)
!983 = !DILocalVariable(name: "wp", scope: !984, file: !2, line: 253, type: !51)
!984 = distinct !DILexicalBlock(scope: !976, file: !2, line: 252, column: 16)
!985 = !DILocation(line: 253, column: 24, scope: !984)
!986 = !DILocation(line: 253, column: 29, scope: !984)
!987 = !DILocalVariable(name: "remaining_bytes", scope: !984, file: !2, line: 254, type: !502)
!988 = !DILocation(line: 254, column: 24, scope: !984)
!989 = !DILocation(line: 255, column: 18, scope: !984)
!990 = !DILocation(line: 257, column: 53, scope: !991)
!991 = distinct !DILexicalBlock(scope: !992, file: !2, line: 257, column: 26)
!992 = distinct !DILexicalBlock(scope: !984, file: !2, line: 256, column: 20)
!993 = !DILocation(line: 257, column: 57, scope: !991)
!994 = !DILocation(line: 257, column: 26, scope: !991)
!995 = !DILocation(line: 257, column: 69, scope: !991)
!996 = !DILocation(line: 257, column: 66, scope: !991)
!997 = !DILocation(line: 257, column: 26, scope: !992)
!998 = !DILocation(line: 258, column: 24, scope: !991)
!999 = !DILocation(line: 259, column: 28, scope: !992)
!1000 = !DILocation(line: 259, column: 25, scope: !992)
!1001 = !DILocation(line: 260, column: 40, scope: !992)
!1002 = !DILocation(line: 260, column: 48, scope: !992)
!1003 = !DILocation(line: 260, column: 46, scope: !992)
!1004 = !DILocation(line: 260, column: 38, scope: !992)
!1005 = !DILocation(line: 261, column: 20, scope: !992)
!1006 = !DILocation(line: 262, column: 25, scope: !984)
!1007 = !DILocation(line: 262, column: 36, scope: !984)
!1008 = !DILocation(line: 262, column: 33, scope: !984)
!1009 = distinct !{!1009, !989, !1010, !355}
!1010 = !DILocation(line: 262, column: 51, scope: !984)
!1011 = !DILocation(line: 267, column: 27, scope: !984)
!1012 = !DILocation(line: 267, column: 35, scope: !984)
!1013 = !DILocation(line: 267, column: 39, scope: !984)
!1014 = !DILocation(line: 267, column: 18, scope: !984)
!1015 = !DILocation(line: 268, column: 26, scope: !984)
!1016 = !DILocation(line: 268, column: 35, scope: !984)
!1017 = !DILocation(line: 268, column: 33, scope: !984)
!1018 = !DILocation(line: 268, column: 24, scope: !984)
!1019 = !DILocation(line: 269, column: 16, scope: !984)
!1020 = !DILocation(line: 273, column: 18, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !977, file: !2, line: 273, column: 18)
!1022 = !DILocation(line: 273, column: 25, scope: !1021)
!1023 = !DILocation(line: 273, column: 23, scope: !1021)
!1024 = !DILocation(line: 273, column: 18, scope: !977)
!1025 = !DILocalVariable(name: "input_pending", scope: !1026, file: !2, line: 275, type: !90)
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
!1073 = !DILocalVariable(name: "n_read", scope: !1026, file: !2, line: 310, type: !504)
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
!1137 = !DILocation(line: 363, column: 42, scope: !1136)
!1138 = !DILocation(line: 363, column: 49, scope: !1136)
!1139 = !DILocation(line: 363, column: 34, scope: !1136)
!1140 = !DILocation(line: 363, column: 32, scope: !1136)
!1141 = !DILocation(line: 364, column: 24, scope: !1136)
!1142 = !DILocation(line: 365, column: 20, scope: !1116)
!1143 = !DILocation(line: 368, column: 22, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1111, file: !2, line: 368, column: 22)
!1145 = !DILocation(line: 368, column: 22, scope: !1111)
!1146 = !DILocation(line: 370, column: 26, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1148, file: !2, line: 370, column: 26)
!1148 = distinct !DILexicalBlock(scope: !1144, file: !2, line: 369, column: 20)
!1149 = !DILocation(line: 370, column: 26, scope: !1148)
!1150 = !DILocation(line: 372, column: 32, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1147, file: !2, line: 371, column: 24)
!1152 = !DILocation(line: 372, column: 35, scope: !1151)
!1153 = !DILocation(line: 373, column: 32, scope: !1151)
!1154 = !DILocation(line: 373, column: 35, scope: !1151)
!1155 = !DILocation(line: 374, column: 37, scope: !1151)
!1156 = !DILocation(line: 375, column: 24, scope: !1151)
!1157 = !DILocation(line: 376, column: 28, scope: !1148)
!1158 = !DILocation(line: 376, column: 31, scope: !1148)
!1159 = !DILocation(line: 377, column: 20, scope: !1148)
!1160 = !DILocation(line: 381, column: 24, scope: !1111)
!1161 = !DILocation(line: 381, column: 27, scope: !1111)
!1162 = !DILocation(line: 383, column: 24, scope: !977)
!1163 = !DILocation(line: 383, column: 19, scope: !977)
!1164 = !DILocation(line: 383, column: 17, scope: !977)
!1165 = !DILocation(line: 384, column: 12, scope: !977)
!1166 = !DILocation(line: 385, column: 17, scope: !974)
!1167 = !DILocation(line: 385, column: 20, scope: !974)
!1168 = distinct !{!1168, !973, !1169, !355}
!1169 = !DILocation(line: 385, column: 27, scope: !974)
!1170 = !DILocation(line: 389, column: 14, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !974, file: !2, line: 389, column: 14)
!1172 = !DILocation(line: 389, column: 14, scope: !974)
!1173 = !DILocation(line: 391, column: 20, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1171, file: !2, line: 390, column: 12)
!1175 = !DILocation(line: 391, column: 23, scope: !1174)
!1176 = !DILocation(line: 392, column: 25, scope: !1174)
!1177 = !DILocation(line: 393, column: 12, scope: !1174)
!1178 = !DILocation(line: 397, column: 14, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !974, file: !2, line: 397, column: 14)
!1180 = !DILocation(line: 397, column: 23, scope: !1179)
!1181 = !DILocation(line: 397, column: 28, scope: !1179)
!1182 = !DILocation(line: 397, column: 31, scope: !1179)
!1183 = !DILocation(line: 397, column: 14, scope: !974)
!1184 = !DILocation(line: 399, column: 14, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1179, file: !2, line: 398, column: 12)
!1186 = !DILocation(line: 400, column: 30, scope: !1185)
!1187 = !DILocation(line: 400, column: 37, scope: !1185)
!1188 = !DILocation(line: 400, column: 22, scope: !1185)
!1189 = !DILocation(line: 400, column: 20, scope: !1185)
!1190 = !DILocation(line: 401, column: 12, scope: !1185)
!1191 = !DILocation(line: 409, column: 14, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !974, file: !2, line: 409, column: 14)
!1193 = !DILocation(line: 409, column: 14, scope: !974)
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
!1341 = distinct !{!1341, !972, !1342}
!1342 = !DILocation(line: 493, column: 8, scope: !931)
!1343 = !DILocation(line: 494, column: 4, scope: !931)
!1344 = distinct !DISubprogram(name: "write_error", scope: !56, file: !56, line: 741, type: !322, scopeLine: 742, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!1345 = !DILocalVariable(name: "saved_errno", scope: !1344, file: !56, line: 743, type: !49)
!1346 = !DILocation(line: 743, column: 7, scope: !1344)
!1347 = !DILocation(line: 743, column: 21, scope: !1344)
!1348 = !DILocation(line: 744, column: 3, scope: !1344)
!1349 = !DILocation(line: 745, column: 11, scope: !1344)
!1350 = !DILocation(line: 745, column: 3, scope: !1344)
!1351 = !DILocation(line: 746, column: 3, scope: !1344)
!1352 = !DILocation(line: 747, column: 3, scope: !1344)
!1353 = distinct !DISubprogram(name: "is_ENOTSUP", scope: !56, file: !56, line: 774, type: !1354, scopeLine: 775, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!1354 = !DISubroutineType(types: !1355)
!1355 = !{!90, !49}
!1356 = !DILocalVariable(name: "err", arg: 1, scope: !1353, file: !56, line: 774, type: !49)
!1357 = !DILocation(line: 774, column: 17, scope: !1353)
!1358 = !DILocation(line: 776, column: 10, scope: !1353)
!1359 = !DILocation(line: 776, column: 14, scope: !1353)
!1360 = !DILocation(line: 776, column: 28, scope: !1353)
!1361 = !DILocation(line: 776, column: 3, scope: !1353)
!1362 = distinct !DISubprogram(name: "write_pending", scope: !2, file: !2, line: 188, type: !1363, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!1363 = !DISubroutineType(types: !1364)
!1364 = !{null, !51, !50}
!1365 = !DILocalVariable(name: "outbuf", arg: 1, scope: !1362, file: !2, line: 188, type: !51)
!1366 = !DILocation(line: 188, column: 25, scope: !1362)
!1367 = !DILocalVariable(name: "bpout", arg: 2, scope: !1362, file: !2, line: 188, type: !50)
!1368 = !DILocation(line: 188, column: 40, scope: !1362)
!1369 = !DILocalVariable(name: "n_write", scope: !1362, file: !2, line: 190, type: !502)
!1370 = !DILocation(line: 190, column: 12, scope: !1362)
!1371 = !DILocation(line: 190, column: 23, scope: !1362)
!1372 = !DILocation(line: 190, column: 22, scope: !1362)
!1373 = !DILocation(line: 190, column: 31, scope: !1362)
!1374 = !DILocation(line: 190, column: 29, scope: !1362)
!1375 = !DILocation(line: 191, column: 14, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1362, file: !2, line: 191, column: 10)
!1377 = !DILocation(line: 191, column: 12, scope: !1376)
!1378 = !DILocation(line: 191, column: 10, scope: !1362)
!1379 = !DILocation(line: 193, column: 41, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1381, file: !2, line: 193, column: 14)
!1381 = distinct !DILexicalBlock(scope: !1376, file: !2, line: 192, column: 8)
!1382 = !DILocation(line: 193, column: 49, scope: !1380)
!1383 = !DILocation(line: 193, column: 14, scope: !1380)
!1384 = !DILocation(line: 193, column: 61, scope: !1380)
!1385 = !DILocation(line: 193, column: 58, scope: !1380)
!1386 = !DILocation(line: 193, column: 14, scope: !1381)
!1387 = !DILocation(line: 194, column: 12, scope: !1380)
!1388 = !DILocation(line: 195, column: 19, scope: !1381)
!1389 = !DILocation(line: 195, column: 11, scope: !1381)
!1390 = !DILocation(line: 195, column: 17, scope: !1381)
!1391 = !DILocation(line: 196, column: 8, scope: !1381)
!1392 = !DILocation(line: 197, column: 4, scope: !1362)
!1393 = distinct !DISubprogram(name: "next_line_num", scope: !2, file: !2, line: 132, type: !322, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!1394 = !DILocalVariable(name: "endp", scope: !1393, file: !2, line: 134, type: !51)
!1395 = !DILocation(line: 134, column: 12, scope: !1393)
!1396 = !DILocation(line: 134, column: 19, scope: !1393)
!1397 = !DILocation(line: 135, column: 6, scope: !1393)
!1398 = !DILocation(line: 137, column: 16, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1400, file: !2, line: 137, column: 14)
!1400 = distinct !DILexicalBlock(scope: !1393, file: !2, line: 136, column: 8)
!1401 = !DILocation(line: 137, column: 21, scope: !1399)
!1402 = !DILocation(line: 137, column: 14, scope: !1399)
!1403 = !DILocation(line: 137, column: 24, scope: !1399)
!1404 = !DILocation(line: 137, column: 14, scope: !1400)
!1405 = !DILocation(line: 138, column: 12, scope: !1399)
!1406 = !DILocation(line: 139, column: 15, scope: !1400)
!1407 = !DILocation(line: 139, column: 18, scope: !1400)
!1408 = !DILocation(line: 140, column: 8, scope: !1400)
!1409 = !DILocation(line: 141, column: 13, scope: !1393)
!1410 = !DILocation(line: 141, column: 21, scope: !1393)
!1411 = !DILocation(line: 141, column: 18, scope: !1393)
!1412 = distinct !{!1412, !1397, !1413, !355}
!1413 = !DILocation(line: 141, column: 35, scope: !1393)
!1414 = !DILocation(line: 143, column: 10, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1393, file: !2, line: 143, column: 10)
!1416 = !DILocation(line: 143, column: 25, scope: !1415)
!1417 = !DILocation(line: 143, column: 10, scope: !1393)
!1418 = !DILocation(line: 144, column: 9, scope: !1415)
!1419 = !DILocation(line: 144, column: 26, scope: !1415)
!1420 = !DILocation(line: 144, column: 8, scope: !1415)
!1421 = !DILocation(line: 146, column: 18, scope: !1415)
!1422 = !DILocation(line: 147, column: 10, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1393, file: !2, line: 147, column: 10)
!1424 = !DILocation(line: 147, column: 27, scope: !1423)
!1425 = !DILocation(line: 147, column: 25, scope: !1423)
!1426 = !DILocation(line: 147, column: 10, scope: !1393)
!1427 = !DILocation(line: 148, column: 22, scope: !1423)
!1428 = !DILocation(line: 148, column: 8, scope: !1423)
!1429 = !DILocation(line: 149, column: 4, scope: !1393)
