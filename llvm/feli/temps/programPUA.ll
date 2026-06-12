; ModuleID = '/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/otherInputs/catCU/catPUA.c'
source_filename = "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/otherInputs/catCU/catPUA.c"
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
  %27 = alloca i8, align 1
  %28 = alloca i64, align 8
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

115:                                              ; preds = %356, %111
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
  br label %356, !dbg !593

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
  br label %343, !dbg !602

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
  br i1 %165, label %227, label %166, !dbg !610

166:                                              ; preds = %159
  %167 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !611
  %168 = load i32, ptr %167, align 8, !dbg !611
  %169 = and i32 %168, 61440, !dbg !611
  %170 = icmp eq i32 %169, 49152, !dbg !611
  br i1 %170, label %227, label %171, !dbg !612

171:                                              ; preds = %166
  %172 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !613
  %173 = load i32, ptr %172, align 8, !dbg !613
  %174 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !613
  %175 = load i32, ptr %174, align 8, !dbg !613
  %176 = sub i32 %173, %175, !dbg !613
  %177 = icmp ne i32 %176, 0, !dbg !613
  br i1 %177, label %227, label %178, !dbg !614

178:                                              ; preds = %171
  %179 = load i8, ptr %20, align 1, !dbg !615
  %180 = trunc i8 %179 to i1, !dbg !615
  br i1 %180, label %181, label %227, !dbg !616

181:                                              ; preds = %178
  %182 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 0, !dbg !617
  %183 = load i64, ptr %182, align 8, !dbg !617
  %184 = load i64, ptr %17, align 8, !dbg !618
  %185 = icmp eq i64 %183, %184, !dbg !619
  br i1 %185, label %186, label %227, !dbg !620

186:                                              ; preds = %181
  %187 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !621
  %188 = load i64, ptr %187, align 8, !dbg !621
  %189 = load i64, ptr %18, align 8, !dbg !622
  %190 = icmp eq i64 %188, %189, !dbg !623
  br i1 %190, label %191, label %227, !dbg !624

191:                                              ; preds = %186
  %192 = load i32, ptr %19, align 4, !dbg !625
  %193 = icmp slt i32 %192, -1, !dbg !628
  br i1 %193, label %194, label %196, !dbg !629

194:                                              ; preds = %191
  %195 = call i32 (i32, i32, ...) @rpl_fcntl(i32 noundef 1, i32 noundef 3), !dbg !630
  store i32 %195, ptr %19, align 4, !dbg !631
  br label %196, !dbg !632

196:                                              ; preds = %194, %191
  call void @llvm.dbg.declare(metadata ptr %27, metadata !633, metadata !DIExpression()), !dbg !634
  %197 = load i32, ptr %19, align 4, !dbg !635
  %198 = icmp sle i32 0, %197, !dbg !636
  br i1 %198, label %199, label %203, !dbg !637

199:                                              ; preds = %196
  %200 = load i32, ptr %19, align 4, !dbg !638
  %201 = and i32 %200, 1024, !dbg !639
  %202 = icmp ne i32 %201, 0, !dbg !637
  br label %203

203:                                              ; preds = %199, %196
  %204 = phi i1 [ false, %196 ], [ %202, %199 ], !dbg !640
  %205 = zext i1 %204 to i8, !dbg !634
  store i8 %205, ptr %27, align 1, !dbg !634
  %206 = load i8, ptr %27, align 1, !dbg !641
  %207 = trunc i8 %206 to i1, !dbg !641
  br i1 %207, label %219, label %208, !dbg !643

208:                                              ; preds = %203
  call void @llvm.dbg.declare(metadata ptr %28, metadata !644, metadata !DIExpression()), !dbg !648
  %209 = load i32, ptr @input_desc, align 4, !dbg !649
  %210 = call i64 @lseek(i32 noundef %209, i64 noundef 0, i32 noundef 1) #12, !dbg !650
  store i64 %210, ptr %28, align 8, !dbg !648
  %211 = load i64, ptr %28, align 8, !dbg !651
  %212 = icmp sle i64 0, %211, !dbg !653
  br i1 %212, label %213, label %218, !dbg !654

213:                                              ; preds = %208
  %214 = load i64, ptr %28, align 8, !dbg !655
  %215 = call i64 @lseek(i32 noundef 1, i64 noundef 0, i32 noundef 1) #12, !dbg !656
  %216 = icmp slt i64 %214, %215, !dbg !657
  %217 = zext i1 %216 to i8, !dbg !658
  store i8 %217, ptr %27, align 1, !dbg !658
  br label %218, !dbg !659

218:                                              ; preds = %213, %208
  br label %219, !dbg !660

219:                                              ; preds = %218, %203
  %220 = load i8, ptr %27, align 1, !dbg !661
  %221 = trunc i8 %220 to i1, !dbg !661
  br i1 %221, label %222, label %226, !dbg !663

222:                                              ; preds = %219
  %223 = call ptr @gettext(ptr noundef @.str.29) #12, !dbg !664
  %224 = load ptr, ptr @infile, align 8, !dbg !664
  %225 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %224), !dbg !664
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef 0, ptr noundef %223, ptr noundef %225) #17, !dbg !664
  store i8 0, ptr %23, align 1, !dbg !666
  br label %343, !dbg !667

226:                                              ; preds = %219
  br label %227, !dbg !668

227:                                              ; preds = %226, %186, %181, %178, %171, %166, %159
  call void @llvm.dbg.declare(metadata ptr %29, metadata !669, metadata !DIExpression()), !dbg !670
  %228 = load i8, ptr %8, align 1, !dbg !671
  %229 = trunc i8 %228 to i1, !dbg !671
  br i1 %229, label %291, label %230, !dbg !673

230:                                              ; preds = %227
  %231 = load i8, ptr %11, align 1, !dbg !674
  %232 = trunc i8 %231 to i1, !dbg !674
  br i1 %232, label %291, label %233, !dbg !675

233:                                              ; preds = %230
  %234 = load i8, ptr %12, align 1, !dbg !676
  %235 = trunc i8 %234 to i1, !dbg !676
  br i1 %235, label %291, label %236, !dbg !677

236:                                              ; preds = %233
  %237 = load i8, ptr %13, align 1, !dbg !678
  %238 = trunc i8 %237 to i1, !dbg !678
  br i1 %238, label %291, label %239, !dbg !679

239:                                              ; preds = %236
  %240 = load i8, ptr %10, align 1, !dbg !680
  %241 = trunc i8 %240 to i1, !dbg !680
  br i1 %241, label %291, label %242, !dbg !681

242:                                              ; preds = %239
  call void @llvm.dbg.declare(metadata ptr %30, metadata !682, metadata !DIExpression()), !dbg !684
  %243 = load i8, ptr %21, align 1, !dbg !685
  %244 = trunc i8 %243 to i1, !dbg !685
  br i1 %244, label %245, label %252, !dbg !686

245:                                              ; preds = %242
  %246 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !687
  %247 = load i32, ptr %246, align 8, !dbg !687
  %248 = and i32 %247, 61440, !dbg !687
  %249 = icmp eq i32 %248, 32768, !dbg !687
  br i1 %249, label %250, label %252, !dbg !685

250:                                              ; preds = %245
  %251 = call i32 @copy_cat(), !dbg !688
  br label %253, !dbg !685

252:                                              ; preds = %245, %242
  br label %253, !dbg !685

253:                                              ; preds = %252, %250
  %254 = phi i32 [ %251, %250 ], [ 0, %252 ], !dbg !685
  store i32 %254, ptr %30, align 4, !dbg !684
  %255 = load i32, ptr %30, align 4, !dbg !689
  %256 = icmp ne i32 %255, 0, !dbg !691
  br i1 %256, label %257, label %267, !dbg !692

257:                                              ; preds = %253
  store ptr null, ptr %29, align 8, !dbg !693
  %258 = load i32, ptr %30, align 4, !dbg !695
  %259 = icmp slt i32 0, %258, !dbg !696
  %260 = zext i1 %259 to i32, !dbg !696
  %261 = load i8, ptr %23, align 1, !dbg !697
  %262 = trunc i8 %261 to i1, !dbg !697
  %263 = zext i1 %262 to i32, !dbg !697
  %264 = and i32 %263, %260, !dbg !697
  %265 = icmp ne i32 %264, 0, !dbg !697
  %266 = zext i1 %265 to i8, !dbg !697
  store i8 %266, ptr %23, align 1, !dbg !697
  br label %290, !dbg !698

267:                                              ; preds = %253
  %268 = load i64, ptr %26, align 8, !dbg !699
  %269 = load i64, ptr %16, align 8, !dbg !699
  %270 = icmp sgt i64 %268, %269, !dbg !699
  br i1 %270, label %271, label %273, !dbg !699

271:                                              ; preds = %267
  %272 = load i64, ptr %26, align 8, !dbg !699
  br label %275, !dbg !699

273:                                              ; preds = %267
  %274 = load i64, ptr %16, align 8, !dbg !699
  br label %275, !dbg !699

275:                                              ; preds = %273, %271
  %276 = phi i64 [ %272, %271 ], [ %274, %273 ], !dbg !699
  store i64 %276, ptr %26, align 8, !dbg !701
  %277 = load i64, ptr %24, align 8, !dbg !702
  %278 = load i64, ptr %26, align 8, !dbg !703
  %279 = call noalias nonnull ptr @xalignalloc(i64 noundef %277, i64 noundef %278) #18, !dbg !704
  store ptr %279, ptr %29, align 8, !dbg !705
  %280 = load ptr, ptr %29, align 8, !dbg !706
  %281 = load i64, ptr %26, align 8, !dbg !707
  %282 = call zeroext i1 @simple_cat(ptr noundef %280, i64 noundef %281), !dbg !708
  %283 = zext i1 %282 to i32, !dbg !708
  %284 = load i8, ptr %23, align 1, !dbg !709
  %285 = trunc i8 %284 to i1, !dbg !709
  %286 = zext i1 %285 to i32, !dbg !709
  %287 = and i32 %286, %283, !dbg !709
  %288 = icmp ne i32 %287, 0, !dbg !709
  %289 = zext i1 %288 to i8, !dbg !709
  store i8 %289, ptr %23, align 1, !dbg !709
  br label %290

290:                                              ; preds = %275, %257
  br label %341, !dbg !710

291:                                              ; preds = %239, %236, %233, %230, %227
  %292 = load i64, ptr %24, align 8, !dbg !711
  %293 = load i64, ptr %26, align 8, !dbg !713
  %294 = add nsw i64 %293, 1, !dbg !714
  %295 = call noalias nonnull ptr @xalignalloc(i64 noundef %292, i64 noundef %294) #18, !dbg !715
  store ptr %295, ptr %29, align 8, !dbg !716
  call void @llvm.dbg.declare(metadata ptr %31, metadata !717, metadata !DIExpression()), !dbg !718
  %296 = load i64, ptr %26, align 8, !dbg !719
  %297 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %296, i64 4), !dbg !719
  %298 = extractvalue { i64, i1 } %297, 1, !dbg !719
  %299 = extractvalue { i64, i1 } %297, 0, !dbg !719
  store i64 %299, ptr %31, align 8, !dbg !719
  br i1 %298, label %311, label %300, !dbg !721

300:                                              ; preds = %291
  %301 = load i64, ptr %31, align 8, !dbg !722
  %302 = load i64, ptr %16, align 8, !dbg !722
  %303 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %301, i64 %302), !dbg !722
  %304 = extractvalue { i64, i1 } %303, 1, !dbg !722
  %305 = extractvalue { i64, i1 } %303, 0, !dbg !722
  store i64 %305, ptr %31, align 8, !dbg !722
  br i1 %304, label %311, label %306, !dbg !723

306:                                              ; preds = %300
  %307 = load i64, ptr %31, align 8, !dbg !724
  %308 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %307, i64 19), !dbg !724
  %309 = extractvalue { i64, i1 } %308, 1, !dbg !724
  %310 = extractvalue { i64, i1 } %308, 0, !dbg !724
  store i64 %310, ptr %31, align 8, !dbg !724
  br i1 %309, label %311, label %312, !dbg !725

311:                                              ; preds = %306, %300, %291
  call void @xalloc_die() #15, !dbg !726
  unreachable, !dbg !726

312:                                              ; preds = %306
  call void @llvm.dbg.declare(metadata ptr %32, metadata !727, metadata !DIExpression()), !dbg !728
  %313 = load i64, ptr %24, align 8, !dbg !729
  %314 = load i64, ptr %31, align 8, !dbg !730
  %315 = call noalias nonnull ptr @xalignalloc(i64 noundef %313, i64 noundef %314) #18, !dbg !731
  store ptr %315, ptr %32, align 8, !dbg !728
  %316 = load ptr, ptr %29, align 8, !dbg !732
  %317 = load i64, ptr %26, align 8, !dbg !733
  %318 = load ptr, ptr %32, align 8, !dbg !734
  %319 = load i64, ptr %16, align 8, !dbg !735
  %320 = load i8, ptr %12, align 1, !dbg !736
  %321 = trunc i8 %320 to i1, !dbg !736
  %322 = load i8, ptr %13, align 1, !dbg !737
  %323 = trunc i8 %322 to i1, !dbg !737
  %324 = load i8, ptr %8, align 1, !dbg !738
  %325 = trunc i8 %324 to i1, !dbg !738
  %326 = load i8, ptr %9, align 1, !dbg !739
  %327 = trunc i8 %326 to i1, !dbg !739
  %328 = load i8, ptr %11, align 1, !dbg !740
  %329 = trunc i8 %328 to i1, !dbg !740
  %330 = load i8, ptr %10, align 1, !dbg !741
  %331 = trunc i8 %330 to i1, !dbg !741
  %332 = call zeroext i1 @cat(ptr noundef %316, i64 noundef %317, ptr noundef %318, i64 noundef %319, i1 noundef zeroext %321, i1 noundef zeroext %323, i1 noundef zeroext %325, i1 noundef zeroext %327, i1 noundef zeroext %329, i1 noundef zeroext %331), !dbg !742
  %333 = zext i1 %332 to i32, !dbg !742
  %334 = load i8, ptr %23, align 1, !dbg !743
  %335 = trunc i8 %334 to i1, !dbg !743
  %336 = zext i1 %335 to i32, !dbg !743
  %337 = and i32 %336, %333, !dbg !743
  %338 = icmp ne i32 %337, 0, !dbg !743
  %339 = zext i1 %338 to i8, !dbg !743
  store i8 %339, ptr %23, align 1, !dbg !743
  %340 = load ptr, ptr %32, align 8, !dbg !744
  call void @alignfree(ptr noundef %340), !dbg !745
  br label %341

341:                                              ; preds = %312, %290
  %342 = load ptr, ptr %29, align 8, !dbg !746
  call void @alignfree(ptr noundef %342), !dbg !747
  br label %343, !dbg !747

343:                                              ; preds = %341, %222, %154
  call void @llvm.dbg.label(metadata !748), !dbg !749
  %344 = load i8, ptr %25, align 1, !dbg !750
  %345 = trunc i8 %344 to i1, !dbg !750
  br i1 %345, label %355, label %346, !dbg !752

346:                                              ; preds = %343
  %347 = load i32, ptr @input_desc, align 4, !dbg !753
  %348 = call i32 @close(i32 noundef %347), !dbg !754
  %349 = icmp slt i32 %348, 0, !dbg !755
  br i1 %349, label %350, label %355, !dbg !756

350:                                              ; preds = %346
  %351 = call ptr @__errno_location() #16, !dbg !757
  %352 = load i32, ptr %351, align 4, !dbg !757
  %353 = load ptr, ptr @infile, align 8, !dbg !757
  %354 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %353), !dbg !757
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %352, ptr noundef @.str.28, ptr noundef %354) #17, !dbg !757
  store i8 0, ptr %23, align 1, !dbg !759
  br label %355, !dbg !760

355:                                              ; preds = %350, %346, %343
  br label %356, !dbg !761

356:                                              ; preds = %355, %144
  %357 = load i32, ptr %22, align 4, !dbg !762
  %358 = add nsw i32 %357, 1, !dbg !762
  store i32 %358, ptr %22, align 4, !dbg !762
  %359 = load i32, ptr %4, align 4, !dbg !763
  %360 = icmp slt i32 %358, %359, !dbg !764
  br i1 %360, label %115, label %361, !dbg !761, !llvm.loop !765

361:                                              ; preds = %356
  %362 = load i8, ptr @pending_cr, align 1, !dbg !767
  %363 = trunc i8 %362 to i1, !dbg !767
  br i1 %363, label %364, label %369, !dbg !769

364:                                              ; preds = %361
  %365 = call i64 @full_write(i32 noundef 1, ptr noundef @.str.30, i64 noundef 1), !dbg !770
  %366 = icmp ne i64 %365, 1, !dbg !773
  br i1 %366, label %367, label %368, !dbg !774

367:                                              ; preds = %364
  call void @write_error(), !dbg !775
  br label %368, !dbg !775

368:                                              ; preds = %367, %364
  br label %369, !dbg !776

369:                                              ; preds = %368, %361
  %370 = load i8, ptr %6, align 1, !dbg !777
  %371 = trunc i8 %370 to i1, !dbg !777
  br i1 %371, label %372, label %379, !dbg !779

372:                                              ; preds = %369
  %373 = call i32 @close(i32 noundef 0), !dbg !780
  %374 = icmp slt i32 %373, 0, !dbg !781
  br i1 %374, label %375, label %379, !dbg !782

375:                                              ; preds = %372
  %376 = call ptr @__errno_location() #16, !dbg !783
  %377 = load i32, ptr %376, align 4, !dbg !783
  %378 = call ptr @gettext(ptr noundef @.str.31) #12, !dbg !783
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %377, ptr noundef %378) #17, !dbg !783
  unreachable, !dbg !783

379:                                              ; preds = %372, %369
  %380 = load i8, ptr %23, align 1, !dbg !784
  %381 = trunc i8 %380 to i1, !dbg !784
  %382 = zext i1 %381 to i64, !dbg !784
  %383 = select i1 %381, i32 0, i32 1, !dbg !784
  ret i32 %383, !dbg !785
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
define internal i64 @io_blksize(ptr noundef %0) #4 !dbg !786 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !791, metadata !DIExpression()), !dbg !792
  call void @llvm.dbg.declare(metadata ptr %4, metadata !793, metadata !DIExpression()), !dbg !794
  %7 = load ptr, ptr %3, align 8, !dbg !795
  %8 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 9, !dbg !795
  %9 = load i64, ptr %8, align 8, !dbg !795
  %10 = icmp slt i64 0, %9, !dbg !795
  br i1 %10, label %11, label %20, !dbg !795

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8, !dbg !795
  %13 = getelementptr inbounds %struct.stat, ptr %12, i32 0, i32 9, !dbg !795
  %14 = load i64, ptr %13, align 8, !dbg !795
  %15 = icmp ule i64 %14, 2305843009213693952, !dbg !795
  br i1 %15, label %16, label %20, !dbg !795

16:                                               ; preds = %11
  %17 = load ptr, ptr %3, align 8, !dbg !795
  %18 = getelementptr inbounds %struct.stat, ptr %17, i32 0, i32 9, !dbg !795
  %19 = load i64, ptr %18, align 8, !dbg !795
  br label %21, !dbg !795

20:                                               ; preds = %11, %1
  br label %21, !dbg !795

21:                                               ; preds = %20, %16
  %22 = phi i64 [ %19, %16 ], [ 512, %20 ], !dbg !795
  %23 = icmp sle i64 %22, 0, !dbg !796
  br i1 %23, label %24, label %25, !dbg !795

24:                                               ; preds = %21
  br label %42, !dbg !795

25:                                               ; preds = %21
  %26 = load ptr, ptr %3, align 8, !dbg !797
  %27 = getelementptr inbounds %struct.stat, ptr %26, i32 0, i32 9, !dbg !797
  %28 = load i64, ptr %27, align 8, !dbg !797
  %29 = icmp slt i64 0, %28, !dbg !797
  br i1 %29, label %30, label %39, !dbg !797

30:                                               ; preds = %25
  %31 = load ptr, ptr %3, align 8, !dbg !797
  %32 = getelementptr inbounds %struct.stat, ptr %31, i32 0, i32 9, !dbg !797
  %33 = load i64, ptr %32, align 8, !dbg !797
  %34 = icmp ule i64 %33, 2305843009213693952, !dbg !797
  br i1 %34, label %35, label %39, !dbg !797

35:                                               ; preds = %30
  %36 = load ptr, ptr %3, align 8, !dbg !797
  %37 = getelementptr inbounds %struct.stat, ptr %36, i32 0, i32 9, !dbg !797
  %38 = load i64, ptr %37, align 8, !dbg !797
  br label %40, !dbg !797

39:                                               ; preds = %30, %25
  br label %40, !dbg !797

40:                                               ; preds = %39, %35
  %41 = phi i64 [ %38, %35 ], [ 512, %39 ], !dbg !797
  br label %42, !dbg !795

42:                                               ; preds = %40, %24
  %43 = phi i64 [ 262144, %24 ], [ %41, %40 ], !dbg !795
  store i64 %43, ptr %4, align 8, !dbg !794
  %44 = load i64, ptr %4, align 8, !dbg !798
  %45 = srem i64 262143, %44, !dbg !799
  %46 = sub nsw i64 262143, %45, !dbg !800
  %47 = load i64, ptr %4, align 8, !dbg !801
  %48 = add nsw i64 %47, %46, !dbg !801
  store i64 %48, ptr %4, align 8, !dbg !801
  %49 = load ptr, ptr %3, align 8, !dbg !802
  %50 = getelementptr inbounds %struct.stat, ptr %49, i32 0, i32 3, !dbg !802
  %51 = load i32, ptr %50, align 8, !dbg !802
  %52 = and i32 %51, 61440, !dbg !802
  %53 = icmp eq i32 %52, 32768, !dbg !802
  br i1 %53, label %54, label %80, !dbg !804

54:                                               ; preds = %42
  %55 = load i64, ptr %4, align 8, !dbg !805
  %56 = load i64, ptr %4, align 8, !dbg !806
  %57 = sub nsw i64 %56, 1, !dbg !807
  %58 = and i64 %55, %57, !dbg !808
  %59 = icmp ne i64 %58, 0, !dbg !808
  br i1 %59, label %60, label %80, !dbg !809

60:                                               ; preds = %54
  call void @llvm.dbg.declare(metadata ptr %5, metadata !810, metadata !DIExpression()), !dbg !812
  %61 = load i64, ptr %4, align 8, !dbg !813
  store i64 %61, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !814, metadata !DIExpression()), !dbg !822
  %62 = load i64, ptr %2, align 8, !dbg !824
  %63 = icmp eq i64 %62, 0, !dbg !825
  br i1 %63, label %64, label %65, !dbg !824

64:                                               ; preds = %60
  br label %69, !dbg !824

65:                                               ; preds = %60
  %66 = load i64, ptr %2, align 8, !dbg !826
  %67 = call i64 @llvm.ctlz.i64(i64 %66, i1 true), !dbg !827
  %68 = trunc i64 %67 to i32, !dbg !827
  br label %69, !dbg !824

69:                                               ; preds = %64, %65
  %70 = phi i32 [ 64, %64 ], [ %68, %65 ], !dbg !824
  store i32 %70, ptr %5, align 4, !dbg !812
  call void @llvm.dbg.declare(metadata ptr %6, metadata !828, metadata !DIExpression()), !dbg !832
  %71 = load i32, ptr %5, align 4, !dbg !833
  %72 = sub nsw i32 64, %71, !dbg !834
  %73 = zext i32 %72 to i64, !dbg !835
  %74 = shl i64 1, %73, !dbg !835
  store i64 %74, ptr %6, align 8, !dbg !832
  %75 = load i64, ptr %6, align 8, !dbg !836
  %76 = icmp ule i64 %75, 9223372036854775807, !dbg !838
  br i1 %76, label %77, label %79, !dbg !839

77:                                               ; preds = %69
  %78 = load i64, ptr %6, align 8, !dbg !840
  store i64 %78, ptr %4, align 8, !dbg !841
  br label %79, !dbg !842

79:                                               ; preds = %77, %69
  br label %80, !dbg !843

80:                                               ; preds = %79, %54, %42
  %81 = load i64, ptr %4, align 8, !dbg !844
  %82 = icmp ult i64 4611686018427387904, %81, !dbg !844
  br i1 %82, label %83, label %84, !dbg !844

83:                                               ; preds = %80
  br label %86, !dbg !844

84:                                               ; preds = %80
  %85 = load i64, ptr %4, align 8, !dbg !844
  br label %86, !dbg !844

86:                                               ; preds = %84, %83
  %87 = phi i64 [ 4611686018427387904, %83 ], [ %85, %84 ], !dbg !844
  ret i64 %87, !dbg !845
}

declare void @xset_binary_mode(i32 noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare i32 @getpagesize() #7

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #8

declare i32 @open(ptr noundef, i32 noundef, ...) #2

declare ptr @quotearg_n_style_colon(i32 noundef, i32 noundef, ptr noundef) #2

declare void @fdadvise(i32 noundef, i64 noundef, i64 noundef, i32 noundef) #2

declare i32 @rpl_fcntl(i32 noundef, i32 noundef, ...) #2

; Function Attrs: nounwind
declare i64 @lseek(i32 noundef, i64 noundef, i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @copy_cat() #4 !dbg !846 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  call void @llvm.dbg.declare(metadata ptr %2, metadata !849, metadata !DIExpression()), !dbg !852
  store i64 9223372035781033984, ptr %2, align 8, !dbg !852
  call void @llvm.dbg.declare(metadata ptr %3, metadata !853, metadata !DIExpression()), !dbg !855
  store i8 0, ptr %3, align 1, !dbg !855
  br label %4, !dbg !856

4:                                                ; preds = %47, %0
  %5 = load i32, ptr @input_desc, align 4, !dbg !857
  %6 = load i64, ptr %2, align 8, !dbg !859
  %7 = call i64 @rpl_copy_file_range(i32 noundef %5, ptr noundef null, i32 noundef 1, ptr noundef null, i64 noundef %6, i32 noundef 0), !dbg !860
  switch i64 %7, label %46 [
    i64 0, label %8
    i64 -1, label %12
  ], !dbg !861

8:                                                ; preds = %4
  %9 = load i8, ptr %3, align 1, !dbg !862
  %10 = trunc i8 %9 to i1, !dbg !862
  %11 = zext i1 %10 to i32, !dbg !862
  store i32 %11, ptr %1, align 4, !dbg !864
  br label %48, !dbg !864

12:                                               ; preds = %4
  %13 = call ptr @__errno_location() #16, !dbg !865
  %14 = load i32, ptr %13, align 4, !dbg !865
  %15 = icmp eq i32 %14, 38, !dbg !867
  br i1 %15, label %40, label %16, !dbg !868

16:                                               ; preds = %12
  %17 = call ptr @__errno_location() #16, !dbg !869
  %18 = load i32, ptr %17, align 4, !dbg !869
  %19 = call zeroext i1 @is_ENOTSUP(i32 noundef %18), !dbg !870
  br i1 %19, label %40, label %20, !dbg !871

20:                                               ; preds = %16
  %21 = call ptr @__errno_location() #16, !dbg !872
  %22 = load i32, ptr %21, align 4, !dbg !872
  %23 = icmp eq i32 %22, 22, !dbg !873
  br i1 %23, label %40, label %24, !dbg !874

24:                                               ; preds = %20
  %25 = call ptr @__errno_location() #16, !dbg !875
  %26 = load i32, ptr %25, align 4, !dbg !875
  %27 = icmp eq i32 %26, 9, !dbg !876
  br i1 %27, label %40, label %28, !dbg !877

28:                                               ; preds = %24
  %29 = call ptr @__errno_location() #16, !dbg !878
  %30 = load i32, ptr %29, align 4, !dbg !878
  %31 = icmp eq i32 %30, 18, !dbg !879
  br i1 %31, label %40, label %32, !dbg !880

32:                                               ; preds = %28
  %33 = call ptr @__errno_location() #16, !dbg !881
  %34 = load i32, ptr %33, align 4, !dbg !881
  %35 = icmp eq i32 %34, 26, !dbg !882
  br i1 %35, label %40, label %36, !dbg !883

36:                                               ; preds = %32
  %37 = call ptr @__errno_location() #16, !dbg !884
  %38 = load i32, ptr %37, align 4, !dbg !884
  %39 = icmp eq i32 %38, 1, !dbg !885
  br i1 %39, label %40, label %41, !dbg !886

40:                                               ; preds = %36, %32, %28, %24, %20, %16, %12
  store i32 0, ptr %1, align 4, !dbg !887
  br label %48, !dbg !887

41:                                               ; preds = %36
  %42 = call ptr @__errno_location() #16, !dbg !888
  %43 = load i32, ptr %42, align 4, !dbg !888
  %44 = load ptr, ptr @infile, align 8, !dbg !888
  %45 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %44), !dbg !888
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %43, ptr noundef @.str.28, ptr noundef %45) #17, !dbg !888
  store i32 -1, ptr %1, align 4, !dbg !889
  br label %48, !dbg !889

46:                                               ; preds = %4
  br label %47, !dbg !890

47:                                               ; preds = %46
  store i8 1, ptr %3, align 1, !dbg !891
  br label %4, !dbg !892, !llvm.loop !893

48:                                               ; preds = %41, %40, %8
  %49 = load i32, ptr %1, align 4, !dbg !896
  ret i32 %49, !dbg !896
}

; Function Attrs: allocsize(1)
declare noalias nonnull ptr @xalignalloc(i64 noundef, i64 noundef) #9

; Function Attrs: noinline nounwind uwtable
define internal zeroext i1 @simple_cat(ptr noundef %0, i64 noundef %1) #4 !dbg !897 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !900, metadata !DIExpression()), !dbg !901
  store i64 %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !902, metadata !DIExpression()), !dbg !903
  br label %7, !dbg !904

7:                                                ; preds = %2, %30
  call void @llvm.dbg.declare(metadata ptr %6, metadata !905, metadata !DIExpression()), !dbg !907
  %8 = load i32, ptr @input_desc, align 4, !dbg !908
  %9 = load ptr, ptr %4, align 8, !dbg !909
  %10 = load i64, ptr %5, align 8, !dbg !910
  %11 = call i64 @safe_read(i32 noundef %8, ptr noundef %9, i64 noundef %10), !dbg !911
  store i64 %11, ptr %6, align 8, !dbg !907
  %12 = load i64, ptr %6, align 8, !dbg !912
  %13 = icmp slt i64 %12, 0, !dbg !914
  br i1 %13, label %14, label %19, !dbg !915

14:                                               ; preds = %7
  %15 = call ptr @__errno_location() #16, !dbg !916
  %16 = load i32, ptr %15, align 4, !dbg !916
  %17 = load ptr, ptr @infile, align 8, !dbg !916
  %18 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %17), !dbg !916
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %16, ptr noundef @.str.28, ptr noundef %18) #17, !dbg !916
  store i1 false, ptr %3, align 1, !dbg !918
  br label %31, !dbg !918

19:                                               ; preds = %7
  %20 = load i64, ptr %6, align 8, !dbg !919
  %21 = icmp eq i64 %20, 0, !dbg !921
  br i1 %21, label %22, label %23, !dbg !922

22:                                               ; preds = %19
  store i1 true, ptr %3, align 1, !dbg !923
  br label %31, !dbg !923

23:                                               ; preds = %19
  %24 = load ptr, ptr %4, align 8, !dbg !924
  %25 = load i64, ptr %6, align 8, !dbg !926
  %26 = call i64 @full_write(i32 noundef 1, ptr noundef %24, i64 noundef %25), !dbg !927
  %27 = load i64, ptr %6, align 8, !dbg !928
  %28 = icmp ne i64 %26, %27, !dbg !929
  br i1 %28, label %29, label %30, !dbg !930

29:                                               ; preds = %23
  call void @write_error(), !dbg !931
  br label %30, !dbg !931

30:                                               ; preds = %29, %23
  br label %7, !dbg !904, !llvm.loop !932

31:                                               ; preds = %22, %14
  %32 = load i1, ptr %3, align 1, !dbg !934
  ret i1 %32, !dbg !934
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: noreturn
declare void @xalloc_die() #10

; Function Attrs: noinline nounwind uwtable
define internal zeroext i1 @cat(ptr noundef %0, i64 noundef %1, ptr noundef %2, i64 noundef %3, i1 noundef zeroext %4, i1 noundef zeroext %5, i1 noundef zeroext %6, i1 noundef zeroext %7, i1 noundef zeroext %8, i1 noundef zeroext %9) #4 !dbg !935 {
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
  call void @llvm.dbg.declare(metadata ptr %12, metadata !938, metadata !DIExpression()), !dbg !939
  store i64 %1, ptr %13, align 8
  call void @llvm.dbg.declare(metadata ptr %13, metadata !940, metadata !DIExpression()), !dbg !941
  store ptr %2, ptr %14, align 8
  call void @llvm.dbg.declare(metadata ptr %14, metadata !942, metadata !DIExpression()), !dbg !943
  store i64 %3, ptr %15, align 8
  call void @llvm.dbg.declare(metadata ptr %15, metadata !944, metadata !DIExpression()), !dbg !945
  %33 = zext i1 %4 to i8
  store i8 %33, ptr %16, align 1
  call void @llvm.dbg.declare(metadata ptr %16, metadata !946, metadata !DIExpression()), !dbg !947
  %34 = zext i1 %5 to i8
  store i8 %34, ptr %17, align 1
  call void @llvm.dbg.declare(metadata ptr %17, metadata !948, metadata !DIExpression()), !dbg !949
  %35 = zext i1 %6 to i8
  store i8 %35, ptr %18, align 1
  call void @llvm.dbg.declare(metadata ptr %18, metadata !950, metadata !DIExpression()), !dbg !951
  %36 = zext i1 %7 to i8
  store i8 %36, ptr %19, align 1
  call void @llvm.dbg.declare(metadata ptr %19, metadata !952, metadata !DIExpression()), !dbg !953
  %37 = zext i1 %8 to i8
  store i8 %37, ptr %20, align 1
  call void @llvm.dbg.declare(metadata ptr %20, metadata !954, metadata !DIExpression()), !dbg !955
  %38 = zext i1 %9 to i8
  store i8 %38, ptr %21, align 1
  call void @llvm.dbg.declare(metadata ptr %21, metadata !956, metadata !DIExpression()), !dbg !957
  call void @llvm.dbg.declare(metadata ptr %22, metadata !958, metadata !DIExpression()), !dbg !960
  call void @llvm.dbg.declare(metadata ptr %23, metadata !961, metadata !DIExpression()), !dbg !962
  %39 = load i32, ptr @newlines2, align 4, !dbg !963
  store i32 %39, ptr %23, align 4, !dbg !962
  call void @llvm.dbg.declare(metadata ptr %24, metadata !964, metadata !DIExpression()), !dbg !965
  store i8 1, ptr %24, align 1, !dbg !965
  call void @llvm.dbg.declare(metadata ptr %25, metadata !966, metadata !DIExpression()), !dbg !967
  %40 = load ptr, ptr %12, align 8, !dbg !968
  store ptr %40, ptr %25, align 8, !dbg !967
  call void @llvm.dbg.declare(metadata ptr %26, metadata !969, metadata !DIExpression()), !dbg !970
  %41 = load ptr, ptr %25, align 8, !dbg !971
  %42 = getelementptr inbounds i8, ptr %41, i64 1, !dbg !972
  store ptr %42, ptr %26, align 8, !dbg !970
  call void @llvm.dbg.declare(metadata ptr %27, metadata !973, metadata !DIExpression()), !dbg !974
  %43 = load ptr, ptr %14, align 8, !dbg !975
  store ptr %43, ptr %27, align 8, !dbg !974
  br label %44, !dbg !976

44:                                               ; preds = %10, %372
  br label %45, !dbg !977

45:                                               ; preds = %202, %44
  %46 = load ptr, ptr %14, align 8, !dbg !979
  %47 = load i64, ptr %15, align 8, !dbg !982
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !983
  %49 = load ptr, ptr %27, align 8, !dbg !984
  %50 = icmp ule ptr %48, %49, !dbg !985
  br i1 %50, label %51, label %80, !dbg !986

51:                                               ; preds = %45
  call void @llvm.dbg.declare(metadata ptr %28, metadata !987, metadata !DIExpression()), !dbg !989
  %52 = load ptr, ptr %14, align 8, !dbg !990
  store ptr %52, ptr %28, align 8, !dbg !989
  call void @llvm.dbg.declare(metadata ptr %29, metadata !991, metadata !DIExpression()), !dbg !992
  br label %53, !dbg !993

53:                                               ; preds = %69, %51
  %54 = load ptr, ptr %28, align 8, !dbg !994
  %55 = load i64, ptr %15, align 8, !dbg !997
  %56 = call i64 @full_write(i32 noundef 1, ptr noundef %54, i64 noundef %55), !dbg !998
  %57 = load i64, ptr %15, align 8, !dbg !999
  %58 = icmp ne i64 %56, %57, !dbg !1000
  br i1 %58, label %59, label %60, !dbg !1001

59:                                               ; preds = %53
  call void @write_error(), !dbg !1002
  br label %60, !dbg !1002

60:                                               ; preds = %59, %53
  %61 = load i64, ptr %15, align 8, !dbg !1003
  %62 = load ptr, ptr %28, align 8, !dbg !1004
  %63 = getelementptr inbounds i8, ptr %62, i64 %61, !dbg !1004
  store ptr %63, ptr %28, align 8, !dbg !1004
  %64 = load ptr, ptr %27, align 8, !dbg !1005
  %65 = load ptr, ptr %28, align 8, !dbg !1006
  %66 = ptrtoint ptr %64 to i64, !dbg !1007
  %67 = ptrtoint ptr %65 to i64, !dbg !1007
  %68 = sub i64 %66, %67, !dbg !1007
  store i64 %68, ptr %29, align 8, !dbg !1008
  br label %69, !dbg !1009

69:                                               ; preds = %60
  %70 = load i64, ptr %15, align 8, !dbg !1010
  %71 = load i64, ptr %29, align 8, !dbg !1011
  %72 = icmp sle i64 %70, %71, !dbg !1012
  br i1 %72, label %53, label %73, !dbg !1009, !llvm.loop !1013

73:                                               ; preds = %69
  %74 = load ptr, ptr %14, align 8, !dbg !1015
  %75 = load ptr, ptr %28, align 8, !dbg !1016
  %76 = load i64, ptr %29, align 8, !dbg !1017
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %74, ptr align 1 %75, i64 %76, i1 false), !dbg !1018
  %77 = load ptr, ptr %14, align 8, !dbg !1019
  %78 = load i64, ptr %29, align 8, !dbg !1020
  %79 = getelementptr inbounds i8, ptr %77, i64 %78, !dbg !1021
  store ptr %79, ptr %27, align 8, !dbg !1022
  br label %80, !dbg !1023

80:                                               ; preds = %73, %45
  %81 = load ptr, ptr %26, align 8, !dbg !1024
  %82 = load ptr, ptr %25, align 8, !dbg !1026
  %83 = icmp ugt ptr %81, %82, !dbg !1027
  br i1 %83, label %84, label %155, !dbg !1028

84:                                               ; preds = %80
  call void @llvm.dbg.declare(metadata ptr %30, metadata !1029, metadata !DIExpression()), !dbg !1031
  store i8 0, ptr %30, align 1, !dbg !1031
  call void @llvm.dbg.declare(metadata ptr %31, metadata !1032, metadata !DIExpression()), !dbg !1033
  store i32 0, ptr %31, align 4, !dbg !1033
  %85 = load i8, ptr %24, align 1, !dbg !1034
  %86 = trunc i8 %85 to i1, !dbg !1034
  br i1 %86, label %87, label %120, !dbg !1036

87:                                               ; preds = %84
  %88 = load i32, ptr @input_desc, align 4, !dbg !1037
  %89 = call i32 (i32, i64, ...) @ioctl(i32 noundef %88, i64 noundef 21531, ptr noundef %31) #12, !dbg !1038
  %90 = icmp slt i32 %89, 0, !dbg !1039
  br i1 %90, label %91, label %120, !dbg !1040

91:                                               ; preds = %87
  %92 = call ptr @__errno_location() #16, !dbg !1041
  %93 = load i32, ptr %92, align 4, !dbg !1041
  %94 = icmp eq i32 %93, 95, !dbg !1044
  br i1 %94, label %111, label %95, !dbg !1045

95:                                               ; preds = %91
  %96 = call ptr @__errno_location() #16, !dbg !1046
  %97 = load i32, ptr %96, align 4, !dbg !1046
  %98 = icmp eq i32 %97, 25, !dbg !1047
  br i1 %98, label %111, label %99, !dbg !1048

99:                                               ; preds = %95
  %100 = call ptr @__errno_location() #16, !dbg !1049
  %101 = load i32, ptr %100, align 4, !dbg !1049
  %102 = icmp eq i32 %101, 22, !dbg !1050
  br i1 %102, label %111, label %103, !dbg !1051

103:                                              ; preds = %99
  %104 = call ptr @__errno_location() #16, !dbg !1052
  %105 = load i32, ptr %104, align 4, !dbg !1052
  %106 = icmp eq i32 %105, 19, !dbg !1053
  br i1 %106, label %111, label %107, !dbg !1054

107:                                              ; preds = %103
  %108 = call ptr @__errno_location() #16, !dbg !1055
  %109 = load i32, ptr %108, align 4, !dbg !1055
  %110 = icmp eq i32 %109, 38, !dbg !1056
  br i1 %110, label %111, label %112, !dbg !1057

111:                                              ; preds = %107, %103, %99, %95, %91
  store i8 0, ptr %24, align 1, !dbg !1058
  br label %119, !dbg !1059

112:                                              ; preds = %107
  %113 = call ptr @__errno_location() #16, !dbg !1060
  %114 = load i32, ptr %113, align 4, !dbg !1060
  %115 = call ptr @gettext(ptr noundef @.str.48) #12, !dbg !1060
  %116 = load ptr, ptr @infile, align 8, !dbg !1060
  %117 = call ptr @quotearg_style(i32 noundef 4, ptr noundef %116), !dbg !1060
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %114, ptr noundef %115, ptr noundef %117) #17, !dbg !1060
  %118 = load i32, ptr %23, align 4, !dbg !1062
  store i32 %118, ptr @newlines2, align 4, !dbg !1063
  store i1 false, ptr %11, align 1, !dbg !1064
  br label %373, !dbg !1064

119:                                              ; preds = %111
  br label %120, !dbg !1065

120:                                              ; preds = %119, %87, %84
  %121 = load i32, ptr %31, align 4, !dbg !1066
  %122 = icmp ne i32 %121, 0, !dbg !1068
  br i1 %122, label %123, label %124, !dbg !1069

123:                                              ; preds = %120
  store i8 1, ptr %30, align 1, !dbg !1070
  br label %124, !dbg !1071

124:                                              ; preds = %123, %120
  %125 = load i8, ptr %30, align 1, !dbg !1072
  %126 = trunc i8 %125 to i1, !dbg !1072
  br i1 %126, label %129, label %127, !dbg !1074

127:                                              ; preds = %124
  %128 = load ptr, ptr %14, align 8, !dbg !1075
  call void @write_pending(ptr noundef %128, ptr noundef %27), !dbg !1076
  br label %129, !dbg !1076

129:                                              ; preds = %127, %124
  call void @llvm.dbg.declare(metadata ptr %32, metadata !1077, metadata !DIExpression()), !dbg !1078
  %130 = load i32, ptr @input_desc, align 4, !dbg !1079
  %131 = load ptr, ptr %12, align 8, !dbg !1080
  %132 = load i64, ptr %13, align 8, !dbg !1081
  %133 = call i64 @safe_read(i32 noundef %130, ptr noundef %131, i64 noundef %132), !dbg !1082
  store i64 %133, ptr %32, align 8, !dbg !1078
  %134 = load i64, ptr %32, align 8, !dbg !1083
  %135 = icmp slt i64 %134, 0, !dbg !1085
  br i1 %135, label %136, label %143, !dbg !1086

136:                                              ; preds = %129
  %137 = call ptr @__errno_location() #16, !dbg !1087
  %138 = load i32, ptr %137, align 4, !dbg !1087
  %139 = load ptr, ptr @infile, align 8, !dbg !1087
  %140 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %139), !dbg !1087
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %138, ptr noundef @.str.28, ptr noundef %140) #17, !dbg !1087
  %141 = load ptr, ptr %14, align 8, !dbg !1089
  call void @write_pending(ptr noundef %141, ptr noundef %27), !dbg !1090
  %142 = load i32, ptr %23, align 4, !dbg !1091
  store i32 %142, ptr @newlines2, align 4, !dbg !1092
  store i1 false, ptr %11, align 1, !dbg !1093
  br label %373, !dbg !1093

143:                                              ; preds = %129
  %144 = load i64, ptr %32, align 8, !dbg !1094
  %145 = icmp eq i64 %144, 0, !dbg !1096
  br i1 %145, label %146, label %149, !dbg !1097

146:                                              ; preds = %143
  %147 = load ptr, ptr %14, align 8, !dbg !1098
  call void @write_pending(ptr noundef %147, ptr noundef %27), !dbg !1100
  %148 = load i32, ptr %23, align 4, !dbg !1101
  store i32 %148, ptr @newlines2, align 4, !dbg !1102
  store i1 true, ptr %11, align 1, !dbg !1103
  br label %373, !dbg !1103

149:                                              ; preds = %143
  %150 = load ptr, ptr %12, align 8, !dbg !1104
  store ptr %150, ptr %26, align 8, !dbg !1105
  %151 = load ptr, ptr %26, align 8, !dbg !1106
  %152 = load i64, ptr %32, align 8, !dbg !1107
  %153 = getelementptr inbounds i8, ptr %151, i64 %152, !dbg !1108
  store ptr %153, ptr %25, align 8, !dbg !1109
  %154 = load ptr, ptr %25, align 8, !dbg !1110
  store i8 10, ptr %154, align 1, !dbg !1111
  br label %198, !dbg !1112

155:                                              ; preds = %80
  %156 = load i32, ptr %23, align 4, !dbg !1113
  %157 = add nsw i32 %156, 1, !dbg !1113
  store i32 %157, ptr %23, align 4, !dbg !1113
  %158 = icmp sgt i32 %157, 0, !dbg !1116
  br i1 %158, label %159, label %181, !dbg !1117

159:                                              ; preds = %155
  %160 = load i32, ptr %23, align 4, !dbg !1118
  %161 = icmp sge i32 %160, 2, !dbg !1121
  br i1 %161, label %162, label %170, !dbg !1122

162:                                              ; preds = %159
  store i32 2, ptr %23, align 4, !dbg !1123
  %163 = load i8, ptr %21, align 1, !dbg !1125
  %164 = trunc i8 %163 to i1, !dbg !1125
  br i1 %164, label %165, label %169, !dbg !1127

165:                                              ; preds = %162
  %166 = load ptr, ptr %26, align 8, !dbg !1128
  %167 = getelementptr inbounds i8, ptr %166, i32 1, !dbg !1128
  store ptr %167, ptr %26, align 8, !dbg !1128
  %168 = load i8, ptr %166, align 1, !dbg !1130
  store i8 %168, ptr %22, align 1, !dbg !1131
  br label %202, !dbg !1132

169:                                              ; preds = %162
  br label %170, !dbg !1133

170:                                              ; preds = %169, %159
  %171 = load i8, ptr %18, align 1, !dbg !1134
  %172 = trunc i8 %171 to i1, !dbg !1134
  br i1 %172, label %173, label %180, !dbg !1136

173:                                              ; preds = %170
  %174 = load i8, ptr %19, align 1, !dbg !1137
  %175 = trunc i8 %174 to i1, !dbg !1137
  br i1 %175, label %180, label %176, !dbg !1138

176:                                              ; preds = %173
  call void @next_line_num(), !dbg !1139
  %177 = load ptr, ptr %27, align 8, !dbg !1141
  %178 = load ptr, ptr @line_num_print, align 8, !dbg !1142
  %179 = call ptr @stpcpy(ptr noundef %177, ptr noundef %178) #12, !dbg !1143
  store ptr %179, ptr %27, align 8, !dbg !1144
  br label %180, !dbg !1145

180:                                              ; preds = %176, %173, %170
  br label %181, !dbg !1146

181:                                              ; preds = %180, %155
  %182 = load i8, ptr %20, align 1, !dbg !1147
  %183 = trunc i8 %182 to i1, !dbg !1147
  br i1 %183, label %184, label %195, !dbg !1149

184:                                              ; preds = %181
  %185 = load i8, ptr @pending_cr, align 1, !dbg !1150
  %186 = trunc i8 %185 to i1, !dbg !1150
  br i1 %186, label %187, label %192, !dbg !1153

187:                                              ; preds = %184
  %188 = load ptr, ptr %27, align 8, !dbg !1154
  %189 = getelementptr inbounds i8, ptr %188, i32 1, !dbg !1154
  store ptr %189, ptr %27, align 8, !dbg !1154
  store i8 94, ptr %188, align 1, !dbg !1156
  %190 = load ptr, ptr %27, align 8, !dbg !1157
  %191 = getelementptr inbounds i8, ptr %190, i32 1, !dbg !1157
  store ptr %191, ptr %27, align 8, !dbg !1157
  store i8 77, ptr %190, align 1, !dbg !1158
  store i8 0, ptr @pending_cr, align 1, !dbg !1159
  br label %192, !dbg !1160

192:                                              ; preds = %187, %184
  %193 = load ptr, ptr %27, align 8, !dbg !1161
  %194 = getelementptr inbounds i8, ptr %193, i32 1, !dbg !1161
  store ptr %194, ptr %27, align 8, !dbg !1161
  store i8 36, ptr %193, align 1, !dbg !1162
  br label %195, !dbg !1163

195:                                              ; preds = %192, %181
  %196 = load ptr, ptr %27, align 8, !dbg !1164
  %197 = getelementptr inbounds i8, ptr %196, i32 1, !dbg !1164
  store ptr %197, ptr %27, align 8, !dbg !1164
  store i8 10, ptr %196, align 1, !dbg !1165
  br label %198

198:                                              ; preds = %195, %149
  %199 = load ptr, ptr %26, align 8, !dbg !1166
  %200 = getelementptr inbounds i8, ptr %199, i32 1, !dbg !1166
  store ptr %200, ptr %26, align 8, !dbg !1166
  %201 = load i8, ptr %199, align 1, !dbg !1167
  store i8 %201, ptr %22, align 1, !dbg !1168
  br label %202, !dbg !1169

202:                                              ; preds = %198, %165
  %203 = load i8, ptr %22, align 1, !dbg !1170
  %204 = zext i8 %203 to i32, !dbg !1170
  %205 = icmp eq i32 %204, 10, !dbg !1171
  br i1 %205, label %45, label %206, !dbg !1169, !llvm.loop !1172

206:                                              ; preds = %202
  %207 = load i8, ptr @pending_cr, align 1, !dbg !1174
  %208 = trunc i8 %207 to i1, !dbg !1174
  br i1 %208, label %209, label %212, !dbg !1176

209:                                              ; preds = %206
  %210 = load ptr, ptr %27, align 8, !dbg !1177
  %211 = getelementptr inbounds i8, ptr %210, i32 1, !dbg !1177
  store ptr %211, ptr %27, align 8, !dbg !1177
  store i8 13, ptr %210, align 1, !dbg !1179
  store i8 0, ptr @pending_cr, align 1, !dbg !1180
  br label %212, !dbg !1181

212:                                              ; preds = %209, %206
  %213 = load i32, ptr %23, align 4, !dbg !1182
  %214 = icmp sge i32 %213, 0, !dbg !1184
  br i1 %214, label %215, label %222, !dbg !1185

215:                                              ; preds = %212
  %216 = load i8, ptr %18, align 1, !dbg !1186
  %217 = trunc i8 %216 to i1, !dbg !1186
  br i1 %217, label %218, label %222, !dbg !1187

218:                                              ; preds = %215
  call void @next_line_num(), !dbg !1188
  %219 = load ptr, ptr %27, align 8, !dbg !1190
  %220 = load ptr, ptr @line_num_print, align 8, !dbg !1191
  %221 = call ptr @stpcpy(ptr noundef %219, ptr noundef %220) #12, !dbg !1192
  store ptr %221, ptr %27, align 8, !dbg !1193
  br label %222, !dbg !1194

222:                                              ; preds = %218, %215, %212
  %223 = load i8, ptr %16, align 1, !dbg !1195
  %224 = trunc i8 %223 to i1, !dbg !1195
  br i1 %224, label %225, label %316, !dbg !1197

225:                                              ; preds = %222
  br label %226, !dbg !1198

226:                                              ; preds = %225, %311
  %227 = load i8, ptr %22, align 1, !dbg !1200
  %228 = zext i8 %227 to i32, !dbg !1200
  %229 = icmp sge i32 %228, 32, !dbg !1203
  br i1 %229, label %230, label %285, !dbg !1204

230:                                              ; preds = %226
  %231 = load i8, ptr %22, align 1, !dbg !1205
  %232 = zext i8 %231 to i32, !dbg !1205
  %233 = icmp slt i32 %232, 127, !dbg !1208
  br i1 %233, label %234, label %238, !dbg !1209

234:                                              ; preds = %230
  %235 = load i8, ptr %22, align 1, !dbg !1210
  %236 = load ptr, ptr %27, align 8, !dbg !1211
  %237 = getelementptr inbounds i8, ptr %236, i32 1, !dbg !1211
  store ptr %237, ptr %27, align 8, !dbg !1211
  store i8 %235, ptr %236, align 1, !dbg !1212
  br label %284, !dbg !1213

238:                                              ; preds = %230
  %239 = load i8, ptr %22, align 1, !dbg !1214
  %240 = zext i8 %239 to i32, !dbg !1214
  %241 = icmp eq i32 %240, 127, !dbg !1216
  br i1 %241, label %242, label %247, !dbg !1217

242:                                              ; preds = %238
  %243 = load ptr, ptr %27, align 8, !dbg !1218
  %244 = getelementptr inbounds i8, ptr %243, i32 1, !dbg !1218
  store ptr %244, ptr %27, align 8, !dbg !1218
  store i8 94, ptr %243, align 1, !dbg !1220
  %245 = load ptr, ptr %27, align 8, !dbg !1221
  %246 = getelementptr inbounds i8, ptr %245, i32 1, !dbg !1221
  store ptr %246, ptr %27, align 8, !dbg !1221
  store i8 63, ptr %245, align 1, !dbg !1222
  br label %283, !dbg !1223

247:                                              ; preds = %238
  %248 = load ptr, ptr %27, align 8, !dbg !1224
  %249 = getelementptr inbounds i8, ptr %248, i32 1, !dbg !1224
  store ptr %249, ptr %27, align 8, !dbg !1224
  store i8 77, ptr %248, align 1, !dbg !1226
  %250 = load ptr, ptr %27, align 8, !dbg !1227
  %251 = getelementptr inbounds i8, ptr %250, i32 1, !dbg !1227
  store ptr %251, ptr %27, align 8, !dbg !1227
  store i8 45, ptr %250, align 1, !dbg !1228
  %252 = load i8, ptr %22, align 1, !dbg !1229
  %253 = zext i8 %252 to i32, !dbg !1229
  %254 = icmp sge i32 %253, 160, !dbg !1231
  br i1 %254, label %255, label %272, !dbg !1232

255:                                              ; preds = %247
  %256 = load i8, ptr %22, align 1, !dbg !1233
  %257 = zext i8 %256 to i32, !dbg !1233
  %258 = icmp slt i32 %257, 255, !dbg !1236
  br i1 %258, label %259, label %266, !dbg !1237

259:                                              ; preds = %255
  %260 = load i8, ptr %22, align 1, !dbg !1238
  %261 = zext i8 %260 to i32, !dbg !1238
  %262 = sub nsw i32 %261, 128, !dbg !1239
  %263 = trunc i32 %262 to i8, !dbg !1238
  %264 = load ptr, ptr %27, align 8, !dbg !1240
  %265 = getelementptr inbounds i8, ptr %264, i32 1, !dbg !1240
  store ptr %265, ptr %27, align 8, !dbg !1240
  store i8 %263, ptr %264, align 1, !dbg !1241
  br label %271, !dbg !1242

266:                                              ; preds = %255
  %267 = load ptr, ptr %27, align 8, !dbg !1243
  %268 = getelementptr inbounds i8, ptr %267, i32 1, !dbg !1243
  store ptr %268, ptr %27, align 8, !dbg !1243
  store i8 94, ptr %267, align 1, !dbg !1245
  %269 = load ptr, ptr %27, align 8, !dbg !1246
  %270 = getelementptr inbounds i8, ptr %269, i32 1, !dbg !1246
  store ptr %270, ptr %27, align 8, !dbg !1246
  store i8 63, ptr %269, align 1, !dbg !1247
  br label %271

271:                                              ; preds = %266, %259
  br label %282, !dbg !1248

272:                                              ; preds = %247
  %273 = load ptr, ptr %27, align 8, !dbg !1249
  %274 = getelementptr inbounds i8, ptr %273, i32 1, !dbg !1249
  store ptr %274, ptr %27, align 8, !dbg !1249
  store i8 94, ptr %273, align 1, !dbg !1251
  %275 = load i8, ptr %22, align 1, !dbg !1252
  %276 = zext i8 %275 to i32, !dbg !1252
  %277 = sub nsw i32 %276, 128, !dbg !1253
  %278 = add nsw i32 %277, 64, !dbg !1254
  %279 = trunc i32 %278 to i8, !dbg !1252
  %280 = load ptr, ptr %27, align 8, !dbg !1255
  %281 = getelementptr inbounds i8, ptr %280, i32 1, !dbg !1255
  store ptr %281, ptr %27, align 8, !dbg !1255
  store i8 %279, ptr %280, align 1, !dbg !1256
  br label %282

282:                                              ; preds = %272, %271
  br label %283

283:                                              ; preds = %282, %242
  br label %284

284:                                              ; preds = %283, %234
  br label %311, !dbg !1257

285:                                              ; preds = %226
  %286 = load i8, ptr %22, align 1, !dbg !1258
  %287 = zext i8 %286 to i32, !dbg !1258
  %288 = icmp eq i32 %287, 9, !dbg !1260
  br i1 %288, label %289, label %295, !dbg !1261

289:                                              ; preds = %285
  %290 = load i8, ptr %17, align 1, !dbg !1262
  %291 = trunc i8 %290 to i1, !dbg !1262
  br i1 %291, label %295, label %292, !dbg !1263

292:                                              ; preds = %289
  %293 = load ptr, ptr %27, align 8, !dbg !1264
  %294 = getelementptr inbounds i8, ptr %293, i32 1, !dbg !1264
  store ptr %294, ptr %27, align 8, !dbg !1264
  store i8 9, ptr %293, align 1, !dbg !1265
  br label %310, !dbg !1266

295:                                              ; preds = %289, %285
  %296 = load i8, ptr %22, align 1, !dbg !1267
  %297 = zext i8 %296 to i32, !dbg !1267
  %298 = icmp eq i32 %297, 10, !dbg !1269
  br i1 %298, label %299, label %300, !dbg !1270

299:                                              ; preds = %295
  store i32 -1, ptr %23, align 4, !dbg !1271
  br label %315, !dbg !1273

300:                                              ; preds = %295
  %301 = load ptr, ptr %27, align 8, !dbg !1274
  %302 = getelementptr inbounds i8, ptr %301, i32 1, !dbg !1274
  store ptr %302, ptr %27, align 8, !dbg !1274
  store i8 94, ptr %301, align 1, !dbg !1276
  %303 = load i8, ptr %22, align 1, !dbg !1277
  %304 = zext i8 %303 to i32, !dbg !1277
  %305 = add nsw i32 %304, 64, !dbg !1278
  %306 = trunc i32 %305 to i8, !dbg !1277
  %307 = load ptr, ptr %27, align 8, !dbg !1279
  %308 = getelementptr inbounds i8, ptr %307, i32 1, !dbg !1279
  store ptr %308, ptr %27, align 8, !dbg !1279
  store i8 %306, ptr %307, align 1, !dbg !1280
  br label %309

309:                                              ; preds = %300
  br label %310

310:                                              ; preds = %309, %292
  br label %311

311:                                              ; preds = %310, %284
  %312 = load ptr, ptr %26, align 8, !dbg !1281
  %313 = getelementptr inbounds i8, ptr %312, i32 1, !dbg !1281
  store ptr %313, ptr %26, align 8, !dbg !1281
  %314 = load i8, ptr %312, align 1, !dbg !1282
  store i8 %314, ptr %22, align 1, !dbg !1283
  br label %226, !dbg !1198, !llvm.loop !1284

315:                                              ; preds = %299
  br label %372, !dbg !1286

316:                                              ; preds = %222
  br label %317, !dbg !1287

317:                                              ; preds = %316, %367
  %318 = load i8, ptr %22, align 1, !dbg !1289
  %319 = zext i8 %318 to i32, !dbg !1289
  %320 = icmp eq i32 %319, 9, !dbg !1292
  br i1 %320, label %321, label %333, !dbg !1293

321:                                              ; preds = %317
  %322 = load i8, ptr %17, align 1, !dbg !1294
  %323 = trunc i8 %322 to i1, !dbg !1294
  br i1 %323, label %324, label %333, !dbg !1295

324:                                              ; preds = %321
  %325 = load ptr, ptr %27, align 8, !dbg !1296
  %326 = getelementptr inbounds i8, ptr %325, i32 1, !dbg !1296
  store ptr %326, ptr %27, align 8, !dbg !1296
  store i8 94, ptr %325, align 1, !dbg !1298
  %327 = load i8, ptr %22, align 1, !dbg !1299
  %328 = zext i8 %327 to i32, !dbg !1299
  %329 = add nsw i32 %328, 64, !dbg !1300
  %330 = trunc i32 %329 to i8, !dbg !1299
  %331 = load ptr, ptr %27, align 8, !dbg !1301
  %332 = getelementptr inbounds i8, ptr %331, i32 1, !dbg !1301
  store ptr %332, ptr %27, align 8, !dbg !1301
  store i8 %330, ptr %331, align 1, !dbg !1302
  br label %367, !dbg !1303

333:                                              ; preds = %321, %317
  %334 = load i8, ptr %22, align 1, !dbg !1304
  %335 = zext i8 %334 to i32, !dbg !1304
  %336 = icmp ne i32 %335, 10, !dbg !1306
  br i1 %336, label %337, label %365, !dbg !1307

337:                                              ; preds = %333
  %338 = load i8, ptr %22, align 1, !dbg !1308
  %339 = zext i8 %338 to i32, !dbg !1308
  %340 = icmp eq i32 %339, 13, !dbg !1311
  br i1 %340, label %341, label %360, !dbg !1312

341:                                              ; preds = %337
  %342 = load ptr, ptr %26, align 8, !dbg !1313
  %343 = load i8, ptr %342, align 1, !dbg !1314
  %344 = sext i8 %343 to i32, !dbg !1314
  %345 = icmp eq i32 %344, 10, !dbg !1315
  br i1 %345, label %346, label %360, !dbg !1316

346:                                              ; preds = %341
  %347 = load i8, ptr %20, align 1, !dbg !1317
  %348 = trunc i8 %347 to i1, !dbg !1317
  br i1 %348, label %349, label %360, !dbg !1318

349:                                              ; preds = %346
  %350 = load ptr, ptr %26, align 8, !dbg !1319
  %351 = load ptr, ptr %25, align 8, !dbg !1322
  %352 = icmp eq ptr %350, %351, !dbg !1323
  br i1 %352, label %353, label %354, !dbg !1324

353:                                              ; preds = %349
  store i8 1, ptr @pending_cr, align 1, !dbg !1325
  br label %359, !dbg !1326

354:                                              ; preds = %349
  %355 = load ptr, ptr %27, align 8, !dbg !1327
  %356 = getelementptr inbounds i8, ptr %355, i32 1, !dbg !1327
  store ptr %356, ptr %27, align 8, !dbg !1327
  store i8 94, ptr %355, align 1, !dbg !1329
  %357 = load ptr, ptr %27, align 8, !dbg !1330
  %358 = getelementptr inbounds i8, ptr %357, i32 1, !dbg !1330
  store ptr %358, ptr %27, align 8, !dbg !1330
  store i8 77, ptr %357, align 1, !dbg !1331
  br label %359

359:                                              ; preds = %354, %353
  br label %364, !dbg !1332

360:                                              ; preds = %346, %341, %337
  %361 = load i8, ptr %22, align 1, !dbg !1333
  %362 = load ptr, ptr %27, align 8, !dbg !1334
  %363 = getelementptr inbounds i8, ptr %362, i32 1, !dbg !1334
  store ptr %363, ptr %27, align 8, !dbg !1334
  store i8 %361, ptr %362, align 1, !dbg !1335
  br label %364

364:                                              ; preds = %360, %359
  br label %366, !dbg !1336

365:                                              ; preds = %333
  store i32 -1, ptr %23, align 4, !dbg !1337
  br label %371, !dbg !1339

366:                                              ; preds = %364
  br label %367

367:                                              ; preds = %366, %324
  %368 = load ptr, ptr %26, align 8, !dbg !1340
  %369 = getelementptr inbounds i8, ptr %368, i32 1, !dbg !1340
  store ptr %369, ptr %26, align 8, !dbg !1340
  %370 = load i8, ptr %368, align 1, !dbg !1341
  store i8 %370, ptr %22, align 1, !dbg !1342
  br label %317, !dbg !1287, !llvm.loop !1343

371:                                              ; preds = %365
  br label %372

372:                                              ; preds = %371, %315
  br label %44, !dbg !976, !llvm.loop !1345

373:                                              ; preds = %146, %136, %112
  %374 = load i1, ptr %11, align 1, !dbg !1347
  ret i1 %374, !dbg !1347
}

declare void @alignfree(ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #1

declare i32 @close(i32 noundef) #2

declare i64 @full_write(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define internal void @write_error() #4 !dbg !1348 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata ptr %1, metadata !1349, metadata !DIExpression()), !dbg !1350
  %2 = call ptr @__errno_location() #16, !dbg !1351
  %3 = load i32, ptr %2, align 4, !dbg !1351
  store i32 %3, ptr %1, align 4, !dbg !1350
  %4 = load ptr, ptr @stdout, align 8, !dbg !1352
  %5 = call i32 @fflush_unlocked(ptr noundef %4), !dbg !1352
  %6 = load ptr, ptr @stdout, align 8, !dbg !1353
  %7 = call i32 @fpurge(ptr noundef %6), !dbg !1354
  %8 = load ptr, ptr @stdout, align 8, !dbg !1355
  call void @clearerr_unlocked(ptr noundef %8) #12, !dbg !1355
  %9 = load i32, ptr %1, align 4, !dbg !1356
  %10 = call ptr @gettext(ptr noundef @.str.49) #12, !dbg !1356
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %9, ptr noundef %10) #17, !dbg !1356
  unreachable, !dbg !1356
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
define internal zeroext i1 @is_ENOTSUP(i32 noundef %0) #4 !dbg !1357 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1360, metadata !DIExpression()), !dbg !1361
  %3 = load i32, ptr %2, align 4, !dbg !1362
  %4 = icmp eq i32 %3, 95, !dbg !1363
  br i1 %4, label %6, label %5, !dbg !1364

5:                                                ; preds = %1
  br label %6, !dbg !1364

6:                                                ; preds = %5, %1
  %7 = phi i1 [ true, %1 ], [ false, %5 ]
  ret i1 %7, !dbg !1365
}

declare i64 @safe_read(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #11

; Function Attrs: nounwind
declare i32 @ioctl(i32 noundef, i64 noundef, ...) #3

declare ptr @quotearg_style(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define internal void @write_pending(ptr noundef %0, ptr noundef %1) #4 !dbg !1366 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1369, metadata !DIExpression()), !dbg !1370
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1371, metadata !DIExpression()), !dbg !1372
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1373, metadata !DIExpression()), !dbg !1374
  %6 = load ptr, ptr %4, align 8, !dbg !1375
  %7 = load ptr, ptr %6, align 8, !dbg !1376
  %8 = load ptr, ptr %3, align 8, !dbg !1377
  %9 = ptrtoint ptr %7 to i64, !dbg !1378
  %10 = ptrtoint ptr %8 to i64, !dbg !1378
  %11 = sub i64 %9, %10, !dbg !1378
  store i64 %11, ptr %5, align 8, !dbg !1374
  %12 = load i64, ptr %5, align 8, !dbg !1379
  %13 = icmp slt i64 0, %12, !dbg !1381
  br i1 %13, label %14, label %24, !dbg !1382

14:                                               ; preds = %2
  %15 = load ptr, ptr %3, align 8, !dbg !1383
  %16 = load i64, ptr %5, align 8, !dbg !1386
  %17 = call i64 @full_write(i32 noundef 1, ptr noundef %15, i64 noundef %16), !dbg !1387
  %18 = load i64, ptr %5, align 8, !dbg !1388
  %19 = icmp ne i64 %17, %18, !dbg !1389
  br i1 %19, label %20, label %21, !dbg !1390

20:                                               ; preds = %14
  call void @write_error(), !dbg !1391
  br label %21, !dbg !1391

21:                                               ; preds = %20, %14
  %22 = load ptr, ptr %3, align 8, !dbg !1392
  %23 = load ptr, ptr %4, align 8, !dbg !1393
  store ptr %22, ptr %23, align 8, !dbg !1394
  br label %24, !dbg !1395

24:                                               ; preds = %21, %2
  ret void, !dbg !1396
}

; Function Attrs: noinline nounwind uwtable
define internal void @next_line_num() #4 !dbg !1397 {
  %1 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !1398, metadata !DIExpression()), !dbg !1399
  %2 = load ptr, ptr @line_num_end, align 8, !dbg !1400
  store ptr %2, ptr %1, align 8, !dbg !1399
  br label %3, !dbg !1401

3:                                                ; preds = %13, %0
  %4 = load ptr, ptr %1, align 8, !dbg !1402
  %5 = load i8, ptr %4, align 1, !dbg !1405
  %6 = add i8 %5, 1, !dbg !1405
  store i8 %6, ptr %4, align 1, !dbg !1405
  %7 = sext i8 %5 to i32, !dbg !1406
  %8 = icmp slt i32 %7, 57, !dbg !1407
  br i1 %8, label %9, label %10, !dbg !1408

9:                                                ; preds = %3
  br label %31, !dbg !1409

10:                                               ; preds = %3
  %11 = load ptr, ptr %1, align 8, !dbg !1410
  %12 = getelementptr inbounds i8, ptr %11, i32 -1, !dbg !1410
  store ptr %12, ptr %1, align 8, !dbg !1410
  store i8 48, ptr %11, align 1, !dbg !1411
  br label %13, !dbg !1412

13:                                               ; preds = %10
  %14 = load ptr, ptr %1, align 8, !dbg !1413
  %15 = load ptr, ptr @line_num_start, align 8, !dbg !1414
  %16 = icmp uge ptr %14, %15, !dbg !1415
  br i1 %16, label %3, label %17, !dbg !1412, !llvm.loop !1416

17:                                               ; preds = %13
  %18 = load ptr, ptr @line_num_start, align 8, !dbg !1418
  %19 = icmp ugt ptr %18, @line_buf, !dbg !1420
  br i1 %19, label %20, label %23, !dbg !1421

20:                                               ; preds = %17
  %21 = load ptr, ptr @line_num_start, align 8, !dbg !1422
  %22 = getelementptr inbounds i8, ptr %21, i32 -1, !dbg !1422
  store ptr %22, ptr @line_num_start, align 8, !dbg !1422
  store i8 49, ptr %22, align 1, !dbg !1423
  br label %24, !dbg !1424

23:                                               ; preds = %17
  store i8 62, ptr @line_buf, align 16, !dbg !1425
  br label %24

24:                                               ; preds = %23, %20
  %25 = load ptr, ptr @line_num_start, align 8, !dbg !1426
  %26 = load ptr, ptr @line_num_print, align 8, !dbg !1428
  %27 = icmp ult ptr %25, %26, !dbg !1429
  br i1 %27, label %28, label %31, !dbg !1430

28:                                               ; preds = %24
  %29 = load ptr, ptr @line_num_print, align 8, !dbg !1431
  %30 = getelementptr inbounds i8, ptr %29, i32 -1, !dbg !1431
  store ptr %30, ptr @line_num_print, align 8, !dbg !1431
  br label %31, !dbg !1432

31:                                               ; preds = %9, %28, %24
  ret void, !dbg !1433
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
!2 = !DIFile(filename: "inputs/otherInputs/catCU/catPUA.c", directory: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli", checksumkind: CSK_MD5, checksum: "a0bfa903eb81b4c2961cf9c12357cf7d")
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
!53 = !DIFile(filename: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/inputs/otherInputs/catCU/catPUA.c", directory: "/home/felicitas/Desktop/DOC/MM/MimicryMonitor/llvm/feli/scripts", checksumkind: CSK_MD5, checksum: "a0bfa903eb81b4c2961cf9c12357cf7d")
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
!184 = distinct !DIGlobalVariable(scope: null, file: !2, line: 722, type: !185, isLocal: true, isDefinition: true)
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
!625 = !DILocation(line: 711, column: 18, scope: !626)
!626 = distinct !DILexicalBlock(scope: !627, file: !2, line: 711, column: 18)
!627 = distinct !DILexicalBlock(scope: !609, file: !2, line: 710, column: 12)
!628 = !DILocation(line: 711, column: 28, scope: !626)
!629 = !DILocation(line: 711, column: 18, scope: !627)
!630 = !DILocation(line: 712, column: 29, scope: !626)
!631 = !DILocation(line: 712, column: 27, scope: !626)
!632 = !DILocation(line: 712, column: 17, scope: !626)
!633 = !DILocalVariable(name: "exhausting", scope: !627, file: !2, line: 713, type: !90)
!634 = !DILocation(line: 713, column: 22, scope: !627)
!635 = !DILocation(line: 713, column: 40, scope: !627)
!636 = !DILocation(line: 713, column: 37, scope: !627)
!637 = !DILocation(line: 713, column: 50, scope: !627)
!638 = !DILocation(line: 713, column: 53, scope: !627)
!639 = !DILocation(line: 713, column: 63, scope: !627)
!640 = !DILocation(line: 0, scope: !627)
!641 = !DILocation(line: 714, column: 22, scope: !642)
!642 = distinct !DILexicalBlock(scope: !627, file: !2, line: 714, column: 21)
!643 = !DILocation(line: 714, column: 21, scope: !627)
!644 = !DILocalVariable(name: "in_pos", scope: !645, file: !2, line: 716, type: !646)
!645 = distinct !DILexicalBlock(scope: !642, file: !2, line: 715, column: 16)
!646 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_t", file: !647, line: 64, baseType: !416)
!647 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "1e435c46987a169d9f9186f63a512303")
!648 = !DILocation(line: 716, column: 24, scope: !645)
!649 = !DILocation(line: 716, column: 40, scope: !645)
!650 = !DILocation(line: 716, column: 33, scope: !645)
!651 = !DILocation(line: 717, column: 27, scope: !652)
!652 = distinct !DILexicalBlock(scope: !645, file: !2, line: 717, column: 22)
!653 = !DILocation(line: 717, column: 24, scope: !652)
!654 = !DILocation(line: 717, column: 22, scope: !645)
!655 = !DILocation(line: 718, column: 37, scope: !652)
!656 = !DILocation(line: 718, column: 46, scope: !652)
!657 = !DILocation(line: 718, column: 44, scope: !652)
!658 = !DILocation(line: 718, column: 35, scope: !652)
!659 = !DILocation(line: 718, column: 24, scope: !652)
!660 = !DILocation(line: 719, column: 16, scope: !645)
!661 = !DILocation(line: 720, column: 20, scope: !662)
!662 = distinct !DILexicalBlock(scope: !627, file: !2, line: 720, column: 20)
!663 = !DILocation(line: 720, column: 20, scope: !627)
!664 = !DILocation(line: 722, column: 21, scope: !665)
!665 = distinct !DILexicalBlock(scope: !662, file: !2, line: 721, column: 16)
!666 = !DILocation(line: 723, column: 24, scope: !665)
!667 = !DILocation(line: 724, column: 21, scope: !665)
!668 = !DILocation(line: 726, column: 12, scope: !627)
!669 = !DILocalVariable(name: "inbuf", scope: !558, file: !2, line: 729, type: !51)
!670 = !DILocation(line: 729, column: 16, scope: !558)
!671 = !DILocation(line: 735, column: 17, scope: !672)
!672 = distinct !DILexicalBlock(scope: !558, file: !2, line: 735, column: 14)
!673 = !DILocation(line: 735, column: 24, scope: !672)
!674 = !DILocation(line: 735, column: 27, scope: !672)
!675 = !DILocation(line: 735, column: 37, scope: !672)
!676 = !DILocation(line: 735, column: 40, scope: !672)
!677 = !DILocation(line: 735, column: 57, scope: !672)
!678 = !DILocation(line: 735, column: 60, scope: !672)
!679 = !DILocation(line: 735, column: 70, scope: !672)
!680 = !DILocation(line: 735, column: 73, scope: !672)
!681 = !DILocation(line: 735, column: 14, scope: !558)
!682 = !DILocalVariable(name: "copy_cat_status", scope: !683, file: !2, line: 738, type: !49)
!683 = distinct !DILexicalBlock(scope: !672, file: !2, line: 737, column: 12)
!684 = !DILocation(line: 738, column: 18, scope: !683)
!685 = !DILocation(line: 738, column: 36, scope: !683)
!686 = !DILocation(line: 738, column: 46, scope: !683)
!687 = !DILocation(line: 738, column: 49, scope: !683)
!688 = !DILocation(line: 738, column: 78, scope: !683)
!689 = !DILocation(line: 740, column: 18, scope: !690)
!690 = distinct !DILexicalBlock(scope: !683, file: !2, line: 740, column: 18)
!691 = !DILocation(line: 740, column: 34, scope: !690)
!692 = !DILocation(line: 740, column: 18, scope: !683)
!693 = !DILocation(line: 742, column: 24, scope: !694)
!694 = distinct !DILexicalBlock(scope: !690, file: !2, line: 741, column: 16)
!695 = !DILocation(line: 743, column: 28, scope: !694)
!696 = !DILocation(line: 743, column: 26, scope: !694)
!697 = !DILocation(line: 743, column: 21, scope: !694)
!698 = !DILocation(line: 744, column: 16, scope: !694)
!699 = !DILocation(line: 747, column: 27, scope: !700)
!700 = distinct !DILexicalBlock(scope: !690, file: !2, line: 746, column: 16)
!701 = !DILocation(line: 747, column: 25, scope: !700)
!702 = !DILocation(line: 748, column: 39, scope: !700)
!703 = !DILocation(line: 748, column: 50, scope: !700)
!704 = !DILocation(line: 748, column: 26, scope: !700)
!705 = !DILocation(line: 748, column: 24, scope: !700)
!706 = !DILocation(line: 749, column: 36, scope: !700)
!707 = !DILocation(line: 749, column: 43, scope: !700)
!708 = !DILocation(line: 749, column: 24, scope: !700)
!709 = !DILocation(line: 749, column: 21, scope: !700)
!710 = !DILocation(line: 751, column: 12, scope: !683)
!711 = !DILocation(line: 755, column: 35, scope: !712)
!712 = distinct !DILexicalBlock(scope: !672, file: !2, line: 753, column: 12)
!713 = !DILocation(line: 755, column: 46, scope: !712)
!714 = !DILocation(line: 755, column: 53, scope: !712)
!715 = !DILocation(line: 755, column: 22, scope: !712)
!716 = !DILocation(line: 755, column: 20, scope: !712)
!717 = !DILocalVariable(name: "bufsize", scope: !712, file: !2, line: 778, type: !502)
!718 = !DILocation(line: 778, column: 20, scope: !712)
!719 = !DILocation(line: 779, column: 18, scope: !720)
!720 = distinct !DILexicalBlock(scope: !712, file: !2, line: 779, column: 18)
!721 = !DILocation(line: 779, column: 48, scope: !720)
!722 = !DILocation(line: 779, column: 51, scope: !720)
!723 = !DILocation(line: 779, column: 88, scope: !720)
!724 = !DILocation(line: 779, column: 91, scope: !720)
!725 = !DILocation(line: 779, column: 18, scope: !712)
!726 = !DILocation(line: 782, column: 16, scope: !720)
!727 = !DILocalVariable(name: "outbuf", scope: !712, file: !2, line: 783, type: !51)
!728 = !DILocation(line: 783, column: 20, scope: !712)
!729 = !DILocation(line: 783, column: 42, scope: !712)
!730 = !DILocation(line: 783, column: 53, scope: !712)
!731 = !DILocation(line: 783, column: 29, scope: !712)
!732 = !DILocation(line: 785, column: 25, scope: !712)
!733 = !DILocation(line: 785, column: 32, scope: !712)
!734 = !DILocation(line: 785, column: 40, scope: !712)
!735 = !DILocation(line: 785, column: 48, scope: !712)
!736 = !DILocation(line: 785, column: 57, scope: !712)
!737 = !DILocation(line: 785, column: 75, scope: !712)
!738 = !DILocation(line: 785, column: 86, scope: !712)
!739 = !DILocation(line: 785, column: 94, scope: !712)
!740 = !DILocation(line: 785, column: 111, scope: !712)
!741 = !DILocation(line: 785, column: 122, scope: !712)
!742 = !DILocation(line: 785, column: 20, scope: !712)
!743 = !DILocation(line: 785, column: 17, scope: !712)
!744 = !DILocation(line: 789, column: 25, scope: !712)
!745 = !DILocation(line: 789, column: 14, scope: !712)
!746 = !DILocation(line: 792, column: 21, scope: !558)
!747 = !DILocation(line: 792, column: 10, scope: !558)
!748 = !DILabel(scope: !558, name: "contin", file: !2, line: 794)
!749 = !DILocation(line: 794, column: 8, scope: !558)
!750 = !DILocation(line: 795, column: 15, scope: !751)
!751 = distinct !DILexicalBlock(scope: !558, file: !2, line: 795, column: 14)
!752 = !DILocation(line: 795, column: 29, scope: !751)
!753 = !DILocation(line: 795, column: 39, scope: !751)
!754 = !DILocation(line: 795, column: 32, scope: !751)
!755 = !DILocation(line: 795, column: 51, scope: !751)
!756 = !DILocation(line: 795, column: 14, scope: !558)
!757 = !DILocation(line: 797, column: 14, scope: !758)
!758 = distinct !DILexicalBlock(scope: !751, file: !2, line: 796, column: 12)
!759 = !DILocation(line: 798, column: 17, scope: !758)
!760 = !DILocation(line: 799, column: 12, scope: !758)
!761 = !DILocation(line: 800, column: 8, scope: !558)
!762 = !DILocation(line: 801, column: 13, scope: !46)
!763 = !DILocation(line: 801, column: 24, scope: !46)
!764 = !DILocation(line: 801, column: 22, scope: !46)
!765 = distinct !{!765, !555, !766, !355}
!766 = !DILocation(line: 801, column: 28, scope: !46)
!767 = !DILocation(line: 803, column: 10, scope: !768)
!768 = distinct !DILexicalBlock(scope: !46, file: !2, line: 803, column: 10)
!769 = !DILocation(line: 803, column: 10, scope: !46)
!770 = !DILocation(line: 805, column: 14, scope: !771)
!771 = distinct !DILexicalBlock(scope: !772, file: !2, line: 805, column: 14)
!772 = distinct !DILexicalBlock(scope: !768, file: !2, line: 804, column: 8)
!773 = !DILocation(line: 805, column: 50, scope: !771)
!774 = !DILocation(line: 805, column: 14, scope: !772)
!775 = !DILocation(line: 806, column: 12, scope: !771)
!776 = !DILocation(line: 807, column: 8, scope: !772)
!777 = !DILocation(line: 809, column: 10, scope: !778)
!778 = distinct !DILexicalBlock(scope: !46, file: !2, line: 809, column: 10)
!779 = !DILocation(line: 809, column: 26, scope: !778)
!780 = !DILocation(line: 809, column: 29, scope: !778)
!781 = !DILocation(line: 809, column: 50, scope: !778)
!782 = !DILocation(line: 809, column: 10, scope: !46)
!783 = !DILocation(line: 810, column: 8, scope: !778)
!784 = !DILocation(line: 812, column: 13, scope: !46)
!785 = !DILocation(line: 812, column: 6, scope: !46)
!786 = distinct !DISubprogram(name: "io_blksize", scope: !85, file: !85, line: 80, type: !787, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!787 = !DISubroutineType(types: !788)
!788 = !{!502, !789}
!789 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !790, size: 64)
!790 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !397)
!791 = !DILocalVariable(name: "st", arg: 1, scope: !786, file: !85, line: 80, type: !789)
!792 = !DILocation(line: 80, column: 32, scope: !786)
!793 = !DILocalVariable(name: "blocksize", scope: !786, file: !85, line: 83, type: !502)
!794 = !DILocation(line: 83, column: 9, scope: !786)
!795 = !DILocation(line: 83, column: 21, scope: !786)
!796 = !DILocation(line: 83, column: 38, scope: !786)
!797 = !DILocation(line: 83, column: 58, scope: !786)
!798 = !DILocation(line: 87, column: 54, scope: !786)
!799 = !DILocation(line: 87, column: 52, scope: !786)
!800 = !DILocation(line: 87, column: 33, scope: !786)
!801 = !DILocation(line: 87, column: 13, scope: !786)
!802 = !DILocation(line: 95, column: 7, scope: !803)
!803 = distinct !DILexicalBlock(scope: !786, file: !85, line: 95, column: 7)
!804 = !DILocation(line: 95, column: 29, scope: !803)
!805 = !DILocation(line: 95, column: 32, scope: !803)
!806 = !DILocation(line: 95, column: 45, scope: !803)
!807 = !DILocation(line: 95, column: 55, scope: !803)
!808 = !DILocation(line: 95, column: 42, scope: !803)
!809 = !DILocation(line: 95, column: 7, scope: !786)
!810 = !DILocalVariable(name: "leading_zeros", scope: !811, file: !85, line: 97, type: !49)
!811 = distinct !DILexicalBlock(scope: !803, file: !85, line: 96, column: 5)
!812 = !DILocation(line: 97, column: 11, scope: !811)
!813 = !DILocation(line: 97, column: 27, scope: !811)
!814 = !DILocalVariable(name: "__x", arg: 1, scope: !815, file: !816, line: 77, type: !819)
!815 = distinct !DISubprogram(name: "__clz64_inline", scope: !816, file: !816, line: 77, type: !817, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!816 = !DIFile(filename: "/usr/include/stdbit.h", directory: "", checksumkind: CSK_MD5, checksum: "412f44bf40a3f45759bb1a1dec873b38")
!817 = !DISubroutineType(types: !818)
!818 = !{!62, !819}
!819 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !820, line: 27, baseType: !821)
!820 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "256fcabbefa27ca8cf5e6d37525e6e16")
!821 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !402, line: 45, baseType: !93)
!822 = !DILocation(line: 77, column: 26, scope: !815, inlinedAt: !823)
!823 = distinct !DILocation(line: 97, column: 27, scope: !811)
!824 = !DILocation(line: 79, column: 10, scope: !815, inlinedAt: !823)
!825 = !DILocation(line: 79, column: 14, scope: !815, inlinedAt: !823)
!826 = !DILocation(line: 79, column: 59, scope: !815, inlinedAt: !823)
!827 = !DILocation(line: 79, column: 42, scope: !815, inlinedAt: !823)
!828 = !DILocalVariable(name: "power", scope: !829, file: !85, line: 100, type: !831)
!829 = distinct !DILexicalBlock(scope: !830, file: !85, line: 99, column: 9)
!830 = distinct !DILexicalBlock(scope: !811, file: !85, line: 98, column: 11)
!831 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!832 = !DILocation(line: 100, column: 30, scope: !829)
!833 = !DILocation(line: 100, column: 62, scope: !829)
!834 = !DILocation(line: 100, column: 60, scope: !829)
!835 = !DILocation(line: 100, column: 43, scope: !829)
!836 = !DILocation(line: 101, column: 15, scope: !837)
!837 = distinct !DILexicalBlock(scope: !829, file: !85, line: 101, column: 15)
!838 = !DILocation(line: 101, column: 21, scope: !837)
!839 = !DILocation(line: 101, column: 15, scope: !829)
!840 = !DILocation(line: 102, column: 25, scope: !837)
!841 = !DILocation(line: 102, column: 23, scope: !837)
!842 = !DILocation(line: 102, column: 13, scope: !837)
!843 = !DILocation(line: 104, column: 5, scope: !811)
!844 = !DILocation(line: 108, column: 10, scope: !786)
!845 = !DILocation(line: 108, column: 3, scope: !786)
!846 = distinct !DISubprogram(name: "copy_cat", scope: !2, file: !2, line: 501, type: !847, scopeLine: 502, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!847 = !DISubroutineType(types: !848)
!848 = !{!49}
!849 = !DILocalVariable(name: "copy_max", scope: !846, file: !2, line: 506, type: !850)
!850 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !647, line: 78, baseType: !851)
!851 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ssize_t", file: !402, line: 194, baseType: !417)
!852 = !DILocation(line: 506, column: 14, scope: !846)
!853 = !DILocalVariable(name: "some_copied", scope: !854, file: !2, line: 514, type: !90)
!854 = distinct !DILexicalBlock(scope: !846, file: !2, line: 514, column: 6)
!855 = !DILocation(line: 514, column: 16, scope: !854)
!856 = !DILocation(line: 514, column: 11, scope: !854)
!857 = !DILocation(line: 515, column: 33, scope: !858)
!858 = distinct !DILexicalBlock(scope: !854, file: !2, line: 514, column: 6)
!859 = !DILocation(line: 515, column: 78, scope: !858)
!860 = !DILocation(line: 515, column: 16, scope: !858)
!861 = !DILocation(line: 515, column: 8, scope: !858)
!862 = !DILocation(line: 518, column: 19, scope: !863)
!863 = distinct !DILexicalBlock(scope: !858, file: !2, line: 516, column: 10)
!864 = !DILocation(line: 518, column: 12, scope: !863)
!865 = !DILocation(line: 521, column: 16, scope: !866)
!866 = distinct !DILexicalBlock(scope: !863, file: !2, line: 521, column: 16)
!867 = !DILocation(line: 521, column: 22, scope: !866)
!868 = !DILocation(line: 521, column: 32, scope: !866)
!869 = !DILocation(line: 521, column: 47, scope: !866)
!870 = !DILocation(line: 521, column: 35, scope: !866)
!871 = !DILocation(line: 521, column: 54, scope: !866)
!872 = !DILocation(line: 521, column: 57, scope: !866)
!873 = !DILocation(line: 521, column: 63, scope: !866)
!874 = !DILocation(line: 521, column: 73, scope: !866)
!875 = !DILocation(line: 521, column: 76, scope: !866)
!876 = !DILocation(line: 521, column: 82, scope: !866)
!877 = !DILocation(line: 521, column: 91, scope: !866)
!878 = !DILocation(line: 521, column: 94, scope: !866)
!879 = !DILocation(line: 521, column: 100, scope: !866)
!880 = !DILocation(line: 521, column: 109, scope: !866)
!881 = !DILocation(line: 521, column: 112, scope: !866)
!882 = !DILocation(line: 521, column: 118, scope: !866)
!883 = !DILocation(line: 521, column: 129, scope: !866)
!884 = !DILocation(line: 521, column: 132, scope: !866)
!885 = !DILocation(line: 521, column: 138, scope: !866)
!886 = !DILocation(line: 521, column: 16, scope: !863)
!887 = !DILocation(line: 522, column: 14, scope: !866)
!888 = !DILocation(line: 523, column: 12, scope: !863)
!889 = !DILocation(line: 524, column: 12, scope: !863)
!890 = !DILocation(line: 525, column: 10, scope: !863)
!891 = !DILocation(line: 514, column: 51, scope: !858)
!892 = !DILocation(line: 514, column: 6, scope: !858)
!893 = distinct !{!893, !894, !895}
!894 = !DILocation(line: 514, column: 6, scope: !854)
!895 = !DILocation(line: 525, column: 10, scope: !854)
!896 = !DILocation(line: 526, column: 4, scope: !846)
!897 = distinct !DISubprogram(name: "simple_cat", scope: !2, file: !2, line: 156, type: !898, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!898 = !DISubroutineType(types: !899)
!899 = !{!90, !51, !502}
!900 = !DILocalVariable(name: "buf", arg: 1, scope: !897, file: !2, line: 156, type: !51)
!901 = !DILocation(line: 156, column: 22, scope: !897)
!902 = !DILocalVariable(name: "bufsize", arg: 2, scope: !897, file: !2, line: 156, type: !502)
!903 = !DILocation(line: 156, column: 33, scope: !897)
!904 = !DILocation(line: 160, column: 6, scope: !897)
!905 = !DILocalVariable(name: "n_read", scope: !906, file: !2, line: 164, type: !504)
!906 = distinct !DILexicalBlock(scope: !897, file: !2, line: 161, column: 8)
!907 = !DILocation(line: 164, column: 20, scope: !906)
!908 = !DILocation(line: 164, column: 40, scope: !906)
!909 = !DILocation(line: 164, column: 52, scope: !906)
!910 = !DILocation(line: 164, column: 57, scope: !906)
!911 = !DILocation(line: 164, column: 29, scope: !906)
!912 = !DILocation(line: 165, column: 14, scope: !913)
!913 = distinct !DILexicalBlock(scope: !906, file: !2, line: 165, column: 14)
!914 = !DILocation(line: 165, column: 21, scope: !913)
!915 = !DILocation(line: 165, column: 14, scope: !906)
!916 = !DILocation(line: 167, column: 14, scope: !917)
!917 = distinct !DILexicalBlock(scope: !913, file: !2, line: 166, column: 12)
!918 = !DILocation(line: 168, column: 14, scope: !917)
!919 = !DILocation(line: 173, column: 14, scope: !920)
!920 = distinct !DILexicalBlock(scope: !906, file: !2, line: 173, column: 14)
!921 = !DILocation(line: 173, column: 21, scope: !920)
!922 = !DILocation(line: 173, column: 14, scope: !906)
!923 = !DILocation(line: 174, column: 12, scope: !920)
!924 = !DILocation(line: 178, column: 41, scope: !925)
!925 = distinct !DILexicalBlock(scope: !906, file: !2, line: 178, column: 14)
!926 = !DILocation(line: 178, column: 46, scope: !925)
!927 = !DILocation(line: 178, column: 14, scope: !925)
!928 = !DILocation(line: 178, column: 57, scope: !925)
!929 = !DILocation(line: 178, column: 54, scope: !925)
!930 = !DILocation(line: 178, column: 14, scope: !906)
!931 = !DILocation(line: 179, column: 12, scope: !925)
!932 = distinct !{!932, !904, !933}
!933 = !DILocation(line: 180, column: 8, scope: !897)
!934 = !DILocation(line: 181, column: 4, scope: !897)
!935 = distinct !DISubprogram(name: "cat", scope: !2, file: !2, line: 212, type: !936, scopeLine: 215, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!936 = !DISubroutineType(types: !937)
!937 = !{!90, !51, !502, !51, !502, !90, !90, !90, !90, !90, !90}
!938 = !DILocalVariable(name: "inbuf", arg: 1, scope: !935, file: !2, line: 212, type: !51)
!939 = !DILocation(line: 212, column: 15, scope: !935)
!940 = !DILocalVariable(name: "insize", arg: 2, scope: !935, file: !2, line: 212, type: !502)
!941 = !DILocation(line: 212, column: 28, scope: !935)
!942 = !DILocalVariable(name: "outbuf", arg: 3, scope: !935, file: !2, line: 212, type: !51)
!943 = !DILocation(line: 212, column: 42, scope: !935)
!944 = !DILocalVariable(name: "outsize", arg: 4, scope: !935, file: !2, line: 212, type: !502)
!945 = !DILocation(line: 212, column: 56, scope: !935)
!946 = !DILocalVariable(name: "show_nonprinting", arg: 5, scope: !935, file: !2, line: 213, type: !90)
!947 = !DILocation(line: 213, column: 14, scope: !935)
!948 = !DILocalVariable(name: "show_tabs", arg: 6, scope: !935, file: !2, line: 213, type: !90)
!949 = !DILocation(line: 213, column: 37, scope: !935)
!950 = !DILocalVariable(name: "number", arg: 7, scope: !935, file: !2, line: 213, type: !90)
!951 = !DILocation(line: 213, column: 53, scope: !935)
!952 = !DILocalVariable(name: "number_nonblank", arg: 8, scope: !935, file: !2, line: 213, type: !90)
!953 = !DILocation(line: 213, column: 66, scope: !935)
!954 = !DILocalVariable(name: "show_ends", arg: 9, scope: !935, file: !2, line: 214, type: !90)
!955 = !DILocation(line: 214, column: 14, scope: !935)
!956 = !DILocalVariable(name: "squeeze_blank", arg: 10, scope: !935, file: !2, line: 214, type: !90)
!957 = !DILocation(line: 214, column: 30, scope: !935)
!958 = !DILocalVariable(name: "ch", scope: !935, file: !2, line: 217, type: !959)
!959 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!960 = !DILocation(line: 217, column: 20, scope: !935)
!961 = !DILocalVariable(name: "newlines", scope: !935, file: !2, line: 224, type: !49)
!962 = !DILocation(line: 224, column: 10, scope: !935)
!963 = !DILocation(line: 224, column: 21, scope: !935)
!964 = !DILocalVariable(name: "use_fionread", scope: !935, file: !2, line: 229, type: !90)
!965 = !DILocation(line: 229, column: 11, scope: !935)
!966 = !DILocalVariable(name: "eob", scope: !935, file: !2, line: 237, type: !51)
!967 = !DILocation(line: 237, column: 12, scope: !935)
!968 = !DILocation(line: 237, column: 18, scope: !935)
!969 = !DILocalVariable(name: "bpin", scope: !935, file: !2, line: 240, type: !51)
!970 = !DILocation(line: 240, column: 12, scope: !935)
!971 = !DILocation(line: 240, column: 19, scope: !935)
!972 = !DILocation(line: 240, column: 23, scope: !935)
!973 = !DILocalVariable(name: "bpout", scope: !935, file: !2, line: 243, type: !51)
!974 = !DILocation(line: 243, column: 12, scope: !935)
!975 = !DILocation(line: 243, column: 20, scope: !935)
!976 = !DILocation(line: 245, column: 6, scope: !935)
!977 = !DILocation(line: 247, column: 10, scope: !978)
!978 = distinct !DILexicalBlock(scope: !935, file: !2, line: 246, column: 8)
!979 = !DILocation(line: 251, column: 18, scope: !980)
!980 = distinct !DILexicalBlock(scope: !981, file: !2, line: 251, column: 18)
!981 = distinct !DILexicalBlock(scope: !978, file: !2, line: 248, column: 12)
!982 = !DILocation(line: 251, column: 27, scope: !980)
!983 = !DILocation(line: 251, column: 25, scope: !980)
!984 = !DILocation(line: 251, column: 38, scope: !980)
!985 = !DILocation(line: 251, column: 35, scope: !980)
!986 = !DILocation(line: 251, column: 18, scope: !981)
!987 = !DILocalVariable(name: "wp", scope: !988, file: !2, line: 253, type: !51)
!988 = distinct !DILexicalBlock(scope: !980, file: !2, line: 252, column: 16)
!989 = !DILocation(line: 253, column: 24, scope: !988)
!990 = !DILocation(line: 253, column: 29, scope: !988)
!991 = !DILocalVariable(name: "remaining_bytes", scope: !988, file: !2, line: 254, type: !502)
!992 = !DILocation(line: 254, column: 24, scope: !988)
!993 = !DILocation(line: 255, column: 18, scope: !988)
!994 = !DILocation(line: 257, column: 53, scope: !995)
!995 = distinct !DILexicalBlock(scope: !996, file: !2, line: 257, column: 26)
!996 = distinct !DILexicalBlock(scope: !988, file: !2, line: 256, column: 20)
!997 = !DILocation(line: 257, column: 57, scope: !995)
!998 = !DILocation(line: 257, column: 26, scope: !995)
!999 = !DILocation(line: 257, column: 69, scope: !995)
!1000 = !DILocation(line: 257, column: 66, scope: !995)
!1001 = !DILocation(line: 257, column: 26, scope: !996)
!1002 = !DILocation(line: 258, column: 24, scope: !995)
!1003 = !DILocation(line: 259, column: 28, scope: !996)
!1004 = !DILocation(line: 259, column: 25, scope: !996)
!1005 = !DILocation(line: 260, column: 40, scope: !996)
!1006 = !DILocation(line: 260, column: 48, scope: !996)
!1007 = !DILocation(line: 260, column: 46, scope: !996)
!1008 = !DILocation(line: 260, column: 38, scope: !996)
!1009 = !DILocation(line: 261, column: 20, scope: !996)
!1010 = !DILocation(line: 262, column: 25, scope: !988)
!1011 = !DILocation(line: 262, column: 36, scope: !988)
!1012 = !DILocation(line: 262, column: 33, scope: !988)
!1013 = distinct !{!1013, !993, !1014, !355}
!1014 = !DILocation(line: 262, column: 51, scope: !988)
!1015 = !DILocation(line: 267, column: 27, scope: !988)
!1016 = !DILocation(line: 267, column: 35, scope: !988)
!1017 = !DILocation(line: 267, column: 39, scope: !988)
!1018 = !DILocation(line: 267, column: 18, scope: !988)
!1019 = !DILocation(line: 268, column: 26, scope: !988)
!1020 = !DILocation(line: 268, column: 35, scope: !988)
!1021 = !DILocation(line: 268, column: 33, scope: !988)
!1022 = !DILocation(line: 268, column: 24, scope: !988)
!1023 = !DILocation(line: 269, column: 16, scope: !988)
!1024 = !DILocation(line: 273, column: 18, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !981, file: !2, line: 273, column: 18)
!1026 = !DILocation(line: 273, column: 25, scope: !1025)
!1027 = !DILocation(line: 273, column: 23, scope: !1025)
!1028 = !DILocation(line: 273, column: 18, scope: !981)
!1029 = !DILocalVariable(name: "input_pending", scope: !1030, file: !2, line: 275, type: !90)
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
!1077 = !DILocalVariable(name: "n_read", scope: !1030, file: !2, line: 310, type: !504)
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
!1141 = !DILocation(line: 363, column: 42, scope: !1140)
!1142 = !DILocation(line: 363, column: 49, scope: !1140)
!1143 = !DILocation(line: 363, column: 34, scope: !1140)
!1144 = !DILocation(line: 363, column: 32, scope: !1140)
!1145 = !DILocation(line: 364, column: 24, scope: !1140)
!1146 = !DILocation(line: 365, column: 20, scope: !1120)
!1147 = !DILocation(line: 368, column: 22, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1115, file: !2, line: 368, column: 22)
!1149 = !DILocation(line: 368, column: 22, scope: !1115)
!1150 = !DILocation(line: 370, column: 26, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1152, file: !2, line: 370, column: 26)
!1152 = distinct !DILexicalBlock(scope: !1148, file: !2, line: 369, column: 20)
!1153 = !DILocation(line: 370, column: 26, scope: !1152)
!1154 = !DILocation(line: 372, column: 32, scope: !1155)
!1155 = distinct !DILexicalBlock(scope: !1151, file: !2, line: 371, column: 24)
!1156 = !DILocation(line: 372, column: 35, scope: !1155)
!1157 = !DILocation(line: 373, column: 32, scope: !1155)
!1158 = !DILocation(line: 373, column: 35, scope: !1155)
!1159 = !DILocation(line: 374, column: 37, scope: !1155)
!1160 = !DILocation(line: 375, column: 24, scope: !1155)
!1161 = !DILocation(line: 376, column: 28, scope: !1152)
!1162 = !DILocation(line: 376, column: 31, scope: !1152)
!1163 = !DILocation(line: 377, column: 20, scope: !1152)
!1164 = !DILocation(line: 381, column: 24, scope: !1115)
!1165 = !DILocation(line: 381, column: 27, scope: !1115)
!1166 = !DILocation(line: 383, column: 24, scope: !981)
!1167 = !DILocation(line: 383, column: 19, scope: !981)
!1168 = !DILocation(line: 383, column: 17, scope: !981)
!1169 = !DILocation(line: 384, column: 12, scope: !981)
!1170 = !DILocation(line: 385, column: 17, scope: !978)
!1171 = !DILocation(line: 385, column: 20, scope: !978)
!1172 = distinct !{!1172, !977, !1173, !355}
!1173 = !DILocation(line: 385, column: 27, scope: !978)
!1174 = !DILocation(line: 389, column: 14, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !978, file: !2, line: 389, column: 14)
!1176 = !DILocation(line: 389, column: 14, scope: !978)
!1177 = !DILocation(line: 391, column: 20, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1175, file: !2, line: 390, column: 12)
!1179 = !DILocation(line: 391, column: 23, scope: !1178)
!1180 = !DILocation(line: 392, column: 25, scope: !1178)
!1181 = !DILocation(line: 393, column: 12, scope: !1178)
!1182 = !DILocation(line: 397, column: 14, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !978, file: !2, line: 397, column: 14)
!1184 = !DILocation(line: 397, column: 23, scope: !1183)
!1185 = !DILocation(line: 397, column: 28, scope: !1183)
!1186 = !DILocation(line: 397, column: 31, scope: !1183)
!1187 = !DILocation(line: 397, column: 14, scope: !978)
!1188 = !DILocation(line: 399, column: 14, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1183, file: !2, line: 398, column: 12)
!1190 = !DILocation(line: 400, column: 30, scope: !1189)
!1191 = !DILocation(line: 400, column: 37, scope: !1189)
!1192 = !DILocation(line: 400, column: 22, scope: !1189)
!1193 = !DILocation(line: 400, column: 20, scope: !1189)
!1194 = !DILocation(line: 401, column: 12, scope: !1189)
!1195 = !DILocation(line: 409, column: 14, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !978, file: !2, line: 409, column: 14)
!1197 = !DILocation(line: 409, column: 14, scope: !978)
!1198 = !DILocation(line: 411, column: 14, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1196, file: !2, line: 410, column: 12)
!1200 = !DILocation(line: 413, column: 22, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1202, file: !2, line: 413, column: 22)
!1202 = distinct !DILexicalBlock(scope: !1199, file: !2, line: 412, column: 16)
!1203 = !DILocation(line: 413, column: 25, scope: !1201)
!1204 = !DILocation(line: 413, column: 22, scope: !1202)
!1205 = !DILocation(line: 415, column: 26, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1207, file: !2, line: 415, column: 26)
!1207 = distinct !DILexicalBlock(scope: !1201, file: !2, line: 414, column: 20)
!1208 = !DILocation(line: 415, column: 29, scope: !1206)
!1209 = !DILocation(line: 415, column: 26, scope: !1207)
!1210 = !DILocation(line: 416, column: 35, scope: !1206)
!1211 = !DILocation(line: 416, column: 30, scope: !1206)
!1212 = !DILocation(line: 416, column: 33, scope: !1206)
!1213 = !DILocation(line: 416, column: 24, scope: !1206)
!1214 = !DILocation(line: 417, column: 31, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1206, file: !2, line: 417, column: 31)
!1216 = !DILocation(line: 417, column: 34, scope: !1215)
!1217 = !DILocation(line: 417, column: 31, scope: !1206)
!1218 = !DILocation(line: 419, column: 32, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1215, file: !2, line: 418, column: 24)
!1220 = !DILocation(line: 419, column: 35, scope: !1219)
!1221 = !DILocation(line: 420, column: 32, scope: !1219)
!1222 = !DILocation(line: 420, column: 35, scope: !1219)
!1223 = !DILocation(line: 421, column: 24, scope: !1219)
!1224 = !DILocation(line: 424, column: 32, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1215, file: !2, line: 423, column: 24)
!1226 = !DILocation(line: 424, column: 35, scope: !1225)
!1227 = !DILocation(line: 425, column: 32, scope: !1225)
!1228 = !DILocation(line: 425, column: 35, scope: !1225)
!1229 = !DILocation(line: 426, column: 30, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1225, file: !2, line: 426, column: 30)
!1231 = !DILocation(line: 426, column: 33, scope: !1230)
!1232 = !DILocation(line: 426, column: 30, scope: !1225)
!1233 = !DILocation(line: 428, column: 34, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1235, file: !2, line: 428, column: 34)
!1235 = distinct !DILexicalBlock(scope: !1230, file: !2, line: 427, column: 28)
!1236 = !DILocation(line: 428, column: 37, scope: !1234)
!1237 = !DILocation(line: 428, column: 34, scope: !1235)
!1238 = !DILocation(line: 429, column: 43, scope: !1234)
!1239 = !DILocation(line: 429, column: 46, scope: !1234)
!1240 = !DILocation(line: 429, column: 38, scope: !1234)
!1241 = !DILocation(line: 429, column: 41, scope: !1234)
!1242 = !DILocation(line: 429, column: 32, scope: !1234)
!1243 = !DILocation(line: 432, column: 40, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1234, file: !2, line: 431, column: 32)
!1245 = !DILocation(line: 432, column: 43, scope: !1244)
!1246 = !DILocation(line: 433, column: 40, scope: !1244)
!1247 = !DILocation(line: 433, column: 43, scope: !1244)
!1248 = !DILocation(line: 435, column: 28, scope: !1235)
!1249 = !DILocation(line: 438, column: 36, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1230, file: !2, line: 437, column: 28)
!1251 = !DILocation(line: 438, column: 39, scope: !1250)
!1252 = !DILocation(line: 439, column: 41, scope: !1250)
!1253 = !DILocation(line: 439, column: 44, scope: !1250)
!1254 = !DILocation(line: 439, column: 50, scope: !1250)
!1255 = !DILocation(line: 439, column: 36, scope: !1250)
!1256 = !DILocation(line: 439, column: 39, scope: !1250)
!1257 = !DILocation(line: 442, column: 20, scope: !1207)
!1258 = !DILocation(line: 443, column: 27, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1201, file: !2, line: 443, column: 27)
!1260 = !DILocation(line: 443, column: 30, scope: !1259)
!1261 = !DILocation(line: 443, column: 38, scope: !1259)
!1262 = !DILocation(line: 443, column: 42, scope: !1259)
!1263 = !DILocation(line: 443, column: 27, scope: !1201)
!1264 = !DILocation(line: 444, column: 26, scope: !1259)
!1265 = !DILocation(line: 444, column: 29, scope: !1259)
!1266 = !DILocation(line: 444, column: 20, scope: !1259)
!1267 = !DILocation(line: 445, column: 27, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1259, file: !2, line: 445, column: 27)
!1269 = !DILocation(line: 445, column: 30, scope: !1268)
!1270 = !DILocation(line: 445, column: 27, scope: !1259)
!1271 = !DILocation(line: 447, column: 31, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1268, file: !2, line: 446, column: 20)
!1273 = !DILocation(line: 448, column: 22, scope: !1272)
!1274 = !DILocation(line: 452, column: 28, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1268, file: !2, line: 451, column: 20)
!1276 = !DILocation(line: 452, column: 31, scope: !1275)
!1277 = !DILocation(line: 453, column: 33, scope: !1275)
!1278 = !DILocation(line: 453, column: 36, scope: !1275)
!1279 = !DILocation(line: 453, column: 28, scope: !1275)
!1280 = !DILocation(line: 453, column: 31, scope: !1275)
!1281 = !DILocation(line: 456, column: 28, scope: !1202)
!1282 = !DILocation(line: 456, column: 23, scope: !1202)
!1283 = !DILocation(line: 456, column: 21, scope: !1202)
!1284 = distinct !{!1284, !1198, !1285}
!1285 = !DILocation(line: 457, column: 16, scope: !1199)
!1286 = !DILocation(line: 458, column: 12, scope: !1199)
!1287 = !DILocation(line: 462, column: 14, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1196, file: !2, line: 460, column: 12)
!1289 = !DILocation(line: 464, column: 22, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1291, file: !2, line: 464, column: 22)
!1291 = distinct !DILexicalBlock(scope: !1288, file: !2, line: 463, column: 16)
!1292 = !DILocation(line: 464, column: 25, scope: !1290)
!1293 = !DILocation(line: 464, column: 33, scope: !1290)
!1294 = !DILocation(line: 464, column: 36, scope: !1290)
!1295 = !DILocation(line: 464, column: 22, scope: !1291)
!1296 = !DILocation(line: 466, column: 28, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1290, file: !2, line: 465, column: 20)
!1298 = !DILocation(line: 466, column: 31, scope: !1297)
!1299 = !DILocation(line: 467, column: 33, scope: !1297)
!1300 = !DILocation(line: 467, column: 36, scope: !1297)
!1301 = !DILocation(line: 467, column: 28, scope: !1297)
!1302 = !DILocation(line: 467, column: 31, scope: !1297)
!1303 = !DILocation(line: 468, column: 20, scope: !1297)
!1304 = !DILocation(line: 469, column: 27, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1290, file: !2, line: 469, column: 27)
!1306 = !DILocation(line: 469, column: 30, scope: !1305)
!1307 = !DILocation(line: 469, column: 27, scope: !1290)
!1308 = !DILocation(line: 471, column: 26, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1310, file: !2, line: 471, column: 26)
!1310 = distinct !DILexicalBlock(scope: !1305, file: !2, line: 470, column: 20)
!1311 = !DILocation(line: 471, column: 29, scope: !1309)
!1312 = !DILocation(line: 471, column: 37, scope: !1309)
!1313 = !DILocation(line: 471, column: 41, scope: !1309)
!1314 = !DILocation(line: 471, column: 40, scope: !1309)
!1315 = !DILocation(line: 471, column: 46, scope: !1309)
!1316 = !DILocation(line: 471, column: 54, scope: !1309)
!1317 = !DILocation(line: 471, column: 57, scope: !1309)
!1318 = !DILocation(line: 471, column: 26, scope: !1310)
!1319 = !DILocation(line: 473, column: 30, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1321, file: !2, line: 473, column: 30)
!1321 = distinct !DILexicalBlock(scope: !1309, file: !2, line: 472, column: 24)
!1322 = !DILocation(line: 473, column: 38, scope: !1320)
!1323 = !DILocation(line: 473, column: 35, scope: !1320)
!1324 = !DILocation(line: 473, column: 30, scope: !1321)
!1325 = !DILocation(line: 474, column: 39, scope: !1320)
!1326 = !DILocation(line: 474, column: 28, scope: !1320)
!1327 = !DILocation(line: 477, column: 36, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1320, file: !2, line: 476, column: 28)
!1329 = !DILocation(line: 477, column: 39, scope: !1328)
!1330 = !DILocation(line: 478, column: 36, scope: !1328)
!1331 = !DILocation(line: 478, column: 39, scope: !1328)
!1332 = !DILocation(line: 480, column: 24, scope: !1321)
!1333 = !DILocation(line: 482, column: 35, scope: !1309)
!1334 = !DILocation(line: 482, column: 30, scope: !1309)
!1335 = !DILocation(line: 482, column: 33, scope: !1309)
!1336 = !DILocation(line: 483, column: 20, scope: !1310)
!1337 = !DILocation(line: 486, column: 31, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1305, file: !2, line: 485, column: 20)
!1339 = !DILocation(line: 487, column: 22, scope: !1338)
!1340 = !DILocation(line: 490, column: 28, scope: !1291)
!1341 = !DILocation(line: 490, column: 23, scope: !1291)
!1342 = !DILocation(line: 490, column: 21, scope: !1291)
!1343 = distinct !{!1343, !1287, !1344}
!1344 = !DILocation(line: 491, column: 16, scope: !1288)
!1345 = distinct !{!1345, !976, !1346}
!1346 = !DILocation(line: 493, column: 8, scope: !935)
!1347 = !DILocation(line: 494, column: 4, scope: !935)
!1348 = distinct !DISubprogram(name: "write_error", scope: !56, file: !56, line: 741, type: !322, scopeLine: 742, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!1349 = !DILocalVariable(name: "saved_errno", scope: !1348, file: !56, line: 743, type: !49)
!1350 = !DILocation(line: 743, column: 7, scope: !1348)
!1351 = !DILocation(line: 743, column: 21, scope: !1348)
!1352 = !DILocation(line: 744, column: 3, scope: !1348)
!1353 = !DILocation(line: 745, column: 11, scope: !1348)
!1354 = !DILocation(line: 745, column: 3, scope: !1348)
!1355 = !DILocation(line: 746, column: 3, scope: !1348)
!1356 = !DILocation(line: 747, column: 3, scope: !1348)
!1357 = distinct !DISubprogram(name: "is_ENOTSUP", scope: !56, file: !56, line: 774, type: !1358, scopeLine: 775, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!90, !49}
!1360 = !DILocalVariable(name: "err", arg: 1, scope: !1357, file: !56, line: 774, type: !49)
!1361 = !DILocation(line: 774, column: 17, scope: !1357)
!1362 = !DILocation(line: 776, column: 10, scope: !1357)
!1363 = !DILocation(line: 776, column: 14, scope: !1357)
!1364 = !DILocation(line: 776, column: 28, scope: !1357)
!1365 = !DILocation(line: 776, column: 3, scope: !1357)
!1366 = distinct !DISubprogram(name: "write_pending", scope: !2, file: !2, line: 188, type: !1367, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!1367 = !DISubroutineType(types: !1368)
!1368 = !{null, !51, !50}
!1369 = !DILocalVariable(name: "outbuf", arg: 1, scope: !1366, file: !2, line: 188, type: !51)
!1370 = !DILocation(line: 188, column: 25, scope: !1366)
!1371 = !DILocalVariable(name: "bpout", arg: 2, scope: !1366, file: !2, line: 188, type: !50)
!1372 = !DILocation(line: 188, column: 40, scope: !1366)
!1373 = !DILocalVariable(name: "n_write", scope: !1366, file: !2, line: 190, type: !502)
!1374 = !DILocation(line: 190, column: 12, scope: !1366)
!1375 = !DILocation(line: 190, column: 23, scope: !1366)
!1376 = !DILocation(line: 190, column: 22, scope: !1366)
!1377 = !DILocation(line: 190, column: 31, scope: !1366)
!1378 = !DILocation(line: 190, column: 29, scope: !1366)
!1379 = !DILocation(line: 191, column: 14, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1366, file: !2, line: 191, column: 10)
!1381 = !DILocation(line: 191, column: 12, scope: !1380)
!1382 = !DILocation(line: 191, column: 10, scope: !1366)
!1383 = !DILocation(line: 193, column: 41, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1385, file: !2, line: 193, column: 14)
!1385 = distinct !DILexicalBlock(scope: !1380, file: !2, line: 192, column: 8)
!1386 = !DILocation(line: 193, column: 49, scope: !1384)
!1387 = !DILocation(line: 193, column: 14, scope: !1384)
!1388 = !DILocation(line: 193, column: 61, scope: !1384)
!1389 = !DILocation(line: 193, column: 58, scope: !1384)
!1390 = !DILocation(line: 193, column: 14, scope: !1385)
!1391 = !DILocation(line: 194, column: 12, scope: !1384)
!1392 = !DILocation(line: 195, column: 19, scope: !1385)
!1393 = !DILocation(line: 195, column: 11, scope: !1385)
!1394 = !DILocation(line: 195, column: 17, scope: !1385)
!1395 = !DILocation(line: 196, column: 8, scope: !1385)
!1396 = !DILocation(line: 197, column: 4, scope: !1366)
!1397 = distinct !DISubprogram(name: "next_line_num", scope: !2, file: !2, line: 132, type: !322, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !273)
!1398 = !DILocalVariable(name: "endp", scope: !1397, file: !2, line: 134, type: !51)
!1399 = !DILocation(line: 134, column: 12, scope: !1397)
!1400 = !DILocation(line: 134, column: 19, scope: !1397)
!1401 = !DILocation(line: 135, column: 6, scope: !1397)
!1402 = !DILocation(line: 137, column: 16, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1404, file: !2, line: 137, column: 14)
!1404 = distinct !DILexicalBlock(scope: !1397, file: !2, line: 136, column: 8)
!1405 = !DILocation(line: 137, column: 21, scope: !1403)
!1406 = !DILocation(line: 137, column: 14, scope: !1403)
!1407 = !DILocation(line: 137, column: 24, scope: !1403)
!1408 = !DILocation(line: 137, column: 14, scope: !1404)
!1409 = !DILocation(line: 138, column: 12, scope: !1403)
!1410 = !DILocation(line: 139, column: 15, scope: !1404)
!1411 = !DILocation(line: 139, column: 18, scope: !1404)
!1412 = !DILocation(line: 140, column: 8, scope: !1404)
!1413 = !DILocation(line: 141, column: 13, scope: !1397)
!1414 = !DILocation(line: 141, column: 21, scope: !1397)
!1415 = !DILocation(line: 141, column: 18, scope: !1397)
!1416 = distinct !{!1416, !1401, !1417, !355}
!1417 = !DILocation(line: 141, column: 35, scope: !1397)
!1418 = !DILocation(line: 143, column: 10, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1397, file: !2, line: 143, column: 10)
!1420 = !DILocation(line: 143, column: 25, scope: !1419)
!1421 = !DILocation(line: 143, column: 10, scope: !1397)
!1422 = !DILocation(line: 144, column: 9, scope: !1419)
!1423 = !DILocation(line: 144, column: 26, scope: !1419)
!1424 = !DILocation(line: 144, column: 8, scope: !1419)
!1425 = !DILocation(line: 146, column: 18, scope: !1419)
!1426 = !DILocation(line: 147, column: 10, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1397, file: !2, line: 147, column: 10)
!1428 = !DILocation(line: 147, column: 27, scope: !1427)
!1429 = !DILocation(line: 147, column: 25, scope: !1427)
!1430 = !DILocation(line: 147, column: 10, scope: !1397)
!1431 = !DILocation(line: 148, column: 22, scope: !1427)
!1432 = !DILocation(line: 148, column: 8, scope: !1427)
!1433 = !DILocation(line: 149, column: 4, scope: !1397)
