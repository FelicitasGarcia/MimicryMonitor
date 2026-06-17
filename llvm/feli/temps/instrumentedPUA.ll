; ModuleID = '../../../llvm/feli/temps/programPUA.ll'
source_filename = "/Users/felicitasgarcia/MM/coreutils/src/catPUA.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

%struct.option = type { ptr, i32, ptr, i32 }
%struct.infomap = type { ptr, ptr }
%AutomatonTransition = type { ptr, ptr }
%AutomatonNode = type { ptr, ptr, ptr, i1, ptr, i32 }
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
@id.str.1 = private constant [2 x i8] c"1\00"
@verdict.str.1 = private constant [3 x i8] c"NV\00"
@condition.str.1 = private constant [1 x i8] zeroinitializer
@trans.type.1.cond = private constant [5 x i8] c"cond\00"
@trans.target.1.cond = private constant [2 x i8] c"2\00"
@transitions.array.1 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.1.cond, ptr @trans.target.1.cond }]
@id.str.10 = private constant [3 x i8] c"10\00"
@verdict.str.10 = private constant [3 x i8] c"NV\00"
@condition.str.10 = private constant [1 x i8] zeroinitializer
@trans.type.10.cond = private constant [5 x i8] c"cond\00"
@trans.target.10.cond = private constant [3 x i8] c"11\00"
@transitions.array.10 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.10.cond, ptr @trans.target.10.cond }]
@id.str.11 = private constant [3 x i8] c"11\00"
@verdict.str.11 = private constant [3 x i8] c"NV\00"
@condition.str.11 = private constant [1 x i8] zeroinitializer
@trans.type.11.else = private constant [5 x i8] c"else\00"
@trans.target.11.else = private constant [3 x i8] c"13\00"
@trans.type.11.then = private constant [5 x i8] c"then\00"
@trans.target.11.then = private constant [3 x i8] c"12\00"
@transitions.array.11 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.11.else, ptr @trans.target.11.else }, %AutomatonTransition { ptr @trans.type.11.then, ptr @trans.target.11.then }]
@id.str.12 = private constant [3 x i8] c"12\00"
@verdict.str.12 = private constant [3 x i8] c"NV\00"
@condition.str.12 = private constant [1 x i8] zeroinitializer
@trans.type.12.cond = private constant [5 x i8] c"cond\00"
@trans.target.12.cond = private constant [3 x i8] c"14\00"
@transitions.array.12 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.12.cond, ptr @trans.target.12.cond }]
@id.str.13 = private constant [3 x i8] c"13\00"
@verdict.str.13 = private constant [3 x i8] c"NV\00"
@condition.str.13 = private constant [1 x i8] zeroinitializer
@trans.type.13.cond = private constant [5 x i8] c"cond\00"
@trans.target.13.cond = private constant [3 x i8] c"15\00"
@transitions.array.13 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.13.cond, ptr @trans.target.13.cond }]
@id.str.14 = private constant [3 x i8] c"14\00"
@verdict.str.14 = private constant [3 x i8] c"NV\00"
@condition.str.14 = private constant [1 x i8] zeroinitializer
@trans.type.14.else = private constant [5 x i8] c"else\00"
@trans.target.14.else = private constant [3 x i8] c"16\00"
@trans.type.14.then = private constant [5 x i8] c"then\00"
@trans.target.14.then = private constant [3 x i8] c"16\00"
@transitions.array.14 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.14.else, ptr @trans.target.14.else }, %AutomatonTransition { ptr @trans.type.14.then, ptr @trans.target.14.then }]
@id.str.15 = private constant [3 x i8] c"15\00"
@verdict.str.15 = private constant [3 x i8] c"NV\00"
@condition.str.15 = private constant [1 x i8] zeroinitializer
@trans.type.15.else = private constant [5 x i8] c"else\00"
@trans.target.15.else = private constant [3 x i8] c"17\00"
@trans.type.15.then = private constant [5 x i8] c"then\00"
@trans.target.15.then = private constant [3 x i8] c"12\00"
@transitions.array.15 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.15.else, ptr @trans.target.15.else }, %AutomatonTransition { ptr @trans.type.15.then, ptr @trans.target.15.then }]
@id.str.16 = private constant [3 x i8] c"16\00"
@verdict.str.16 = private constant [3 x i8] c"NV\00"
@condition.str.16 = private constant [1 x i8] zeroinitializer
@trans.type.16.cond = private constant [5 x i8] c"cond\00"
@trans.target.16.cond = private constant [3 x i8] c"18\00"
@transitions.array.16 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.16.cond, ptr @trans.target.16.cond }]
@id.str.17 = private constant [3 x i8] c"17\00"
@verdict.str.17 = private constant [3 x i8] c"NV\00"
@condition.str.17 = private constant [1 x i8] zeroinitializer
@trans.type.17.cond = private constant [5 x i8] c"cond\00"
@trans.target.17.cond = private constant [3 x i8] c"19\00"
@transitions.array.17 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.17.cond, ptr @trans.target.17.cond }]
@id.str.18 = private constant [3 x i8] c"18\00"
@verdict.str.18 = private constant [3 x i8] c"NV\00"
@condition.str.18 = private constant [1 x i8] zeroinitializer
@trans.type.18.else = private constant [5 x i8] c"else\00"
@trans.target.18.else = private constant [3 x i8] c"20\00"
@trans.type.18.then = private constant [5 x i8] c"then\00"
@trans.target.18.then = private constant [3 x i8] c"21\00"
@transitions.array.18 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.18.else, ptr @trans.target.18.else }, %AutomatonTransition { ptr @trans.type.18.then, ptr @trans.target.18.then }]
@id.str.19 = private constant [3 x i8] c"19\00"
@verdict.str.19 = private constant [3 x i8] c"NV\00"
@condition.str.19 = private constant [1 x i8] zeroinitializer
@trans.type.19.else = private constant [5 x i8] c"else\00"
@trans.target.19.else = private constant [3 x i8] c"12\00"
@trans.type.19.then = private constant [5 x i8] c"then\00"
@trans.target.19.then = private constant [3 x i8] c"12\00"
@transitions.array.19 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.19.else, ptr @trans.target.19.else }, %AutomatonTransition { ptr @trans.type.19.then, ptr @trans.target.19.then }]
@id.str.2 = private constant [2 x i8] c"2\00"
@verdict.str.2 = private constant [3 x i8] c"NV\00"
@condition.str.2 = private constant [1 x i8] zeroinitializer
@trans.type.2.else = private constant [5 x i8] c"else\00"
@trans.target.2.else = private constant [2 x i8] c"3\00"
@trans.type.2.then = private constant [5 x i8] c"then\00"
@trans.target.2.then = private constant [2 x i8] c"4\00"
@transitions.array.2 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.2.else, ptr @trans.target.2.else }, %AutomatonTransition { ptr @trans.type.2.then, ptr @trans.target.2.then }]
@id.str.20 = private constant [3 x i8] c"20\00"
@verdict.str.20 = private constant [3 x i8] c"NV\00"
@condition.str.20 = private constant [1 x i8] zeroinitializer
@trans.type.20.cond = private constant [5 x i8] c"cond\00"
@trans.target.20.cond = private constant [3 x i8] c"22\00"
@transitions.array.20 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.20.cond, ptr @trans.target.20.cond }]
@id.str.21 = private constant [3 x i8] c"21\00"
@verdict.str.21 = private constant [3 x i8] c"NV\00"
@condition.str.21 = private constant [1 x i8] zeroinitializer
@trans.type.21.cond = private constant [5 x i8] c"cond\00"
@trans.target.21.cond = private constant [3 x i8] c"23\00"
@transitions.array.21 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.21.cond, ptr @trans.target.21.cond }]
@id.str.22 = private constant [3 x i8] c"22\00"
@verdict.str.22 = private constant [3 x i8] c"NV\00"
@condition.str.22 = private constant [1 x i8] zeroinitializer
@trans.type.22.else = private constant [5 x i8] c"else\00"
@trans.target.22.else = private constant [3 x i8] c"24\00"
@trans.type.22.then = private constant [5 x i8] c"then\00"
@trans.target.22.then = private constant [3 x i8] c"25\00"
@transitions.array.22 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.22.else, ptr @trans.target.22.else }, %AutomatonTransition { ptr @trans.type.22.then, ptr @trans.target.22.then }]
@id.str.23 = private constant [3 x i8] c"23\00"
@verdict.str.23 = private constant [3 x i8] c"NV\00"
@condition.str.23 = private constant [1 x i8] zeroinitializer
@trans.type.23.else = private constant [5 x i8] c"else\00"
@trans.target.23.else = private constant [3 x i8] c"24\00"
@trans.type.23.then = private constant [5 x i8] c"then\00"
@trans.target.23.then = private constant [3 x i8] c"24\00"
@transitions.array.23 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.23.else, ptr @trans.target.23.else }, %AutomatonTransition { ptr @trans.type.23.then, ptr @trans.target.23.then }]
@id.str.24 = private constant [3 x i8] c"24\00"
@verdict.str.24 = private constant [3 x i8] c"NV\00"
@condition.str.24 = private constant [1 x i8] zeroinitializer
@trans.type.24.cond = private constant [5 x i8] c"cond\00"
@trans.target.24.cond = private constant [3 x i8] c"26\00"
@transitions.array.24 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.24.cond, ptr @trans.target.24.cond }]
@id.str.25 = private constant [3 x i8] c"25\00"
@verdict.str.25 = private constant [3 x i8] c"NV\00"
@condition.str.25 = private constant [1 x i8] zeroinitializer
@trans.type.25.cond = private constant [5 x i8] c"cond\00"
@trans.target.25.cond = private constant [3 x i8] c"27\00"
@transitions.array.25 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.25.cond, ptr @trans.target.25.cond }]
@id.str.26 = private constant [3 x i8] c"26\00"
@verdict.str.26 = private constant [3 x i8] c"NV\00"
@condition.str.26 = private constant [1 x i8] zeroinitializer
@trans.type.26.else = private constant [5 x i8] c"else\00"
@trans.target.26.else = private constant [3 x i8] c"29\00"
@trans.type.26.then = private constant [5 x i8] c"then\00"
@trans.target.26.then = private constant [3 x i8] c"28\00"
@transitions.array.26 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.26.else, ptr @trans.target.26.else }, %AutomatonTransition { ptr @trans.type.26.then, ptr @trans.target.26.then }]
@id.str.27 = private constant [3 x i8] c"27\00"
@verdict.str.27 = private constant [3 x i8] c"NV\00"
@condition.str.27 = private constant [1 x i8] zeroinitializer
@trans.type.27.else = private constant [5 x i8] c"else\00"
@trans.target.27.else = private constant [3 x i8] c"93\00"
@trans.type.27.then = private constant [5 x i8] c"then\00"
@trans.target.27.then = private constant [3 x i8] c"12\00"
@transitions.array.27 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.27.else, ptr @trans.target.27.else }, %AutomatonTransition { ptr @trans.type.27.then, ptr @trans.target.27.then }]
@id.str.28 = private constant [3 x i8] c"28\00"
@verdict.str.28 = private constant [3 x i8] c"NV\00"
@condition.str.28 = private constant [1 x i8] zeroinitializer
@trans.type.28.cond = private constant [5 x i8] c"cond\00"
@trans.target.28.cond = private constant [3 x i8] c"30\00"
@transitions.array.28 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.28.cond, ptr @trans.target.28.cond }]
@id.str.29 = private constant [3 x i8] c"29\00"
@verdict.str.29 = private constant [3 x i8] c"NV\00"
@condition.str.29 = private constant [1 x i8] zeroinitializer
@trans.type.29.cond = private constant [5 x i8] c"cond\00"
@trans.target.29.cond = private constant [3 x i8] c"31\00"
@transitions.array.29 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.29.cond, ptr @trans.target.29.cond }]
@id.str.3 = private constant [2 x i8] c"3\00"
@verdict.str.3 = private constant [3 x i8] c"NV\00"
@condition.str.3 = private constant [1 x i8] zeroinitializer
@trans.type.3.cond = private constant [5 x i8] c"cond\00"
@trans.target.3.cond = private constant [2 x i8] c"5\00"
@transitions.array.3 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.3.cond, ptr @trans.target.3.cond }]
@id.str.30 = private constant [3 x i8] c"30\00"
@verdict.str.30 = private constant [3 x i8] c"NV\00"
@condition.str.30 = private constant [1 x i8] zeroinitializer
@trans.type.30.else = private constant [5 x i8] c"else\00"
@trans.target.30.else = private constant [3 x i8] c"32\00"
@trans.type.30.then = private constant [5 x i8] c"then\00"
@trans.target.30.then = private constant [3 x i8] c"25\00"
@transitions.array.30 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.30.else, ptr @trans.target.30.else }, %AutomatonTransition { ptr @trans.type.30.then, ptr @trans.target.30.then }]
@id.str.31 = private constant [3 x i8] c"31\00"
@verdict.str.31 = private constant [3 x i8] c"NV\00"
@condition.str.31 = private constant [1 x i8] zeroinitializer
@trans.type.31.else = private constant [5 x i8] c"else\00"
@trans.target.31.else = private constant [3 x i8] c"34\00"
@trans.type.31.then = private constant [5 x i8] c"then\00"
@trans.target.31.then = private constant [3 x i8] c"33\00"
@transitions.array.31 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.31.else, ptr @trans.target.31.else }, %AutomatonTransition { ptr @trans.type.31.then, ptr @trans.target.31.then }]
@id.str.32 = private constant [3 x i8] c"32\00"
@verdict.str.32 = private constant [3 x i8] c"NV\00"
@condition.str.32 = private constant [1 x i8] zeroinitializer
@trans.type.32.cond = private constant [5 x i8] c"cond\00"
@trans.target.32.cond = private constant [3 x i8] c"35\00"
@transitions.array.32 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.32.cond, ptr @trans.target.32.cond }]
@id.str.33 = private constant [3 x i8] c"33\00"
@verdict.str.33 = private constant [3 x i8] c"NV\00"
@condition.str.33 = private constant [1 x i8] zeroinitializer
@trans.type.33.cond = private constant [5 x i8] c"cond\00"
@trans.target.33.cond = private constant [3 x i8] c"36\00"
@transitions.array.33 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.33.cond, ptr @trans.target.33.cond }]
@id.str.34 = private constant [3 x i8] c"34\00"
@verdict.str.34 = private constant [3 x i8] c"NV\00"
@condition.str.34 = private constant [1 x i8] zeroinitializer
@trans.type.34.cond = private constant [5 x i8] c"cond\00"
@trans.target.34.cond = private constant [3 x i8] c"37\00"
@transitions.array.34 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.34.cond, ptr @trans.target.34.cond }]
@id.str.35 = private constant [3 x i8] c"35\00"
@verdict.str.35 = private constant [3 x i8] c"NV\00"
@condition.str.35 = private constant [1 x i8] zeroinitializer
@trans.type.35.else = private constant [5 x i8] c"else\00"
@trans.target.35.else = private constant [3 x i8] c"25\00"
@trans.type.35.then = private constant [5 x i8] c"then\00"
@trans.target.35.then = private constant [3 x i8] c"25\00"
@transitions.array.35 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.35.else, ptr @trans.target.35.else }, %AutomatonTransition { ptr @trans.type.35.then, ptr @trans.target.35.then }]
@id.str.36 = private constant [3 x i8] c"36\00"
@verdict.str.36 = private constant [3 x i8] c"NV\00"
@condition.str.36 = private constant [1 x i8] zeroinitializer
@trans.type.36.else = private constant [5 x i8] c"else\00"
@trans.target.36.else = private constant [3 x i8] c"38\00"
@trans.type.36.then = private constant [5 x i8] c"then\00"
@trans.target.36.then = private constant [3 x i8] c"39\00"
@transitions.array.36 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.36.else, ptr @trans.target.36.else }, %AutomatonTransition { ptr @trans.type.36.then, ptr @trans.target.36.then }]
@id.str.37 = private constant [3 x i8] c"37\00"
@verdict.str.37 = private constant [3 x i8] c"NV\00"
@condition.str.37 = private constant [1 x i8] zeroinitializer
@trans.type.37.else = private constant [5 x i8] c"else\00"
@trans.target.37.else = private constant [3 x i8] c"40\00"
@trans.type.37.then = private constant [5 x i8] c"then\00"
@trans.target.37.then = private constant [3 x i8] c"33\00"
@transitions.array.37 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.37.else, ptr @trans.target.37.else }, %AutomatonTransition { ptr @trans.type.37.then, ptr @trans.target.37.then }]
@id.str.38 = private constant [3 x i8] c"38\00"
@verdict.str.38 = private constant [3 x i8] c"NV\00"
@condition.str.38 = private constant [1 x i8] zeroinitializer
@trans.type.38.cond = private constant [5 x i8] c"cond\00"
@trans.target.38.cond = private constant [3 x i8] c"41\00"
@transitions.array.38 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.38.cond, ptr @trans.target.38.cond }]
@id.str.39 = private constant [3 x i8] c"39\00"
@verdict.str.39 = private constant [3 x i8] c"NV\00"
@condition.str.39 = private constant [1 x i8] zeroinitializer
@trans.type.39.cond = private constant [5 x i8] c"cond\00"
@trans.target.39.cond = private constant [3 x i8] c"42\00"
@transitions.array.39 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.39.cond, ptr @trans.target.39.cond }]
@id.str.4 = private constant [2 x i8] c"4\00"
@verdict.str.4 = private constant [3 x i8] c"NV\00"
@condition.str.4 = private constant [1 x i8] zeroinitializer
@trans.type.4.cond = private constant [5 x i8] c"cond\00"
@trans.target.4.cond = private constant [2 x i8] c"6\00"
@transitions.array.4 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.4.cond, ptr @trans.target.4.cond }]
@id.str.40 = private constant [3 x i8] c"40\00"
@verdict.str.40 = private constant [3 x i8] c"NV\00"
@condition.str.40 = private constant [1 x i8] zeroinitializer
@trans.type.40.cond = private constant [5 x i8] c"cond\00"
@trans.target.40.cond = private constant [3 x i8] c"43\00"
@transitions.array.40 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.40.cond, ptr @trans.target.40.cond }]
@id.str.41 = private constant [3 x i8] c"41\00"
@verdict.str.41 = private constant [3 x i8] c"NV\00"
@condition.str.41 = private constant [1 x i8] zeroinitializer
@trans.type.41.else = private constant [5 x i8] c"else\00"
@trans.target.41.else = private constant [3 x i8] c"44\00"
@trans.type.41.then = private constant [5 x i8] c"then\00"
@trans.target.41.then = private constant [3 x i8] c"39\00"
@transitions.array.41 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.41.else, ptr @trans.target.41.else }, %AutomatonTransition { ptr @trans.type.41.then, ptr @trans.target.41.then }]
@id.str.42 = private constant [3 x i8] c"42\00"
@verdict.str.42 = private constant [3 x i8] c"NV\00"
@condition.str.42 = private constant [1 x i8] zeroinitializer
@trans.type.42.else = private constant [5 x i8] c"else\00"
@trans.target.42.else = private constant [3 x i8] c"45\00"
@trans.type.42.then = private constant [5 x i8] c"then\00"
@trans.target.42.then = private constant [3 x i8] c"93\00"
@transitions.array.42 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.42.else, ptr @trans.target.42.else }, %AutomatonTransition { ptr @trans.type.42.then, ptr @trans.target.42.then }]
@id.str.43 = private constant [3 x i8] c"43\00"
@verdict.str.43 = private constant [3 x i8] c"NV\00"
@condition.str.43 = private constant [1 x i8] zeroinitializer
@trans.type.43.else = private constant [5 x i8] c"else\00"
@trans.target.43.else = private constant [3 x i8] c"33\00"
@trans.type.43.then = private constant [5 x i8] c"then\00"
@trans.target.43.then = private constant [3 x i8] c"46\00"
@transitions.array.43 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.43.else, ptr @trans.target.43.else }, %AutomatonTransition { ptr @trans.type.43.then, ptr @trans.target.43.then }]
@id.str.44 = private constant [3 x i8] c"44\00"
@verdict.str.44 = private constant [3 x i8] c"NV\00"
@condition.str.44 = private constant [1 x i8] zeroinitializer
@trans.type.44.cond = private constant [5 x i8] c"cond\00"
@trans.target.44.cond = private constant [3 x i8] c"47\00"
@transitions.array.44 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.44.cond, ptr @trans.target.44.cond }]
@id.str.45 = private constant [3 x i8] c"45\00"
@verdict.str.45 = private constant [3 x i8] c"NV\00"
@condition.str.45 = private constant [1 x i8] zeroinitializer
@trans.type.45.cond = private constant [5 x i8] c"cond\00"
@trans.target.45.cond = private constant [3 x i8] c"48\00"
@transitions.array.45 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.45.cond, ptr @trans.target.45.cond }]
@id.str.46 = private constant [3 x i8] c"46\00"
@verdict.str.46 = private constant [3 x i8] c"NV\00"
@condition.str.46 = private constant [1 x i8] zeroinitializer
@trans.type.46.cond = private constant [5 x i8] c"cond\00"
@trans.target.46.cond = private constant [3 x i8] c"49\00"
@transitions.array.46 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.46.cond, ptr @trans.target.46.cond }]
@id.str.47 = private constant [3 x i8] c"47\00"
@verdict.str.47 = private constant [3 x i8] c"NV\00"
@condition.str.47 = private constant [1 x i8] zeroinitializer
@trans.type.47.else = private constant [5 x i8] c"else\00"
@trans.target.47.else = private constant [3 x i8] c"50\00"
@trans.type.47.then = private constant [5 x i8] c"then\00"
@trans.target.47.then = private constant [3 x i8] c"39\00"
@transitions.array.47 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.47.else, ptr @trans.target.47.else }, %AutomatonTransition { ptr @trans.type.47.then, ptr @trans.target.47.then }]
@id.str.48 = private constant [3 x i8] c"48\00"
@verdict.str.48 = private constant [3 x i8] c"NV\00"
@condition.str.48 = private constant [1 x i8] zeroinitializer
@trans.type.48.else = private constant [5 x i8] c"else\00"
@trans.target.48.else = private constant [3 x i8] c"51\00"
@trans.type.48.then = private constant [5 x i8] c"then\00"
@trans.target.48.then = private constant [3 x i8] c"93\00"
@transitions.array.48 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.48.else, ptr @trans.target.48.else }, %AutomatonTransition { ptr @trans.type.48.then, ptr @trans.target.48.then }]
@id.str.49 = private constant [3 x i8] c"49\00"
@verdict.str.49 = private constant [3 x i8] c"NV\00"
@condition.str.49 = private constant [1 x i8] zeroinitializer
@trans.type.49.else = private constant [5 x i8] c"else\00"
@trans.target.49.else = private constant [3 x i8] c"33\00"
@trans.type.49.then = private constant [5 x i8] c"then\00"
@trans.target.49.then = private constant [3 x i8] c"52\00"
@transitions.array.49 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.49.else, ptr @trans.target.49.else }, %AutomatonTransition { ptr @trans.type.49.then, ptr @trans.target.49.then }]
@id.str.5 = private constant [2 x i8] c"5\00"
@verdict.str.5 = private constant [3 x i8] c"NV\00"
@condition.str.5 = private constant [1 x i8] zeroinitializer
@trans.type.5.else = private constant [5 x i8] c"else\00"
@trans.target.5.else = private constant [2 x i8] c"7\00"
@trans.type.5.then = private constant [5 x i8] c"then\00"
@trans.target.5.then = private constant [3 x i8] c"93\00"
@transitions.array.5 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.5.else, ptr @trans.target.5.else }, %AutomatonTransition { ptr @trans.type.5.then, ptr @trans.target.5.then }]
@id.str.50 = private constant [3 x i8] c"50\00"
@verdict.str.50 = private constant [3 x i8] c"NV\00"
@condition.str.50 = private constant [1 x i8] zeroinitializer
@trans.type.50.cond = private constant [5 x i8] c"cond\00"
@trans.target.50.cond = private constant [3 x i8] c"53\00"
@transitions.array.50 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.50.cond, ptr @trans.target.50.cond }]
@id.str.51 = private constant [3 x i8] c"51\00"
@verdict.str.51 = private constant [3 x i8] c"NV\00"
@condition.str.51 = private constant [1 x i8] zeroinitializer
@trans.type.51.cond = private constant [5 x i8] c"cond\00"
@trans.target.51.cond = private constant [3 x i8] c"54\00"
@transitions.array.51 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.51.cond, ptr @trans.target.51.cond }]
@id.str.52 = private constant [3 x i8] c"52\00"
@verdict.str.52 = private constant [3 x i8] c"NV\00"
@condition.str.52 = private constant [1 x i8] zeroinitializer
@trans.type.52.cond = private constant [5 x i8] c"cond\00"
@trans.target.52.cond = private constant [3 x i8] c"55\00"
@transitions.array.52 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.52.cond, ptr @trans.target.52.cond }]
@id.str.53 = private constant [3 x i8] c"53\00"
@verdict.str.53 = private constant [3 x i8] c"NV\00"
@condition.str.53 = private constant [1 x i8] zeroinitializer
@trans.type.53.else = private constant [5 x i8] c"else\00"
@trans.target.53.else = private constant [3 x i8] c"56\00"
@trans.type.53.then = private constant [5 x i8] c"then\00"
@trans.target.53.then = private constant [3 x i8] c"39\00"
@transitions.array.53 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.53.else, ptr @trans.target.53.else }, %AutomatonTransition { ptr @trans.type.53.then, ptr @trans.target.53.then }]
@id.str.54 = private constant [3 x i8] c"54\00"
@verdict.str.54 = private constant [3 x i8] c"NV\00"
@condition.str.54 = private constant [1 x i8] zeroinitializer
@trans.type.54.else = private constant [5 x i8] c"else\00"
@trans.target.54.else = private constant [3 x i8] c"28\00"
@trans.type.54.then = private constant [5 x i8] c"then\00"
@trans.target.54.then = private constant [3 x i8] c"93\00"
@transitions.array.54 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.54.else, ptr @trans.target.54.else }, %AutomatonTransition { ptr @trans.type.54.then, ptr @trans.target.54.then }]
@id.str.55 = private constant [3 x i8] c"55\00"
@verdict.str.55 = private constant [3 x i8] c"NV\00"
@condition.str.55 = private constant [1 x i8] zeroinitializer
@trans.type.55.else = private constant [5 x i8] c"else\00"
@trans.target.55.else = private constant [3 x i8] c"33\00"
@trans.type.55.then = private constant [5 x i8] c"then\00"
@trans.target.55.then = private constant [3 x i8] c"94\00"
@transitions.array.55 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.55.else, ptr @trans.target.55.else }, %AutomatonTransition { ptr @trans.type.55.then, ptr @trans.target.55.then }]
@id.str.56 = private constant [3 x i8] c"56\00"
@verdict.str.56 = private constant [3 x i8] c"NV\00"
@condition.str.56 = private constant [1 x i8] zeroinitializer
@trans.type.56.cond = private constant [5 x i8] c"cond\00"
@trans.target.56.cond = private constant [3 x i8] c"70\00"
@transitions.array.56 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.56.cond, ptr @trans.target.56.cond }]
@id.str.6 = private constant [2 x i8] c"6\00"
@verdict.str.6 = private constant [3 x i8] c"NV\00"
@condition.str.6 = private constant [1 x i8] zeroinitializer
@trans.type.6.case_-130 = private constant [10 x i8] c"case_-130\00"
@trans.target.6.case_-130 = private constant [3 x i8] c"93\00"
@trans.type.6.case_-131 = private constant [10 x i8] c"case_-131\00"
@trans.target.6.case_-131 = private constant [3 x i8] c"93\00"
@trans.type.6.case_101 = private constant [9 x i8] c"case_101\00"
@trans.target.6.case_101 = private constant [2 x i8] c"1\00"
@trans.type.6.case_110 = private constant [9 x i8] c"case_110\00"
@trans.target.6.case_110 = private constant [2 x i8] c"1\00"
@trans.type.6.case_115 = private constant [9 x i8] c"case_115\00"
@trans.target.6.case_115 = private constant [2 x i8] c"1\00"
@trans.type.6.case_116 = private constant [9 x i8] c"case_116\00"
@trans.target.6.case_116 = private constant [2 x i8] c"1\00"
@trans.type.6.case_117 = private constant [9 x i8] c"case_117\00"
@trans.target.6.case_117 = private constant [2 x i8] c"1\00"
@trans.type.6.case_118 = private constant [9 x i8] c"case_118\00"
@trans.target.6.case_118 = private constant [2 x i8] c"1\00"
@trans.type.6.case_65 = private constant [8 x i8] c"case_65\00"
@trans.target.6.case_65 = private constant [2 x i8] c"1\00"
@trans.type.6.case_69 = private constant [8 x i8] c"case_69\00"
@trans.target.6.case_69 = private constant [2 x i8] c"1\00"
@trans.type.6.case_84 = private constant [8 x i8] c"case_84\00"
@trans.target.6.case_84 = private constant [2 x i8] c"1\00"
@trans.type.6.case_98 = private constant [8 x i8] c"case_98\00"
@trans.target.6.case_98 = private constant [2 x i8] c"1\00"
@trans.type.6.default = private constant [8 x i8] c"default\00"
@trans.target.6.default = private constant [3 x i8] c"93\00"
@transitions.array.6 = private constant [13 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.6.case_-130, ptr @trans.target.6.case_-130 }, %AutomatonTransition { ptr @trans.type.6.case_-131, ptr @trans.target.6.case_-131 }, %AutomatonTransition { ptr @trans.type.6.case_101, ptr @trans.target.6.case_101 }, %AutomatonTransition { ptr @trans.type.6.case_110, ptr @trans.target.6.case_110 }, %AutomatonTransition { ptr @trans.type.6.case_115, ptr @trans.target.6.case_115 }, %AutomatonTransition { ptr @trans.type.6.case_116, ptr @trans.target.6.case_116 }, %AutomatonTransition { ptr @trans.type.6.case_117, ptr @trans.target.6.case_117 }, %AutomatonTransition { ptr @trans.type.6.case_118, ptr @trans.target.6.case_118 }, %AutomatonTransition { ptr @trans.type.6.case_65, ptr @trans.target.6.case_65 }, %AutomatonTransition { ptr @trans.type.6.case_69, ptr @trans.target.6.case_69 }, %AutomatonTransition { ptr @trans.type.6.case_84, ptr @trans.target.6.case_84 }, %AutomatonTransition { ptr @trans.type.6.case_98, ptr @trans.target.6.case_98 }, %AutomatonTransition { ptr @trans.type.6.default, ptr @trans.target.6.default }]
@id.str.7 = private constant [2 x i8] c"7\00"
@verdict.str.7 = private constant [3 x i8] c"NV\00"
@condition.str.7 = private constant [1 x i8] zeroinitializer
@trans.type.7.cond = private constant [5 x i8] c"cond\00"
@trans.target.7.cond = private constant [2 x i8] c"9\00"
@transitions.array.7 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.7.cond, ptr @trans.target.7.cond }]
@id.str.70 = private constant [3 x i8] c"70\00"
@verdict.str.70 = private constant [3 x i8] c"NV\00"
@condition.str.70 = private constant [1 x i8] zeroinitializer
@trans.type.70.else = private constant [5 x i8] c"else\00"
@trans.target.70.else = private constant [3 x i8] c"73\00"
@trans.type.70.then = private constant [5 x i8] c"then\00"
@trans.target.70.then = private constant [3 x i8] c"39\00"
@transitions.array.70 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.70.else, ptr @trans.target.70.else }, %AutomatonTransition { ptr @trans.type.70.then, ptr @trans.target.70.then }]
@id.str.73 = private constant [3 x i8] c"73\00"
@verdict.str.73 = private constant [3 x i8] c"NV\00"
@condition.str.73 = private constant [1 x i8] zeroinitializer
@trans.type.73.cond = private constant [5 x i8] c"cond\00"
@trans.target.73.cond = private constant [3 x i8] c"76\00"
@transitions.array.73 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.73.cond, ptr @trans.target.73.cond }]
@id.str.76 = private constant [3 x i8] c"76\00"
@verdict.str.76 = private constant [3 x i8] c"NV\00"
@condition.str.76 = private constant [1 x i8] zeroinitializer
@trans.type.76.else = private constant [5 x i8] c"else\00"
@trans.target.76.else = private constant [3 x i8] c"79\00"
@trans.type.76.then = private constant [5 x i8] c"then\00"
@trans.target.76.then = private constant [3 x i8] c"80\00"
@transitions.array.76 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.76.else, ptr @trans.target.76.else }, %AutomatonTransition { ptr @trans.type.76.then, ptr @trans.target.76.then }]
@id.str.79 = private constant [3 x i8] c"79\00"
@verdict.str.79 = private constant [3 x i8] c"NV\00"
@condition.str.79 = private constant [1 x i8] zeroinitializer
@trans.type.79.cond = private constant [5 x i8] c"cond\00"
@trans.target.79.cond = private constant [3 x i8] c"83\00"
@transitions.array.79 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.79.cond, ptr @trans.target.79.cond }]
@id.str.80 = private constant [3 x i8] c"80\00"
@verdict.str.80 = private constant [3 x i8] c"NV\00"
@condition.str.80 = private constant [1 x i8] zeroinitializer
@trans.type.80.cond = private constant [5 x i8] c"cond\00"
@trans.target.80.cond = private constant [3 x i8] c"84\00"
@transitions.array.80 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.80.cond, ptr @trans.target.80.cond }]
@id.str.83 = private constant [3 x i8] c"83\00"
@verdict.str.83 = private constant [3 x i8] c"NV\00"
@condition.str.83 = private constant [1 x i8] zeroinitializer
@trans.type.83.else = private constant [5 x i8] c"else\00"
@trans.target.83.else = private constant [3 x i8] c"88\00"
@trans.type.83.then = private constant [5 x i8] c"then\00"
@trans.target.83.then = private constant [3 x i8] c"28\00"
@transitions.array.83 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.83.else, ptr @trans.target.83.else }, %AutomatonTransition { ptr @trans.type.83.then, ptr @trans.target.83.then }]
@id.str.84 = private constant [3 x i8] c"84\00"
@verdict.str.84 = private constant [3 x i8] c"NV\00"
@condition.str.84 = private constant [1 x i8] zeroinitializer
@trans.type.84.else = private constant [5 x i8] c"else\00"
@trans.target.84.else = private constant [3 x i8] c"79\00"
@trans.type.84.then = private constant [5 x i8] c"then\00"
@trans.target.84.then = private constant [3 x i8] c"79\00"
@transitions.array.84 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.84.else, ptr @trans.target.84.else }, %AutomatonTransition { ptr @trans.type.84.then, ptr @trans.target.84.then }]
@id.str.88 = private constant [3 x i8] c"88\00"
@verdict.str.88 = private constant [3 x i8] c"NV\00"
@condition.str.88 = private constant [1 x i8] zeroinitializer
@trans.type.88.cond = private constant [5 x i8] c"cond\00"
@trans.target.88.cond = private constant [3 x i8] c"92\00"
@transitions.array.88 = private constant [1 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.88.cond, ptr @trans.target.88.cond }]
@id.str.9 = private constant [2 x i8] c"9\00"
@verdict.str.9 = private constant [3 x i8] c"NV\00"
@condition.str.9 = private constant [1 x i8] zeroinitializer
@trans.type.9.else = private constant [5 x i8] c"else\00"
@trans.target.9.else = private constant [3 x i8] c"10\00"
@trans.type.9.then = private constant [5 x i8] c"then\00"
@trans.target.9.then = private constant [3 x i8] c"10\00"
@transitions.array.9 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.9.else, ptr @trans.target.9.else }, %AutomatonTransition { ptr @trans.type.9.then, ptr @trans.target.9.then }]
@id.str.92 = private constant [3 x i8] c"92\00"
@verdict.str.92 = private constant [3 x i8] c"NV\00"
@condition.str.92 = private constant [1 x i8] zeroinitializer
@trans.type.92.else = private constant [5 x i8] c"else\00"
@trans.target.92.else = private constant [3 x i8] c"28\00"
@trans.type.92.then = private constant [5 x i8] c"then\00"
@trans.target.92.then = private constant [3 x i8] c"28\00"
@transitions.array.92 = private constant [2 x %AutomatonTransition] [%AutomatonTransition { ptr @trans.type.92.else, ptr @trans.target.92.else }, %AutomatonTransition { ptr @trans.type.92.then, ptr @trans.target.92.then }]
@id.str.93 = private constant [3 x i8] c"93\00"
@verdict.str.93 = private constant [2 x i8] c"V\00"
@condition.str.93 = private constant [1 x i8] zeroinitializer
@transitions.array.93 = private constant [0 x %AutomatonTransition] zeroinitializer
@id.str.94 = private constant [3 x i8] c"94\00"
@verdict.str.94 = private constant [3 x i8] c"IV\00"
@condition.str.94 = private constant [1 x i8] zeroinitializer
@transitions.array.94 = private constant [0 x %AutomatonTransition] zeroinitializer
@automatonArray = internal constant [66 x %AutomatonNode] [%AutomatonNode { ptr @id.str.1, ptr @verdict.str.1, ptr @condition.str.1, i1 false, ptr @transitions.array.1, i32 1 }, %AutomatonNode { ptr @id.str.10, ptr @verdict.str.10, ptr @condition.str.10, i1 false, ptr @transitions.array.10, i32 1 }, %AutomatonNode { ptr @id.str.11, ptr @verdict.str.11, ptr @condition.str.11, i1 false, ptr @transitions.array.11, i32 2 }, %AutomatonNode { ptr @id.str.12, ptr @verdict.str.12, ptr @condition.str.12, i1 false, ptr @transitions.array.12, i32 1 }, %AutomatonNode { ptr @id.str.13, ptr @verdict.str.13, ptr @condition.str.13, i1 false, ptr @transitions.array.13, i32 1 }, %AutomatonNode { ptr @id.str.14, ptr @verdict.str.14, ptr @condition.str.14, i1 false, ptr @transitions.array.14, i32 2 }, %AutomatonNode { ptr @id.str.15, ptr @verdict.str.15, ptr @condition.str.15, i1 false, ptr @transitions.array.15, i32 2 }, %AutomatonNode { ptr @id.str.16, ptr @verdict.str.16, ptr @condition.str.16, i1 false, ptr @transitions.array.16, i32 1 }, %AutomatonNode { ptr @id.str.17, ptr @verdict.str.17, ptr @condition.str.17, i1 false, ptr @transitions.array.17, i32 1 }, %AutomatonNode { ptr @id.str.18, ptr @verdict.str.18, ptr @condition.str.18, i1 false, ptr @transitions.array.18, i32 2 }, %AutomatonNode { ptr @id.str.19, ptr @verdict.str.19, ptr @condition.str.19, i1 false, ptr @transitions.array.19, i32 2 }, %AutomatonNode { ptr @id.str.2, ptr @verdict.str.2, ptr @condition.str.2, i1 false, ptr @transitions.array.2, i32 2 }, %AutomatonNode { ptr @id.str.20, ptr @verdict.str.20, ptr @condition.str.20, i1 false, ptr @transitions.array.20, i32 1 }, %AutomatonNode { ptr @id.str.21, ptr @verdict.str.21, ptr @condition.str.21, i1 false, ptr @transitions.array.21, i32 1 }, %AutomatonNode { ptr @id.str.22, ptr @verdict.str.22, ptr @condition.str.22, i1 false, ptr @transitions.array.22, i32 2 }, %AutomatonNode { ptr @id.str.23, ptr @verdict.str.23, ptr @condition.str.23, i1 false, ptr @transitions.array.23, i32 2 }, %AutomatonNode { ptr @id.str.24, ptr @verdict.str.24, ptr @condition.str.24, i1 false, ptr @transitions.array.24, i32 1 }, %AutomatonNode { ptr @id.str.25, ptr @verdict.str.25, ptr @condition.str.25, i1 false, ptr @transitions.array.25, i32 1 }, %AutomatonNode { ptr @id.str.26, ptr @verdict.str.26, ptr @condition.str.26, i1 false, ptr @transitions.array.26, i32 2 }, %AutomatonNode { ptr @id.str.27, ptr @verdict.str.27, ptr @condition.str.27, i1 false, ptr @transitions.array.27, i32 2 }, %AutomatonNode { ptr @id.str.28, ptr @verdict.str.28, ptr @condition.str.28, i1 false, ptr @transitions.array.28, i32 1 }, %AutomatonNode { ptr @id.str.29, ptr @verdict.str.29, ptr @condition.str.29, i1 false, ptr @transitions.array.29, i32 1 }, %AutomatonNode { ptr @id.str.3, ptr @verdict.str.3, ptr @condition.str.3, i1 false, ptr @transitions.array.3, i32 1 }, %AutomatonNode { ptr @id.str.30, ptr @verdict.str.30, ptr @condition.str.30, i1 false, ptr @transitions.array.30, i32 2 }, %AutomatonNode { ptr @id.str.31, ptr @verdict.str.31, ptr @condition.str.31, i1 false, ptr @transitions.array.31, i32 2 }, %AutomatonNode { ptr @id.str.32, ptr @verdict.str.32, ptr @condition.str.32, i1 false, ptr @transitions.array.32, i32 1 }, %AutomatonNode { ptr @id.str.33, ptr @verdict.str.33, ptr @condition.str.33, i1 false, ptr @transitions.array.33, i32 1 }, %AutomatonNode { ptr @id.str.34, ptr @verdict.str.34, ptr @condition.str.34, i1 false, ptr @transitions.array.34, i32 1 }, %AutomatonNode { ptr @id.str.35, ptr @verdict.str.35, ptr @condition.str.35, i1 false, ptr @transitions.array.35, i32 2 }, %AutomatonNode { ptr @id.str.36, ptr @verdict.str.36, ptr @condition.str.36, i1 false, ptr @transitions.array.36, i32 2 }, %AutomatonNode { ptr @id.str.37, ptr @verdict.str.37, ptr @condition.str.37, i1 false, ptr @transitions.array.37, i32 2 }, %AutomatonNode { ptr @id.str.38, ptr @verdict.str.38, ptr @condition.str.38, i1 false, ptr @transitions.array.38, i32 1 }, %AutomatonNode { ptr @id.str.39, ptr @verdict.str.39, ptr @condition.str.39, i1 false, ptr @transitions.array.39, i32 1 }, %AutomatonNode { ptr @id.str.4, ptr @verdict.str.4, ptr @condition.str.4, i1 false, ptr @transitions.array.4, i32 1 }, %AutomatonNode { ptr @id.str.40, ptr @verdict.str.40, ptr @condition.str.40, i1 false, ptr @transitions.array.40, i32 1 }, %AutomatonNode { ptr @id.str.41, ptr @verdict.str.41, ptr @condition.str.41, i1 false, ptr @transitions.array.41, i32 2 }, %AutomatonNode { ptr @id.str.42, ptr @verdict.str.42, ptr @condition.str.42, i1 false, ptr @transitions.array.42, i32 2 }, %AutomatonNode { ptr @id.str.43, ptr @verdict.str.43, ptr @condition.str.43, i1 false, ptr @transitions.array.43, i32 2 }, %AutomatonNode { ptr @id.str.44, ptr @verdict.str.44, ptr @condition.str.44, i1 false, ptr @transitions.array.44, i32 1 }, %AutomatonNode { ptr @id.str.45, ptr @verdict.str.45, ptr @condition.str.45, i1 false, ptr @transitions.array.45, i32 1 }, %AutomatonNode { ptr @id.str.46, ptr @verdict.str.46, ptr @condition.str.46, i1 false, ptr @transitions.array.46, i32 1 }, %AutomatonNode { ptr @id.str.47, ptr @verdict.str.47, ptr @condition.str.47, i1 false, ptr @transitions.array.47, i32 2 }, %AutomatonNode { ptr @id.str.48, ptr @verdict.str.48, ptr @condition.str.48, i1 false, ptr @transitions.array.48, i32 2 }, %AutomatonNode { ptr @id.str.49, ptr @verdict.str.49, ptr @condition.str.49, i1 false, ptr @transitions.array.49, i32 2 }, %AutomatonNode { ptr @id.str.5, ptr @verdict.str.5, ptr @condition.str.5, i1 false, ptr @transitions.array.5, i32 2 }, %AutomatonNode { ptr @id.str.50, ptr @verdict.str.50, ptr @condition.str.50, i1 false, ptr @transitions.array.50, i32 1 }, %AutomatonNode { ptr @id.str.51, ptr @verdict.str.51, ptr @condition.str.51, i1 false, ptr @transitions.array.51, i32 1 }, %AutomatonNode { ptr @id.str.52, ptr @verdict.str.52, ptr @condition.str.52, i1 false, ptr @transitions.array.52, i32 1 }, %AutomatonNode { ptr @id.str.53, ptr @verdict.str.53, ptr @condition.str.53, i1 false, ptr @transitions.array.53, i32 2 }, %AutomatonNode { ptr @id.str.54, ptr @verdict.str.54, ptr @condition.str.54, i1 false, ptr @transitions.array.54, i32 2 }, %AutomatonNode { ptr @id.str.55, ptr @verdict.str.55, ptr @condition.str.55, i1 false, ptr @transitions.array.55, i32 2 }, %AutomatonNode { ptr @id.str.56, ptr @verdict.str.56, ptr @condition.str.56, i1 false, ptr @transitions.array.56, i32 1 }, %AutomatonNode { ptr @id.str.6, ptr @verdict.str.6, ptr @condition.str.6, i1 false, ptr @transitions.array.6, i32 13 }, %AutomatonNode { ptr @id.str.7, ptr @verdict.str.7, ptr @condition.str.7, i1 false, ptr @transitions.array.7, i32 1 }, %AutomatonNode { ptr @id.str.70, ptr @verdict.str.70, ptr @condition.str.70, i1 false, ptr @transitions.array.70, i32 2 }, %AutomatonNode { ptr @id.str.73, ptr @verdict.str.73, ptr @condition.str.73, i1 false, ptr @transitions.array.73, i32 1 }, %AutomatonNode { ptr @id.str.76, ptr @verdict.str.76, ptr @condition.str.76, i1 false, ptr @transitions.array.76, i32 2 }, %AutomatonNode { ptr @id.str.79, ptr @verdict.str.79, ptr @condition.str.79, i1 false, ptr @transitions.array.79, i32 1 }, %AutomatonNode { ptr @id.str.80, ptr @verdict.str.80, ptr @condition.str.80, i1 false, ptr @transitions.array.80, i32 1 }, %AutomatonNode { ptr @id.str.83, ptr @verdict.str.83, ptr @condition.str.83, i1 false, ptr @transitions.array.83, i32 2 }, %AutomatonNode { ptr @id.str.84, ptr @verdict.str.84, ptr @condition.str.84, i1 false, ptr @transitions.array.84, i32 2 }, %AutomatonNode { ptr @id.str.88, ptr @verdict.str.88, ptr @condition.str.88, i1 false, ptr @transitions.array.88, i32 1 }, %AutomatonNode { ptr @id.str.9, ptr @verdict.str.9, ptr @condition.str.9, i1 false, ptr @transitions.array.9, i32 2 }, %AutomatonNode { ptr @id.str.92, ptr @verdict.str.92, ptr @condition.str.92, i1 false, ptr @transitions.array.92, i32 2 }, %AutomatonNode { ptr @id.str.93, ptr @verdict.str.93, ptr @condition.str.93, i1 true, ptr @transitions.array.93, i32 0 }, %AutomatonNode { ptr @id.str.94, ptr @verdict.str.94, ptr @condition.str.94, i1 true, ptr @transitions.array.94, i32 0 }]
@0 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 0, ptr @automaton.init, ptr null }]
@.str.1.1 = private constant [5 x i8] c"cond\00"
@.str.2.2 = private constant [5 x i8] c"then\00"
@.str.3.3 = private constant [5 x i8] c"else\00"
@.str.4.4 = private constant [5 x i8] c"cond\00"
@.str.5.5 = private constant [8 x i8] c"default\00"
@.str.6.6 = private constant [8 x i8] c"case_98\00"
@.str.7.7 = private constant [9 x i8] c"case_101\00"
@.str.8.8 = private constant [9 x i8] c"case_110\00"
@.str.9.9 = private constant [9 x i8] c"case_115\00"
@.str.10.10 = private constant [9 x i8] c"case_116\00"
@.str.11.11 = private constant [9 x i8] c"case_117\00"
@.str.12.12 = private constant [9 x i8] c"case_118\00"
@.str.13.13 = private constant [8 x i8] c"case_65\00"
@.str.14.14 = private constant [8 x i8] c"case_69\00"
@.str.15.15 = private constant [8 x i8] c"case_84\00"
@.str.16.16 = private constant [10 x i8] c"case_-130\00"
@.str.17.17 = private constant [10 x i8] c"case_-131\00"
@.str.18.18 = private constant [5 x i8] c"cond\00"
@.str.19.19 = private constant [5 x i8] c"then\00"
@.str.20.20 = private constant [5 x i8] c"else\00"
@.str.21.21 = private constant [5 x i8] c"cond\00"
@.str.22.22 = private constant [5 x i8] c"then\00"
@.str.23.23 = private constant [5 x i8] c"else\00"
@.str.24.24 = private constant [5 x i8] c"cond\00"
@.str.25.25 = private constant [5 x i8] c"then\00"
@.str.26.26 = private constant [5 x i8] c"else\00"
@.str.27.27 = private constant [5 x i8] c"cond\00"
@.str.28.28 = private constant [5 x i8] c"then\00"
@.str.29.29 = private constant [5 x i8] c"else\00"
@.str.30.30 = private constant [5 x i8] c"cond\00"
@.str.31.31 = private constant [5 x i8] c"then\00"
@.str.32.32 = private constant [5 x i8] c"else\00"
@.str.33.33 = private constant [5 x i8] c"cond\00"
@.str.34.34 = private constant [5 x i8] c"then\00"
@.str.35.35 = private constant [5 x i8] c"else\00"
@.str.36.36 = private constant [5 x i8] c"cond\00"
@.str.37.37 = private constant [5 x i8] c"then\00"
@.str.38.38 = private constant [5 x i8] c"else\00"
@.str.39.39 = private constant [5 x i8] c"cond\00"
@.str.40.40 = private constant [5 x i8] c"then\00"
@.str.41.41 = private constant [5 x i8] c"else\00"
@.str.42.42 = private constant [5 x i8] c"cond\00"
@.str.43.43 = private constant [5 x i8] c"then\00"
@.str.44.44 = private constant [5 x i8] c"else\00"
@.str.45.45 = private constant [5 x i8] c"cond\00"
@.str.46.46 = private constant [5 x i8] c"then\00"
@.str.47.47 = private constant [5 x i8] c"else\00"
@.str.48.48 = private constant [5 x i8] c"cond\00"
@.str.49 = private constant [5 x i8] c"then\00"
@.str.50 = private constant [5 x i8] c"else\00"
@.str.51 = private constant [5 x i8] c"cond\00"
@.str.52 = private constant [5 x i8] c"then\00"
@.str.53 = private constant [5 x i8] c"else\00"
@.str.54 = private constant [5 x i8] c"cond\00"
@.str.55 = private constant [5 x i8] c"then\00"
@.str.56 = private constant [5 x i8] c"else\00"
@.str.57 = private constant [5 x i8] c"cond\00"
@.str.58 = private constant [5 x i8] c"then\00"
@.str.59 = private constant [5 x i8] c"else\00"
@.str.60 = private constant [5 x i8] c"cond\00"
@.str.61 = private constant [5 x i8] c"then\00"
@.str.62 = private constant [5 x i8] c"else\00"
@.str.63 = private constant [5 x i8] c"cond\00"
@.str.64 = private constant [5 x i8] c"then\00"
@.str.65 = private constant [5 x i8] c"else\00"
@.str.66 = private constant [5 x i8] c"cond\00"
@.str.67 = private constant [5 x i8] c"then\00"
@.str.68 = private constant [5 x i8] c"else\00"
@.str.69 = private constant [5 x i8] c"cond\00"
@.str.70 = private constant [5 x i8] c"then\00"
@.str.71 = private constant [5 x i8] c"else\00"
@.str.72 = private constant [5 x i8] c"cond\00"
@.str.73 = private constant [5 x i8] c"then\00"
@.str.74 = private constant [5 x i8] c"else\00"
@.str.75 = private constant [5 x i8] c"cond\00"
@.str.76 = private constant [5 x i8] c"then\00"
@.str.77 = private constant [5 x i8] c"else\00"
@.str.78 = private constant [5 x i8] c"cond\00"
@.str.79 = private constant [5 x i8] c"then\00"
@.str.80 = private constant [5 x i8] c"else\00"
@.str.81 = private constant [5 x i8] c"cond\00"
@.str.82 = private constant [5 x i8] c"then\00"
@.str.83 = private constant [5 x i8] c"else\00"
@.str.84 = private constant [5 x i8] c"cond\00"
@.str.85 = private constant [5 x i8] c"then\00"
@.str.86 = private constant [5 x i8] c"else\00"
@.str.87 = private constant [5 x i8] c"cond\00"
@.str.88 = private constant [5 x i8] c"then\00"
@.str.89 = private constant [5 x i8] c"else\00"
@.str.90 = private constant [5 x i8] c"cond\00"
@.str.91 = private constant [5 x i8] c"then\00"
@.str.92 = private constant [5 x i8] c"else\00"
@.str.93 = private constant [5 x i8] c"cond\00"
@.str.94 = private constant [5 x i8] c"then\00"
@.str.95 = private constant [5 x i8] c"else\00"
@.str.96 = private constant [5 x i8] c"cond\00"
@.str.97 = private constant [5 x i8] c"then\00"
@.str.98 = private constant [5 x i8] c"else\00"
@.str.99 = private constant [5 x i8] c"cond\00"
@.str.100 = private constant [5 x i8] c"then\00"
@.str.101 = private constant [5 x i8] c"else\00"
@.str.102 = private constant [5 x i8] c"cond\00"
@.str.103 = private constant [5 x i8] c"then\00"
@.str.104 = private constant [5 x i8] c"else\00"
@.str.105 = private constant [5 x i8] c"cond\00"
@.str.106 = private constant [5 x i8] c"then\00"
@.str.107 = private constant [5 x i8] c"else\00"
@.str.108 = private constant [5 x i8] c"cond\00"
@.str.109 = private constant [5 x i8] c"then\00"
@.str.110 = private constant [5 x i8] c"else\00"
@.str.111 = private constant [5 x i8] c"cond\00"
@.str.112 = private constant [5 x i8] c"then\00"
@.str.113 = private constant [5 x i8] c"else\00"
@.str.114 = private constant [5 x i8] c"cond\00"
@.str.115 = private constant [5 x i8] c"then\00"
@.str.116 = private constant [5 x i8] c"else\00"
@.str.117 = private constant [5 x i8] c"cond\00"
@.str.118 = private constant [5 x i8] c"then\00"
@.str.119 = private constant [5 x i8] c"else\00"
@.str.120 = private constant [5 x i8] c"cond\00"
@.str.121 = private constant [5 x i8] c"then\00"
@.str.122 = private constant [5 x i8] c"else\00"
@.str.123 = private constant [5 x i8] c"cond\00"
@.str.124 = private constant [5 x i8] c"then\00"
@.str.125 = private constant [5 x i8] c"else\00"
@.str.126 = private constant [5 x i8] c"cond\00"
@.str.127 = private constant [5 x i8] c"then\00"
@.str.128 = private constant [5 x i8] c"else\00"
@.str.129 = private constant [5 x i8] c"cond\00"
@.str.130 = private constant [5 x i8] c"then\00"
@.str.131 = private constant [5 x i8] c"else\00"
@.str.132 = private constant [5 x i8] c"cond\00"
@.str.133 = private constant [5 x i8] c"then\00"
@.str.134 = private constant [5 x i8] c"else\00"

; Function Attrs: noinline noreturn nounwind ssp uwtable(sync)
define void @usage(i32 noundef %0) #0 !dbg !290 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
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

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @printf(ptr noundef, ...) #1

declare i32 @"\01_fputs"(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @emit_stdin_note() #2 !dbg !322 {
  %1 = load ptr, ptr @__stdoutp, align 8, !dbg !325
  %2 = call i32 @"\01_fputs"(ptr noundef @.str.30, ptr noundef %1), !dbg !326
  ret void, !dbg !327
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @emit_ancillary_info(ptr noundef %0) #2 !dbg !328 {
  %2 = alloca ptr, align 8
  %3 = alloca [7 x %struct.infomap], align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 @__const.emit_ancillary_info.infomap, i64 112, i1 false), !dbg !340
  %8 = load ptr, ptr %2, align 8, !dbg !343
  store ptr %8, ptr %4, align 8, !dbg !342
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
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #2 !dbg !46 {
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
  store ptr %1, ptr %5, align 8
  store i8 0, ptr %6, align 1, !dbg !396
  store i8 0, ptr %8, align 1, !dbg !461
  store i8 0, ptr %9, align 1, !dbg !463
  store i8 0, ptr %10, align 1, !dbg !465
  store i8 0, ptr %11, align 1, !dbg !467
  store i8 0, ptr %12, align 1, !dbg !469
  store i8 0, ptr %13, align 1, !dbg !471
  store i32 0, ptr %14, align 4, !dbg !473
  %33 = load ptr, ptr %5, align 8, !dbg !474
  %34 = getelementptr inbounds ptr, ptr %33, i64 0, !dbg !474
  %35 = load ptr, ptr %34, align 8, !dbg !474
  call void @set_program_name(ptr noundef %35), !dbg !475
  %36 = call ptr @setlocale(i32 noundef 0, ptr noundef @.str.18), !dbg !476
  %37 = call i32 @atexit(ptr noundef @close_stdout), !dbg !477
  br label %38, !dbg !480

38:                                               ; preds = %62, %2
  %39 = load i32, ptr %4, align 4, !dbg !481
  %40 = load ptr, ptr %5, align 8, !dbg !482
  %41 = call i32 @rpl_getopt_long(i32 noundef %39, ptr noundef %40, ptr noundef @.str.19, ptr noundef @main.long_options, ptr noundef null), !dbg !483
  store i32 %41, ptr %15, align 4, !dbg !484
  %42 = icmp ne i32 %41, -1, !dbg !485
  call void @monitorAction(ptr @.str.1.1), !dbg !480
  br i1 %42, label %monedge.then, label %monedge.else, !dbg !480

43:                                               ; preds = %monedge.then
  %44 = load i32, ptr %15, align 4, !dbg !486
  call void @monitorAction(ptr @.str.4.4), !dbg !488
  switch i32 %44, label %monedge.default [
    i32 98, label %monedge.case_98
    i32 101, label %monedge.case_101
    i32 110, label %monedge.case_110
    i32 115, label %monedge.case_115
    i32 116, label %monedge.case_116
    i32 117, label %monedge.case_117
    i32 118, label %monedge.case_118
    i32 65, label %monedge.case_65
    i32 69, label %monedge.case_69
    i32 84, label %monedge.case_84
    i32 -130, label %monedge.case_-130
    i32 -131, label %monedge.case_-131
  ]

45:                                               ; preds = %monedge.case_98
  store i8 1, ptr %8, align 1, !dbg !489
  store i8 1, ptr %9, align 1, !dbg !491
  br label %62, !dbg !492

46:                                               ; preds = %monedge.case_101
  store i8 1, ptr %11, align 1, !dbg !493
  store i8 1, ptr %12, align 1, !dbg !494
  br label %62, !dbg !495

47:                                               ; preds = %monedge.case_110
  store i8 1, ptr %8, align 1, !dbg !496
  br label %62, !dbg !497

48:                                               ; preds = %monedge.case_115
  store i8 1, ptr %10, align 1, !dbg !498
  br label %62, !dbg !499

49:                                               ; preds = %monedge.case_116
  store i8 1, ptr %13, align 1, !dbg !500
  store i8 1, ptr %12, align 1, !dbg !501
  br label %62, !dbg !502

50:                                               ; preds = %monedge.case_117
  br label %62, !dbg !503

51:                                               ; preds = %monedge.case_118
  store i8 1, ptr %12, align 1, !dbg !504
  br label %62, !dbg !505

52:                                               ; preds = %monedge.case_65
  store i8 1, ptr %12, align 1, !dbg !506
  store i8 1, ptr %11, align 1, !dbg !507
  store i8 1, ptr %13, align 1, !dbg !508
  br label %62, !dbg !509

53:                                               ; preds = %monedge.case_69
  store i8 1, ptr %11, align 1, !dbg !510
  br label %62, !dbg !511

54:                                               ; preds = %monedge.case_84
  store i8 1, ptr %13, align 1, !dbg !512
  br label %62, !dbg !513

55:                                               ; preds = %monedge.case_-130
  call void @usage(i32 noundef 0) #10, !dbg !514
  unreachable, !dbg !514

56:                                               ; preds = %monedge.case_-131
  %57 = load ptr, ptr @__stdoutp, align 8, !dbg !515
  %58 = load ptr, ptr @Version, align 8, !dbg !515
  %59 = call ptr @proper_name_lite(ptr noundef @.str.21, ptr noundef @.str.22), !dbg !515
  %60 = call ptr @proper_name_lite(ptr noundef @.str.23, ptr noundef @.str.23), !dbg !515
  call void (ptr, ptr, ptr, ptr, ...) @version_etc(ptr noundef %57, ptr noundef @.str.8, ptr noundef @.str.20, ptr noundef %58, ptr noundef %59, ptr noundef %60, ptr noundef null), !dbg !515
  call void @exit(i32 noundef 0) #10, !dbg !515
  unreachable, !dbg !515

61:                                               ; preds = %monedge.default
  call void @usage(i32 noundef 1) #10, !dbg !516
  unreachable, !dbg !516

62:                                               ; preds = %54, %53, %52, %51, %50, %49, %48, %47, %46, %45
  br label %38, !dbg !480, !llvm.loop !517

63:                                               ; preds = %monedge.else
  %64 = call i32 @rpl_fstat(i32 noundef 1, ptr noundef %7), !dbg !519
  %65 = icmp slt i32 %64, 0, !dbg !521
  call void @monitorAction(ptr @.str.18.18), !dbg !522
  br i1 %65, label %monedge.then1, label %monedge.else2, !dbg !522

66:                                               ; preds = %monedge.then1
  %67 = call ptr @__error(), !dbg !523
  %68 = load i32, ptr %67, align 4, !dbg !523
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %68, ptr noundef @.str.24) #11, !dbg !523
  unreachable, !dbg !523

69:                                               ; preds = %monedge.else2
  %70 = call i64 @io_blksize(ptr noundef %7), !dbg !530
  store i64 %70, ptr %16, align 8, !dbg !529
  store i32 -2, ptr %19, align 4, !dbg !539
  store i8 1, ptr %20, align 1, !dbg !541
  %71 = load i8, ptr %20, align 1, !dbg !542
  %72 = trunc i8 %71 to i1, !dbg !542
  call void @monitorAction(ptr @.str.21.21), !dbg !544
  br i1 %72, label %monedge.then3, label %monedge.else4, !dbg !544

73:                                               ; preds = %monedge.then3
  %74 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 0, !dbg !545
  %75 = load i32, ptr %74, align 8, !dbg !545
  store i32 %75, ptr %17, align 4, !dbg !547
  %76 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !548
  %77 = load i64, ptr %76, align 8, !dbg !548
  store i64 %77, ptr %18, align 8, !dbg !549
  br label %78, !dbg !550

78:                                               ; preds = %monedge.else4, %73
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
  call void @monitorAction(ptr @.str.24.24), !dbg !557
  br i1 %88, label %monedge.then5, label %monedge.else6, !dbg !557

89:                                               ; preds = %monedge.else6
  %90 = load i8, ptr %11, align 1, !dbg !558
  %91 = trunc i8 %90 to i1, !dbg !558
  call void @monitorAction(ptr @.str.27.27), !dbg !559
  br i1 %91, label %monedge.then7, label %monedge.else8, !dbg !559

92:                                               ; preds = %monedge.else8
  %93 = load i8, ptr %10, align 1, !dbg !560
  %94 = trunc i8 %93 to i1, !dbg !560
  call void @monitorAction(ptr @.str.30.30), !dbg !561
  br i1 %94, label %monedge.then9, label %monedge.else10, !dbg !561

95:                                               ; preds = %monedge.else10
  %96 = load i32, ptr %14, align 4, !dbg !562
  %97 = or i32 %96, 0, !dbg !562
  store i32 %97, ptr %14, align 4, !dbg !562
  call void @xset_binary_mode(i32 noundef 1, i32 noundef 0), !dbg !564
  br label %98, !dbg !565

98:                                               ; preds = %monedge.then9, %monedge.then7, %monedge.then5, %95
  store ptr @.str.25, ptr @infile, align 8, !dbg !566
  %99 = load i32, ptr @rpl_optind, align 4, !dbg !569
  store i32 %99, ptr %22, align 4, !dbg !568
  store i8 1, ptr %23, align 1, !dbg !571
  %100 = call i32 @getpagesize() #12, !dbg !574
  %101 = sext i32 %100 to i64, !dbg !574
  store i64 %101, ptr %24, align 8, !dbg !573
  br label %102, !dbg !575

102:                                              ; preds = %monedge.then69, %98
  %103 = load i32, ptr %22, align 4, !dbg !576
  %104 = load i32, ptr %4, align 4, !dbg !579
  %105 = icmp slt i32 %103, %104, !dbg !580
  call void @monitorAction(ptr @.str.33.33), !dbg !581
  br i1 %105, label %monedge.then11, label %monedge.else12, !dbg !581

106:                                              ; preds = %monedge.then11
  %107 = load ptr, ptr %5, align 8, !dbg !582
  %108 = load i32, ptr %22, align 4, !dbg !583
  %109 = sext i32 %108 to i64, !dbg !582
  %110 = getelementptr inbounds ptr, ptr %107, i64 %109, !dbg !582
  %111 = load ptr, ptr %110, align 8, !dbg !582
  store ptr %111, ptr @infile, align 8, !dbg !584
  br label %112, !dbg !585

112:                                              ; preds = %monedge.else12, %106
  %113 = load ptr, ptr @infile, align 8, !dbg !588
  %114 = call i32 @strcmp(ptr noundef %113, ptr noundef @.str.25), !dbg !588
  %115 = icmp eq i32 %114, 0, !dbg !588
  %116 = zext i1 %115 to i8, !dbg !587
  store i8 %116, ptr %25, align 1, !dbg !587
  %117 = load i8, ptr %25, align 1, !dbg !589
  %118 = trunc i8 %117 to i1, !dbg !589
  call void @monitorAction(ptr @.str.36.36), !dbg !591
  br i1 %118, label %monedge.then13, label %monedge.else14, !dbg !591

119:                                              ; preds = %monedge.then13
  store i8 1, ptr %6, align 1, !dbg !592
  store i32 0, ptr @input_desc, align 4, !dbg !594
  %120 = load i32, ptr %14, align 4, !dbg !595
  %121 = and i32 %120, 0, !dbg !597
  %122 = icmp ne i32 %121, 0, !dbg !597
  call void @monitorAction(ptr @.str.39.39), !dbg !598
  br i1 %122, label %monedge.then15, label %monedge.else16, !dbg !598

123:                                              ; preds = %monedge.then15
  call void @xset_binary_mode(i32 noundef 0, i32 noundef 0), !dbg !599
  br label %124, !dbg !599

124:                                              ; preds = %monedge.else16, %123
  br label %137, !dbg !600

125:                                              ; preds = %monedge.else14
  %126 = load ptr, ptr @infile, align 8, !dbg !601
  %127 = load i32, ptr %14, align 4, !dbg !603
  %128 = call i32 (ptr, i32, ...) @rpl_open(ptr noundef %126, i32 noundef %127), !dbg !604
  store i32 %128, ptr @input_desc, align 4, !dbg !605
  %129 = load i32, ptr @input_desc, align 4, !dbg !606
  %130 = icmp slt i32 %129, 0, !dbg !608
  call void @monitorAction(ptr @.str.42.42), !dbg !609
  br i1 %130, label %monedge.then17, label %monedge.else18, !dbg !609

131:                                              ; preds = %monedge.then17
  %132 = call ptr @__error(), !dbg !610
  %133 = load i32, ptr %132, align 4, !dbg !610
  %134 = load ptr, ptr @infile, align 8, !dbg !610
  %135 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %134), !dbg !610
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %133, ptr noundef @.str.26, ptr noundef %135) #11, !dbg !610
  store i8 0, ptr %23, align 1, !dbg !612
  br label %338, !dbg !613

136:                                              ; preds = %monedge.else18
  br label %137

137:                                              ; preds = %136, %124
  %138 = load i32, ptr @input_desc, align 4, !dbg !614
  %139 = call i32 @rpl_fstat(i32 noundef %138, ptr noundef %7), !dbg !616
  %140 = icmp slt i32 %139, 0, !dbg !617
  call void @monitorAction(ptr @.str.45.45), !dbg !618
  br i1 %140, label %monedge.then19, label %monedge.else20, !dbg !618

141:                                              ; preds = %monedge.then19
  %142 = call ptr @__error(), !dbg !619
  %143 = load i32, ptr %142, align 4, !dbg !619
  %144 = load ptr, ptr @infile, align 8, !dbg !619
  %145 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %144), !dbg !619
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %143, ptr noundef @.str.26, ptr noundef %145) #11, !dbg !619
  store i8 0, ptr %23, align 1, !dbg !621
  br label %325, !dbg !622

146:                                              ; preds = %monedge.else20
  %147 = call i64 @io_blksize(ptr noundef %7), !dbg !625
  store i64 %147, ptr %26, align 8, !dbg !624
  %148 = load i32, ptr @input_desc, align 4, !dbg !626
  call void @fdadvise(i32 noundef %148, i64 noundef 0, i64 noundef 0, i32 noundef 1), !dbg !627
  %149 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !628
  %150 = load i16, ptr %149, align 4, !dbg !628
  %151 = zext i16 %150 to i32, !dbg !628
  %152 = and i32 %151, 61440, !dbg !628
  %153 = icmp eq i32 %152, 4096, !dbg !628
  call void @monitorAction(ptr @.str.48.48), !dbg !630
  br i1 %153, label %monedge.then21, label %monedge.else22, !dbg !630

154:                                              ; preds = %monedge.else22
  %155 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !631
  %156 = load i16, ptr %155, align 4, !dbg !631
  %157 = zext i16 %156 to i32, !dbg !631
  %158 = and i32 %157, 61440, !dbg !631
  %159 = icmp eq i32 %158, 49152, !dbg !631
  call void @monitorAction(ptr @.str.51), !dbg !632
  br i1 %159, label %monedge.then23, label %monedge.else24, !dbg !632

160:                                              ; preds = %monedge.else24
  %161 = load i8, ptr %20, align 1, !dbg !633
  %162 = trunc i8 %161 to i1, !dbg !633
  call void @monitorAction(ptr @.str.54), !dbg !634
  br i1 %162, label %monedge.then25, label %monedge.else26, !dbg !634

163:                                              ; preds = %monedge.then25
  %164 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 0, !dbg !635
  %165 = load i32, ptr %164, align 8, !dbg !635
  %166 = load i32, ptr %17, align 4, !dbg !636
  %167 = icmp eq i32 %165, %166, !dbg !637
  call void @monitorAction(ptr @.str.57), !dbg !638
  br i1 %167, label %monedge.then27, label %monedge.else28, !dbg !638

168:                                              ; preds = %monedge.then27
  %169 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3, !dbg !639
  %170 = load i64, ptr %169, align 8, !dbg !639
  %171 = load i64, ptr %18, align 8, !dbg !640
  %172 = icmp eq i64 %170, %171, !dbg !641
  call void @monitorAction(ptr @.str.60), !dbg !642
  br i1 %172, label %monedge.then29, label %monedge.else30, !dbg !642

173:                                              ; preds = %monedge.then29
  %174 = load i32, ptr %19, align 4, !dbg !643
  %175 = icmp slt i32 %174, -1, !dbg !646
  call void @monitorAction(ptr @.str.63), !dbg !647
  br i1 %175, label %monedge.then31, label %monedge.else32, !dbg !647

176:                                              ; preds = %monedge.then31
  %177 = call i32 (i32, i32, ...) @"\01_fcntl"(i32 noundef 1, i32 noundef 3), !dbg !648
  store i32 %177, ptr %19, align 4, !dbg !649
  br label %178, !dbg !650

178:                                              ; preds = %monedge.else32, %176
  %179 = load i32, ptr %19, align 4, !dbg !653
  %180 = icmp sle i32 0, %179, !dbg !654
  call void @monitorAction(ptr @.str.66), !dbg !655
  br i1 %180, label %monedge.then33, label %monedge.else34, !dbg !655

181:                                              ; preds = %monedge.then33
  %182 = load i32, ptr %19, align 4, !dbg !656
  %183 = and i32 %182, 8, !dbg !657
  %184 = icmp ne i32 %183, 0, !dbg !655
  br label %185

185:                                              ; preds = %monedge.else34, %181
  %186 = phi i1 [ false, %monedge.else34 ], [ %184, %181 ], !dbg !658
  %187 = zext i1 %186 to i8, !dbg !652
  store i8 %187, ptr %27, align 1, !dbg !652
  %188 = load i8, ptr %27, align 1, !dbg !659
  %189 = trunc i8 %188 to i1, !dbg !659
  call void @monitorAction(ptr @.str.69), !dbg !661
  br i1 %189, label %monedge.then35, label %monedge.else36, !dbg !661

190:                                              ; preds = %monedge.else36
  %191 = load i32, ptr @input_desc, align 4, !dbg !665
  %192 = call i64 @lseek(i32 noundef %191, i64 noundef 0, i32 noundef 1), !dbg !666
  store i64 %192, ptr %28, align 8, !dbg !664
  %193 = load i64, ptr %28, align 8, !dbg !667
  %194 = icmp sle i64 0, %193, !dbg !669
  call void @monitorAction(ptr @.str.72), !dbg !670
  br i1 %194, label %monedge.then37, label %monedge.else38, !dbg !670

195:                                              ; preds = %monedge.then37
  %196 = load i64, ptr %28, align 8, !dbg !671
  %197 = call i64 @lseek(i32 noundef 1, i64 noundef 0, i32 noundef 1), !dbg !672
  %198 = icmp slt i64 %196, %197, !dbg !673
  %199 = zext i1 %198 to i8, !dbg !674
  store i8 %199, ptr %27, align 1, !dbg !674
  br label %200, !dbg !675

200:                                              ; preds = %monedge.else38, %195
  br label %201, !dbg !676

201:                                              ; preds = %monedge.then35, %200
  %202 = load i8, ptr %27, align 1, !dbg !677
  %203 = trunc i8 %202 to i1, !dbg !677
  call void @monitorAction(ptr @.str.75), !dbg !679
  br i1 %203, label %monedge.then39, label %monedge.else40, !dbg !679

204:                                              ; preds = %monedge.then39
  %205 = load ptr, ptr @infile, align 8, !dbg !680
  %206 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %205), !dbg !680
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef 0, ptr noundef @.str.27, ptr noundef %206) #11, !dbg !680
  store i8 0, ptr %23, align 1, !dbg !682
  br label %325, !dbg !683

207:                                              ; preds = %monedge.else40
  br label %208, !dbg !684

208:                                              ; preds = %monedge.else30, %monedge.else28, %monedge.else26, %monedge.then23, %monedge.then21, %207
  %209 = load i8, ptr %8, align 1, !dbg !687
  %210 = trunc i8 %209 to i1, !dbg !687
  call void @monitorAction(ptr @.str.78), !dbg !689
  br i1 %210, label %monedge.then41, label %monedge.else42, !dbg !689

211:                                              ; preds = %monedge.else42
  %212 = load i8, ptr %11, align 1, !dbg !690
  %213 = trunc i8 %212 to i1, !dbg !690
  call void @monitorAction(ptr @.str.81), !dbg !691
  br i1 %213, label %monedge.then43, label %monedge.else44, !dbg !691

214:                                              ; preds = %monedge.else44
  %215 = load i8, ptr %12, align 1, !dbg !692
  %216 = trunc i8 %215 to i1, !dbg !692
  call void @monitorAction(ptr @.str.84), !dbg !693
  br i1 %216, label %monedge.then45, label %monedge.else46, !dbg !693

217:                                              ; preds = %monedge.else46
  %218 = load i8, ptr %13, align 1, !dbg !694
  %219 = trunc i8 %218 to i1, !dbg !694
  call void @monitorAction(ptr @.str.87), !dbg !695
  br i1 %219, label %monedge.then47, label %monedge.else48, !dbg !695

220:                                              ; preds = %monedge.else48
  %221 = load i8, ptr %10, align 1, !dbg !696
  %222 = trunc i8 %221 to i1, !dbg !696
  call void @monitorAction(ptr @.str.90), !dbg !697
  br i1 %222, label %monedge.then49, label %monedge.else50, !dbg !697

223:                                              ; preds = %monedge.else50
  %224 = load i8, ptr %21, align 1, !dbg !701
  %225 = trunc i8 %224 to i1, !dbg !701
  call void @monitorAction(ptr @.str.93), !dbg !702
  br i1 %225, label %monedge.then51, label %monedge.else52, !dbg !702

226:                                              ; preds = %monedge.then51
  %227 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 1, !dbg !703
  %228 = load i16, ptr %227, align 4, !dbg !703
  %229 = zext i16 %228 to i32, !dbg !703
  %230 = and i32 %229, 61440, !dbg !703
  %231 = icmp eq i32 %230, 32768, !dbg !703
  call void @monitorAction(ptr @.str.96), !dbg !701
  br i1 %231, label %monedge.then53, label %monedge.else54, !dbg !701

232:                                              ; preds = %monedge.then53
  %233 = call i32 @copy_cat(), !dbg !704
  br label %235, !dbg !701

234:                                              ; preds = %monedge.else54, %monedge.else52
  br label %235, !dbg !701

235:                                              ; preds = %234, %232
  %236 = phi i32 [ %233, %232 ], [ 0, %234 ], !dbg !701
  store i32 %236, ptr %30, align 4, !dbg !700
  %237 = load i32, ptr %30, align 4, !dbg !705
  %238 = icmp ne i32 %237, 0, !dbg !707
  call void @monitorAction(ptr @.str.99), !dbg !708
  br i1 %238, label %monedge.then55, label %monedge.else56, !dbg !708

239:                                              ; preds = %monedge.then55
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

249:                                              ; preds = %monedge.else56
  %250 = load i64, ptr %26, align 8, !dbg !715
  %251 = load i64, ptr %16, align 8, !dbg !715
  %252 = icmp sgt i64 %250, %251, !dbg !715
  call void @monitorAction(ptr @.str.102), !dbg !715
  br i1 %252, label %monedge.then57, label %monedge.else58, !dbg !715

253:                                              ; preds = %monedge.then57
  %254 = load i64, ptr %26, align 8, !dbg !715
  br label %257, !dbg !715

255:                                              ; preds = %monedge.else58
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

273:                                              ; preds = %monedge.then49, %monedge.then47, %monedge.then45, %monedge.then43, %monedge.then41
  %274 = load i64, ptr %24, align 8, !dbg !727
  %275 = load i64, ptr %26, align 8, !dbg !729
  %276 = add nsw i64 %275, 1, !dbg !730
  %277 = call noalias nonnull ptr @xalignalloc(i64 noundef %274, i64 noundef %276) #13, !dbg !731
  store ptr %277, ptr %29, align 8, !dbg !732
  %278 = load i64, ptr %26, align 8, !dbg !735
  %279 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %278, i64 4), !dbg !735
  %280 = extractvalue { i64, i1 } %279, 1, !dbg !735
  %281 = extractvalue { i64, i1 } %279, 0, !dbg !735
  store i64 %281, ptr %31, align 8, !dbg !735
  call void @monitorAction(ptr @.str.105), !dbg !737
  br i1 %280, label %monedge.then59, label %monedge.else60, !dbg !737

282:                                              ; preds = %monedge.else60
  %283 = load i64, ptr %31, align 8, !dbg !738
  %284 = load i64, ptr %16, align 8, !dbg !738
  %285 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %283, i64 %284), !dbg !738
  %286 = extractvalue { i64, i1 } %285, 1, !dbg !738
  %287 = extractvalue { i64, i1 } %285, 0, !dbg !738
  store i64 %287, ptr %31, align 8, !dbg !738
  call void @monitorAction(ptr @.str.108), !dbg !739
  br i1 %286, label %monedge.then61, label %monedge.else62, !dbg !739

288:                                              ; preds = %monedge.else62
  %289 = load i64, ptr %31, align 8, !dbg !740
  %290 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %289, i64 19), !dbg !740
  %291 = extractvalue { i64, i1 } %290, 1, !dbg !740
  %292 = extractvalue { i64, i1 } %290, 0, !dbg !740
  store i64 %292, ptr %31, align 8, !dbg !740
  call void @monitorAction(ptr @.str.111), !dbg !741
  br i1 %291, label %monedge.then63, label %monedge.else64, !dbg !741

293:                                              ; preds = %monedge.then63, %monedge.then61, %monedge.then59
  call void @xalloc_die() #10, !dbg !742
  unreachable, !dbg !742

294:                                              ; preds = %monedge.else64
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
  %326 = load i8, ptr %25, align 1, !dbg !766
  %327 = trunc i8 %326 to i1, !dbg !766
  call void @monitorAction(ptr @.str.114), !dbg !768
  br i1 %327, label %monedge.then65, label %monedge.else66, !dbg !768

328:                                              ; preds = %monedge.else66
  %329 = load i32, ptr @input_desc, align 4, !dbg !769
  %330 = call i32 @"\01_close"(i32 noundef %329), !dbg !770
  %331 = icmp slt i32 %330, 0, !dbg !771
  call void @monitorAction(ptr @.str.117), !dbg !772
  br i1 %331, label %monedge.then67, label %monedge.else68, !dbg !772

332:                                              ; preds = %monedge.then67
  %333 = call ptr @__error(), !dbg !773
  %334 = load i32, ptr %333, align 4, !dbg !773
  %335 = load ptr, ptr @infile, align 8, !dbg !773
  %336 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %335), !dbg !773
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %334, ptr noundef @.str.26, ptr noundef %336) #11, !dbg !773
  store i8 0, ptr %23, align 1, !dbg !775
  br label %337, !dbg !776

337:                                              ; preds = %monedge.else68, %monedge.then65, %332
  br label %338, !dbg !777

338:                                              ; preds = %337, %131
  %339 = load i32, ptr %22, align 4, !dbg !778
  %340 = add nsw i32 %339, 1, !dbg !778
  store i32 %340, ptr %22, align 4, !dbg !778
  %341 = load i32, ptr %4, align 4, !dbg !779
  %342 = icmp slt i32 %340, %341, !dbg !780
  call void @monitorAction(ptr @.str.120), !dbg !777
  br i1 %342, label %monedge.then69, label %monedge.else70, !dbg !777

343:                                              ; preds = %monedge.else70
  %344 = load i8, ptr @pending_cr, align 1, !dbg !781
  %345 = trunc i8 %344 to i1, !dbg !781
  call void @monitorAction(ptr @.str.123), !dbg !783
  br i1 %345, label %monedge.then71, label %monedge.else72, !dbg !783

346:                                              ; preds = %monedge.then71
  %347 = call i64 @full_write(i32 noundef 1, ptr noundef @.str.28, i64 noundef 1), !dbg !784
  %348 = icmp ne i64 %347, 1, !dbg !787
  call void @monitorAction(ptr @.str.126), !dbg !788
  br i1 %348, label %monedge.then73, label %monedge.else74, !dbg !788

349:                                              ; preds = %monedge.then73
  call void @write_error(), !dbg !789
  br label %350, !dbg !789

350:                                              ; preds = %monedge.else74, %349
  br label %351, !dbg !790

351:                                              ; preds = %monedge.else72, %350
  %352 = load i8, ptr %6, align 1, !dbg !791
  %353 = trunc i8 %352 to i1, !dbg !791
  call void @monitorAction(ptr @.str.129), !dbg !793
  br i1 %353, label %monedge.then75, label %monedge.else76, !dbg !793

354:                                              ; preds = %monedge.then75
  %355 = call i32 @"\01_close"(i32 noundef 0), !dbg !794
  %356 = icmp slt i32 %355, 0, !dbg !795
  call void @monitorAction(ptr @.str.132), !dbg !796
  br i1 %356, label %monedge.then77, label %monedge.else78, !dbg !796

357:                                              ; preds = %monedge.then77
  %358 = call ptr @__error(), !dbg !797
  %359 = load i32, ptr %358, align 4, !dbg !797
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %359, ptr noundef @.str.29) #11, !dbg !797
  unreachable, !dbg !797

360:                                              ; preds = %monedge.else78, %monedge.else76
  %361 = load i8, ptr %23, align 1, !dbg !798
  %362 = trunc i8 %361 to i1, !dbg !798
  %363 = zext i1 %362 to i64, !dbg !798
  %364 = select i1 %362, i32 0, i32 1, !dbg !798
  ret i32 %364, !dbg !799

monedge.then:                                     ; preds = %38
  call void @monitorAction(ptr @.str.2.2)
  br label %43

monedge.else:                                     ; preds = %38
  call void @monitorAction(ptr @.str.3.3)
  br label %63

monedge.default:                                  ; preds = %43
  call void @monitorAction(ptr @.str.5.5)
  br label %61

monedge.case_98:                                  ; preds = %43
  call void @monitorAction(ptr @.str.6.6)
  br label %45

monedge.case_101:                                 ; preds = %43
  call void @monitorAction(ptr @.str.7.7)
  br label %46

monedge.case_110:                                 ; preds = %43
  call void @monitorAction(ptr @.str.8.8)
  br label %47

monedge.case_115:                                 ; preds = %43
  call void @monitorAction(ptr @.str.9.9)
  br label %48

monedge.case_116:                                 ; preds = %43
  call void @monitorAction(ptr @.str.10.10)
  br label %49

monedge.case_117:                                 ; preds = %43
  call void @monitorAction(ptr @.str.11.11)
  br label %50

monedge.case_118:                                 ; preds = %43
  call void @monitorAction(ptr @.str.12.12)
  br label %51

monedge.case_65:                                  ; preds = %43
  call void @monitorAction(ptr @.str.13.13)
  br label %52

monedge.case_69:                                  ; preds = %43
  call void @monitorAction(ptr @.str.14.14)
  br label %53

monedge.case_84:                                  ; preds = %43
  call void @monitorAction(ptr @.str.15.15)
  br label %54

monedge.case_-130:                                ; preds = %43
  call void @monitorAction(ptr @.str.16.16)
  br label %55

monedge.case_-131:                                ; preds = %43
  call void @monitorAction(ptr @.str.17.17)
  br label %56

monedge.then1:                                    ; preds = %63
  call void @monitorAction(ptr @.str.19.19)
  br label %66

monedge.else2:                                    ; preds = %63
  call void @monitorAction(ptr @.str.20.20)
  br label %69

monedge.then3:                                    ; preds = %69
  call void @monitorAction(ptr @.str.22.22)
  br label %73

monedge.else4:                                    ; preds = %69
  call void @monitorAction(ptr @.str.23.23)
  br label %78

monedge.then5:                                    ; preds = %78
  call void @monitorAction(ptr @.str.25.25)
  br label %98

monedge.else6:                                    ; preds = %78
  call void @monitorAction(ptr @.str.26.26)
  br label %89

monedge.then7:                                    ; preds = %89
  call void @monitorAction(ptr @.str.28.28)
  br label %98

monedge.else8:                                    ; preds = %89
  call void @monitorAction(ptr @.str.29.29)
  br label %92

monedge.then9:                                    ; preds = %92
  call void @monitorAction(ptr @.str.31.31)
  br label %98

monedge.else10:                                   ; preds = %92
  call void @monitorAction(ptr @.str.32.32)
  br label %95

monedge.then11:                                   ; preds = %102
  call void @monitorAction(ptr @.str.34.34)
  br label %106

monedge.else12:                                   ; preds = %102
  call void @monitorAction(ptr @.str.35.35)
  br label %112

monedge.then13:                                   ; preds = %112
  call void @monitorAction(ptr @.str.37.37)
  br label %119

monedge.else14:                                   ; preds = %112
  call void @monitorAction(ptr @.str.38.38)
  br label %125

monedge.then15:                                   ; preds = %119
  call void @monitorAction(ptr @.str.40.40)
  br label %123

monedge.else16:                                   ; preds = %119
  call void @monitorAction(ptr @.str.41.41)
  br label %124

monedge.then17:                                   ; preds = %125
  call void @monitorAction(ptr @.str.43.43)
  br label %131

monedge.else18:                                   ; preds = %125
  call void @monitorAction(ptr @.str.44.44)
  br label %136

monedge.then19:                                   ; preds = %137
  call void @monitorAction(ptr @.str.46.46)
  br label %141

monedge.else20:                                   ; preds = %137
  call void @monitorAction(ptr @.str.47.47)
  br label %146

monedge.then21:                                   ; preds = %146
  call void @monitorAction(ptr @.str.49)
  br label %208

monedge.else22:                                   ; preds = %146
  call void @monitorAction(ptr @.str.50)
  br label %154

monedge.then23:                                   ; preds = %154
  call void @monitorAction(ptr @.str.52)
  br label %208

monedge.else24:                                   ; preds = %154
  call void @monitorAction(ptr @.str.53)
  br label %160

monedge.then25:                                   ; preds = %160
  call void @monitorAction(ptr @.str.55)
  br label %163

monedge.else26:                                   ; preds = %160
  call void @monitorAction(ptr @.str.56)
  br label %208

monedge.then27:                                   ; preds = %163
  call void @monitorAction(ptr @.str.58)
  br label %168

monedge.else28:                                   ; preds = %163
  call void @monitorAction(ptr @.str.59)
  br label %208

monedge.then29:                                   ; preds = %168
  call void @monitorAction(ptr @.str.61)
  br label %173

monedge.else30:                                   ; preds = %168
  call void @monitorAction(ptr @.str.62)
  br label %208

monedge.then31:                                   ; preds = %173
  call void @monitorAction(ptr @.str.64)
  br label %176

monedge.else32:                                   ; preds = %173
  call void @monitorAction(ptr @.str.65)
  br label %178

monedge.then33:                                   ; preds = %178
  call void @monitorAction(ptr @.str.67)
  br label %181

monedge.else34:                                   ; preds = %178
  call void @monitorAction(ptr @.str.68)
  br label %185

monedge.then35:                                   ; preds = %185
  call void @monitorAction(ptr @.str.70)
  br label %201

monedge.else36:                                   ; preds = %185
  call void @monitorAction(ptr @.str.71)
  br label %190

monedge.then37:                                   ; preds = %190
  call void @monitorAction(ptr @.str.73)
  br label %195

monedge.else38:                                   ; preds = %190
  call void @monitorAction(ptr @.str.74)
  br label %200

monedge.then39:                                   ; preds = %201
  call void @monitorAction(ptr @.str.76)
  br label %204

monedge.else40:                                   ; preds = %201
  call void @monitorAction(ptr @.str.77)
  br label %207

monedge.then41:                                   ; preds = %208
  call void @monitorAction(ptr @.str.79)
  br label %273

monedge.else42:                                   ; preds = %208
  call void @monitorAction(ptr @.str.80)
  br label %211

monedge.then43:                                   ; preds = %211
  call void @monitorAction(ptr @.str.82)
  br label %273

monedge.else44:                                   ; preds = %211
  call void @monitorAction(ptr @.str.83)
  br label %214

monedge.then45:                                   ; preds = %214
  call void @monitorAction(ptr @.str.85)
  br label %273

monedge.else46:                                   ; preds = %214
  call void @monitorAction(ptr @.str.86)
  br label %217

monedge.then47:                                   ; preds = %217
  call void @monitorAction(ptr @.str.88)
  br label %273

monedge.else48:                                   ; preds = %217
  call void @monitorAction(ptr @.str.89)
  br label %220

monedge.then49:                                   ; preds = %220
  call void @monitorAction(ptr @.str.91)
  br label %273

monedge.else50:                                   ; preds = %220
  call void @monitorAction(ptr @.str.92)
  br label %223

monedge.then51:                                   ; preds = %223
  call void @monitorAction(ptr @.str.94)
  br label %226

monedge.else52:                                   ; preds = %223
  call void @monitorAction(ptr @.str.95)
  br label %234

monedge.then53:                                   ; preds = %226
  call void @monitorAction(ptr @.str.97)
  br label %232

monedge.else54:                                   ; preds = %226
  call void @monitorAction(ptr @.str.98)
  br label %234

monedge.then55:                                   ; preds = %235
  call void @monitorAction(ptr @.str.100)
  br label %239

monedge.else56:                                   ; preds = %235
  call void @monitorAction(ptr @.str.101)
  br label %249

monedge.then57:                                   ; preds = %249
  call void @monitorAction(ptr @.str.103)
  br label %253

monedge.else58:                                   ; preds = %249
  call void @monitorAction(ptr @.str.104)
  br label %255

monedge.then59:                                   ; preds = %273
  call void @monitorAction(ptr @.str.106)
  br label %293

monedge.else60:                                   ; preds = %273
  call void @monitorAction(ptr @.str.107)
  br label %282

monedge.then61:                                   ; preds = %282
  call void @monitorAction(ptr @.str.109)
  br label %293

monedge.else62:                                   ; preds = %282
  call void @monitorAction(ptr @.str.110)
  br label %288

monedge.then63:                                   ; preds = %288
  call void @monitorAction(ptr @.str.112)
  br label %293

monedge.else64:                                   ; preds = %288
  call void @monitorAction(ptr @.str.113)
  br label %294

monedge.then65:                                   ; preds = %325
  call void @monitorAction(ptr @.str.115)
  br label %337

monedge.else66:                                   ; preds = %325
  call void @monitorAction(ptr @.str.116)
  br label %328

monedge.then67:                                   ; preds = %328
  call void @monitorAction(ptr @.str.118)
  br label %332

monedge.else68:                                   ; preds = %328
  call void @monitorAction(ptr @.str.119)
  br label %337

monedge.then69:                                   ; preds = %338
  call void @monitorAction(ptr @.str.121)
  br label %102

monedge.else70:                                   ; preds = %338
  call void @monitorAction(ptr @.str.122)
  br label %343

monedge.then71:                                   ; preds = %343
  call void @monitorAction(ptr @.str.124)
  br label %346

monedge.else72:                                   ; preds = %343
  call void @monitorAction(ptr @.str.125)
  br label %351

monedge.then73:                                   ; preds = %346
  call void @monitorAction(ptr @.str.127)
  br label %349

monedge.else74:                                   ; preds = %346
  call void @monitorAction(ptr @.str.128)
  br label %350

monedge.then75:                                   ; preds = %351
  call void @monitorAction(ptr @.str.130)
  br label %354

monedge.else76:                                   ; preds = %351
  call void @monitorAction(ptr @.str.131)
  br label %360

monedge.then77:                                   ; preds = %354
  call void @monitorAction(ptr @.str.133)
  br label %357

monedge.else78:                                   ; preds = %354
  call void @monitorAction(ptr @.str.134)
  br label %360
}

declare void @set_program_name(ptr noundef) #1

declare ptr @setlocale(i32 noundef, ptr noundef) #1

declare i32 @atexit(ptr noundef) #1

declare void @close_stdout() #1

declare i32 @rpl_getopt_long(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare void @version_etc(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ...) #1

declare ptr @proper_name_lite(ptr noundef, ptr noundef) #1

declare i32 @rpl_fstat(i32 noundef, ptr noundef) #1

; Function Attrs: cold
declare void @error(i32 noundef, i32 noundef, ptr noundef, ...) #4

declare ptr @__error() #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal i64 @io_blksize(ptr noundef %0) #2 !dbg !800 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8, !dbg !809
  %7 = getelementptr inbounds %struct.stat, ptr %6, i32 0, i32 13, !dbg !809
  %8 = load i32, ptr %7, align 8, !dbg !809
  %9 = icmp slt i32 0, %8, !dbg !809
  br i1 %9, label %10, label %20, !dbg !809

10:                                               ; preds = %1
  %11 = load ptr, ptr %2, align 8, !dbg !809
  %12 = getelementptr inbounds %struct.stat, ptr %11, i32 0, i32 13, !dbg !809
  %13 = load i32, ptr %12, align 8, !dbg !809
  %14 = sext i32 %13 to i64, !dbg !809
  %15 = icmp ule i64 %14, 2305843009213693952, !dbg !809
  br i1 %15, label %16, label %20, !dbg !809

16:                                               ; preds = %10
  %17 = load ptr, ptr %2, align 8, !dbg !809
  %18 = getelementptr inbounds %struct.stat, ptr %17, i32 0, i32 13, !dbg !809
  %19 = load i32, ptr %18, align 8, !dbg !809
  br label %21, !dbg !809

20:                                               ; preds = %10, %1
  br label %21, !dbg !809

21:                                               ; preds = %20, %16
  %22 = phi i32 [ %19, %16 ], [ 512, %20 ], !dbg !809
  %23 = icmp sle i32 %22, 0, !dbg !810
  br i1 %23, label %24, label %25, !dbg !809

24:                                               ; preds = %21
  br label %43, !dbg !809

25:                                               ; preds = %21
  %26 = load ptr, ptr %2, align 8, !dbg !811
  %27 = getelementptr inbounds %struct.stat, ptr %26, i32 0, i32 13, !dbg !811
  %28 = load i32, ptr %27, align 8, !dbg !811
  %29 = icmp slt i32 0, %28, !dbg !811
  br i1 %29, label %30, label %40, !dbg !811

30:                                               ; preds = %25
  %31 = load ptr, ptr %2, align 8, !dbg !811
  %32 = getelementptr inbounds %struct.stat, ptr %31, i32 0, i32 13, !dbg !811
  %33 = load i32, ptr %32, align 8, !dbg !811
  %34 = sext i32 %33 to i64, !dbg !811
  %35 = icmp ule i64 %34, 2305843009213693952, !dbg !811
  br i1 %35, label %36, label %40, !dbg !811

36:                                               ; preds = %30
  %37 = load ptr, ptr %2, align 8, !dbg !811
  %38 = getelementptr inbounds %struct.stat, ptr %37, i32 0, i32 13, !dbg !811
  %39 = load i32, ptr %38, align 8, !dbg !811
  br label %41, !dbg !811

40:                                               ; preds = %30, %25
  br label %41, !dbg !811

41:                                               ; preds = %40, %36
  %42 = phi i32 [ %39, %36 ], [ 512, %40 ], !dbg !811
  br label %43, !dbg !809

43:                                               ; preds = %41, %24
  %44 = phi i32 [ 262144, %24 ], [ %42, %41 ], !dbg !809
  %45 = sext i32 %44 to i64, !dbg !809
  store i64 %45, ptr %3, align 8, !dbg !808
  %46 = load i64, ptr %3, align 8, !dbg !812
  %47 = srem i64 262143, %46, !dbg !813
  %48 = sub nsw i64 262143, %47, !dbg !814
  %49 = load i64, ptr %3, align 8, !dbg !815
  %50 = add nsw i64 %49, %48, !dbg !815
  store i64 %50, ptr %3, align 8, !dbg !815
  %51 = load ptr, ptr %2, align 8, !dbg !816
  %52 = getelementptr inbounds %struct.stat, ptr %51, i32 0, i32 1, !dbg !816
  %53 = load i16, ptr %52, align 4, !dbg !816
  %54 = zext i16 %53 to i32, !dbg !816
  %55 = and i32 %54, 61440, !dbg !816
  %56 = icmp eq i32 %55, 32768, !dbg !816
  br i1 %56, label %57, label %75, !dbg !818

57:                                               ; preds = %43
  %58 = load i64, ptr %3, align 8, !dbg !819
  %59 = load i64, ptr %3, align 8, !dbg !820
  %60 = sub nsw i64 %59, 1, !dbg !821
  %61 = and i64 %58, %60, !dbg !822
  %62 = icmp ne i64 %61, 0, !dbg !822
  br i1 %62, label %63, label %75, !dbg !823

63:                                               ; preds = %57
  %64 = load i64, ptr %3, align 8, !dbg !827
  %65 = call i32 @stdc_leading_zeros_ull(i64 noundef %64), !dbg !828
  store i32 %65, ptr %4, align 4, !dbg !826
  %66 = load i32, ptr %4, align 4, !dbg !833
  %67 = sub nsw i32 64, %66, !dbg !834
  %68 = zext i32 %67 to i64, !dbg !835
  %69 = shl i64 1, %68, !dbg !835
  store i64 %69, ptr %5, align 8, !dbg !832
  %70 = load i64, ptr %5, align 8, !dbg !836
  %71 = icmp ule i64 %70, 9223372036854775807, !dbg !838
  br i1 %71, label %72, label %74, !dbg !839

72:                                               ; preds = %63
  %73 = load i64, ptr %5, align 8, !dbg !840
  store i64 %73, ptr %3, align 8, !dbg !841
  br label %74, !dbg !842

74:                                               ; preds = %72, %63
  br label %75, !dbg !843

75:                                               ; preds = %74, %57, %43
  %76 = load i64, ptr %3, align 8, !dbg !844
  %77 = icmp ult i64 4611686018427387904, %76, !dbg !844
  br i1 %77, label %78, label %79, !dbg !844

78:                                               ; preds = %75
  br label %81, !dbg !844

79:                                               ; preds = %75
  %80 = load i64, ptr %3, align 8, !dbg !844
  br label %81, !dbg !844

81:                                               ; preds = %79, %78
  %82 = phi i64 [ 4611686018427387904, %78 ], [ %80, %79 ], !dbg !844
  ret i64 %82, !dbg !845
}

declare void @xset_binary_mode(i32 noundef, i32 noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare i32 @getpagesize() #5

declare i32 @strcmp(ptr noundef, ptr noundef) #1

declare i32 @rpl_open(ptr noundef, i32 noundef, ...) #1

declare ptr @quotearg_n_style_colon(i32 noundef, i32 noundef, ptr noundef) #1

declare void @fdadvise(i32 noundef, i64 noundef, i64 noundef, i32 noundef) #1

declare i32 @"\01_fcntl"(i32 noundef, i32 noundef, ...) #1

declare i64 @lseek(i32 noundef, i64 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal i32 @copy_cat() #2 !dbg !846 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  store i64 9223372035781033984, ptr %2, align 8, !dbg !853
  store i8 0, ptr %3, align 1, !dbg !856
  br label %4, !dbg !857

4:                                                ; preds = %47, %0
  %5 = load i32, ptr @input_desc, align 4, !dbg !858
  %6 = load i64, ptr %2, align 8, !dbg !860
  %7 = call i64 @copy_file_range(i32 noundef %5, ptr noundef null, i32 noundef 1, ptr noundef null, i64 noundef %6, i32 noundef 0), !dbg !861
  switch i64 %7, label %46 [
    i64 0, label %8
    i64 -1, label %12
  ], !dbg !862

8:                                                ; preds = %4
  %9 = load i8, ptr %3, align 1, !dbg !863
  %10 = trunc i8 %9 to i1, !dbg !863
  %11 = zext i1 %10 to i32, !dbg !863
  store i32 %11, ptr %1, align 4, !dbg !865
  br label %48, !dbg !865

12:                                               ; preds = %4
  %13 = call ptr @__error(), !dbg !866
  %14 = load i32, ptr %13, align 4, !dbg !866
  %15 = icmp eq i32 %14, 78, !dbg !868
  br i1 %15, label %40, label %16, !dbg !869

16:                                               ; preds = %12
  %17 = call ptr @__error(), !dbg !870
  %18 = load i32, ptr %17, align 4, !dbg !870
  %19 = call zeroext i1 @is_ENOTSUP(i32 noundef %18), !dbg !871
  br i1 %19, label %40, label %20, !dbg !872

20:                                               ; preds = %16
  %21 = call ptr @__error(), !dbg !873
  %22 = load i32, ptr %21, align 4, !dbg !873
  %23 = icmp eq i32 %22, 22, !dbg !874
  br i1 %23, label %40, label %24, !dbg !875

24:                                               ; preds = %20
  %25 = call ptr @__error(), !dbg !876
  %26 = load i32, ptr %25, align 4, !dbg !876
  %27 = icmp eq i32 %26, 9, !dbg !877
  br i1 %27, label %40, label %28, !dbg !878

28:                                               ; preds = %24
  %29 = call ptr @__error(), !dbg !879
  %30 = load i32, ptr %29, align 4, !dbg !879
  %31 = icmp eq i32 %30, 18, !dbg !880
  br i1 %31, label %40, label %32, !dbg !881

32:                                               ; preds = %28
  %33 = call ptr @__error(), !dbg !882
  %34 = load i32, ptr %33, align 4, !dbg !882
  %35 = icmp eq i32 %34, 26, !dbg !883
  br i1 %35, label %40, label %36, !dbg !884

36:                                               ; preds = %32
  %37 = call ptr @__error(), !dbg !885
  %38 = load i32, ptr %37, align 4, !dbg !885
  %39 = icmp eq i32 %38, 1, !dbg !886
  br i1 %39, label %40, label %41, !dbg !887

40:                                               ; preds = %36, %32, %28, %24, %20, %16, %12
  store i32 0, ptr %1, align 4, !dbg !888
  br label %48, !dbg !888

41:                                               ; preds = %36
  %42 = call ptr @__error(), !dbg !889
  %43 = load i32, ptr %42, align 4, !dbg !889
  %44 = load ptr, ptr @infile, align 8, !dbg !889
  %45 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %44), !dbg !889
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %43, ptr noundef @.str.26, ptr noundef %45) #11, !dbg !889
  store i32 -1, ptr %1, align 4, !dbg !890
  br label %48, !dbg !890

46:                                               ; preds = %4
  br label %47, !dbg !891

47:                                               ; preds = %46
  store i8 1, ptr %3, align 1, !dbg !892
  br label %4, !dbg !893, !llvm.loop !894

48:                                               ; preds = %41, %40, %8
  %49 = load i32, ptr %1, align 4, !dbg !897
  ret i32 %49, !dbg !897
}

; Function Attrs: allocsize(1)
declare noalias nonnull ptr @xalignalloc(i64 noundef, i64 noundef) #6

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal zeroext i1 @simple_cat(ptr noundef %0, i64 noundef %1) #2 !dbg !898 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  br label %7, !dbg !905

7:                                                ; preds = %30, %2
  %8 = load i32, ptr @input_desc, align 4, !dbg !909
  %9 = load ptr, ptr %4, align 8, !dbg !910
  %10 = load i64, ptr %5, align 8, !dbg !911
  %11 = call i64 @safe_read(i32 noundef %8, ptr noundef %9, i64 noundef %10), !dbg !912
  store i64 %11, ptr %6, align 8, !dbg !908
  %12 = load i64, ptr %6, align 8, !dbg !913
  %13 = icmp slt i64 %12, 0, !dbg !915
  br i1 %13, label %14, label %19, !dbg !916

14:                                               ; preds = %7
  %15 = call ptr @__error(), !dbg !917
  %16 = load i32, ptr %15, align 4, !dbg !917
  %17 = load ptr, ptr @infile, align 8, !dbg !917
  %18 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %17), !dbg !917
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %16, ptr noundef @.str.26, ptr noundef %18) #11, !dbg !917
  store i1 false, ptr %3, align 1, !dbg !919
  br label %31, !dbg !919

19:                                               ; preds = %7
  %20 = load i64, ptr %6, align 8, !dbg !920
  %21 = icmp eq i64 %20, 0, !dbg !922
  br i1 %21, label %22, label %23, !dbg !923

22:                                               ; preds = %19
  store i1 true, ptr %3, align 1, !dbg !924
  br label %31, !dbg !924

23:                                               ; preds = %19
  %24 = load ptr, ptr %4, align 8, !dbg !925
  %25 = load i64, ptr %6, align 8, !dbg !927
  %26 = call i64 @full_write(i32 noundef 1, ptr noundef %24, i64 noundef %25), !dbg !928
  %27 = load i64, ptr %6, align 8, !dbg !929
  %28 = icmp ne i64 %26, %27, !dbg !930
  br i1 %28, label %29, label %30, !dbg !931

29:                                               ; preds = %23
  call void @write_error(), !dbg !932
  br label %30, !dbg !932

30:                                               ; preds = %29, %23
  br label %7, !dbg !905, !llvm.loop !933

31:                                               ; preds = %22, %14
  %32 = load i1, ptr %3, align 1, !dbg !935
  ret i1 %32, !dbg !935
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #7

; Function Attrs: noreturn
declare void @xalloc_die() #3

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal zeroext i1 @cat(ptr noundef %0, i64 noundef %1, ptr noundef %2, i64 noundef %3, i1 noundef zeroext %4, i1 noundef zeroext %5, i1 noundef zeroext %6, i1 noundef zeroext %7, i1 noundef zeroext %8, i1 noundef zeroext %9) #2 !dbg !936 {
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
  store i64 %1, ptr %13, align 8
  store ptr %2, ptr %14, align 8
  store i64 %3, ptr %15, align 8
  %33 = zext i1 %4 to i8
  store i8 %33, ptr %16, align 1
  %34 = zext i1 %5 to i8
  store i8 %34, ptr %17, align 1
  %35 = zext i1 %6 to i8
  store i8 %35, ptr %18, align 1
  %36 = zext i1 %7 to i8
  store i8 %36, ptr %19, align 1
  %37 = zext i1 %8 to i8
  store i8 %37, ptr %20, align 1
  %38 = zext i1 %9 to i8
  store i8 %38, ptr %21, align 1
  %39 = load i32, ptr @newlines2, align 4, !dbg !964
  store i32 %39, ptr %23, align 4, !dbg !963
  store i8 1, ptr %24, align 1, !dbg !966
  %40 = load ptr, ptr %12, align 8, !dbg !969
  store ptr %40, ptr %25, align 8, !dbg !968
  %41 = load ptr, ptr %25, align 8, !dbg !972
  %42 = getelementptr inbounds i8, ptr %41, i64 1, !dbg !973
  store ptr %42, ptr %26, align 8, !dbg !971
  %43 = load ptr, ptr %14, align 8, !dbg !976
  store ptr %43, ptr %27, align 8, !dbg !975
  br label %44, !dbg !977

44:                                               ; preds = %378, %10
  br label %45, !dbg !978

45:                                               ; preds = %206, %44
  %46 = load ptr, ptr %14, align 8, !dbg !980
  %47 = load i64, ptr %15, align 8, !dbg !983
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !984
  %49 = load ptr, ptr %27, align 8, !dbg !985
  %50 = icmp ule ptr %48, %49, !dbg !986
  br i1 %50, label %51, label %83, !dbg !987

51:                                               ; preds = %45
  %52 = load ptr, ptr %14, align 8, !dbg !991
  store ptr %52, ptr %28, align 8, !dbg !990
  br label %53, !dbg !994

53:                                               ; preds = %69, %51
  %54 = load ptr, ptr %28, align 8, !dbg !995
  %55 = load i64, ptr %15, align 8, !dbg !998
  %56 = call i64 @full_write(i32 noundef 1, ptr noundef %54, i64 noundef %55), !dbg !999
  %57 = load i64, ptr %15, align 8, !dbg !1000
  %58 = icmp ne i64 %56, %57, !dbg !1001
  br i1 %58, label %59, label %60, !dbg !1002

59:                                               ; preds = %53
  call void @write_error(), !dbg !1003
  br label %60, !dbg !1003

60:                                               ; preds = %59, %53
  %61 = load i64, ptr %15, align 8, !dbg !1004
  %62 = load ptr, ptr %28, align 8, !dbg !1005
  %63 = getelementptr inbounds i8, ptr %62, i64 %61, !dbg !1005
  store ptr %63, ptr %28, align 8, !dbg !1005
  %64 = load ptr, ptr %27, align 8, !dbg !1006
  %65 = load ptr, ptr %28, align 8, !dbg !1007
  %66 = ptrtoint ptr %64 to i64, !dbg !1008
  %67 = ptrtoint ptr %65 to i64, !dbg !1008
  %68 = sub i64 %66, %67, !dbg !1008
  store i64 %68, ptr %29, align 8, !dbg !1009
  br label %69, !dbg !1010

69:                                               ; preds = %60
  %70 = load i64, ptr %15, align 8, !dbg !1011
  %71 = load i64, ptr %29, align 8, !dbg !1012
  %72 = icmp sle i64 %70, %71, !dbg !1013
  br i1 %72, label %53, label %73, !dbg !1010, !llvm.loop !1014

73:                                               ; preds = %69
  %74 = load ptr, ptr %14, align 8, !dbg !1016
  %75 = load ptr, ptr %28, align 8, !dbg !1016
  %76 = load i64, ptr %29, align 8, !dbg !1016
  %77 = load ptr, ptr %14, align 8, !dbg !1016
  %78 = call i64 @llvm.objectsize.i64.p0(ptr %77, i1 false, i1 true, i1 false), !dbg !1016
  %79 = call ptr @__memmove_chk(ptr noundef %74, ptr noundef %75, i64 noundef %76, i64 noundef %78) #14, !dbg !1016
  %80 = load ptr, ptr %14, align 8, !dbg !1017
  %81 = load i64, ptr %29, align 8, !dbg !1018
  %82 = getelementptr inbounds i8, ptr %80, i64 %81, !dbg !1019
  store ptr %82, ptr %27, align 8, !dbg !1020
  br label %83, !dbg !1021

83:                                               ; preds = %73, %45
  %84 = load ptr, ptr %26, align 8, !dbg !1022
  %85 = load ptr, ptr %25, align 8, !dbg !1024
  %86 = icmp ugt ptr %84, %85, !dbg !1025
  br i1 %86, label %87, label %157, !dbg !1026

87:                                               ; preds = %83
  store i8 0, ptr %30, align 1, !dbg !1029
  store i32 0, ptr %31, align 4, !dbg !1031
  %88 = load i8, ptr %24, align 1, !dbg !1032
  %89 = trunc i8 %88 to i1, !dbg !1032
  br i1 %89, label %90, label %122, !dbg !1034

90:                                               ; preds = %87
  %91 = load i32, ptr @input_desc, align 4, !dbg !1035
  %92 = call i32 (i32, i64, ...) @ioctl(i32 noundef %91, i64 noundef 1074030207, ptr noundef %31), !dbg !1036
  %93 = icmp slt i32 %92, 0, !dbg !1037
  br i1 %93, label %94, label %122, !dbg !1038

94:                                               ; preds = %90
  %95 = call ptr @__error(), !dbg !1039
  %96 = load i32, ptr %95, align 4, !dbg !1039
  %97 = icmp eq i32 %96, 102, !dbg !1042
  br i1 %97, label %114, label %98, !dbg !1043

98:                                               ; preds = %94
  %99 = call ptr @__error(), !dbg !1044
  %100 = load i32, ptr %99, align 4, !dbg !1044
  %101 = icmp eq i32 %100, 25, !dbg !1045
  br i1 %101, label %114, label %102, !dbg !1046

102:                                              ; preds = %98
  %103 = call ptr @__error(), !dbg !1047
  %104 = load i32, ptr %103, align 4, !dbg !1047
  %105 = icmp eq i32 %104, 22, !dbg !1048
  br i1 %105, label %114, label %106, !dbg !1049

106:                                              ; preds = %102
  %107 = call ptr @__error(), !dbg !1050
  %108 = load i32, ptr %107, align 4, !dbg !1050
  %109 = icmp eq i32 %108, 19, !dbg !1051
  br i1 %109, label %114, label %110, !dbg !1052

110:                                              ; preds = %106
  %111 = call ptr @__error(), !dbg !1053
  %112 = load i32, ptr %111, align 4, !dbg !1053
  %113 = icmp eq i32 %112, 78, !dbg !1054
  br i1 %113, label %114, label %115, !dbg !1055

114:                                              ; preds = %110, %106, %102, %98, %94
  store i8 0, ptr %24, align 1, !dbg !1056
  br label %121, !dbg !1057

115:                                              ; preds = %110
  %116 = call ptr @__error(), !dbg !1058
  %117 = load i32, ptr %116, align 4, !dbg !1058
  %118 = load ptr, ptr @infile, align 8, !dbg !1058
  %119 = call ptr @quotearg_style(i32 noundef 4, ptr noundef %118), !dbg !1058
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %117, ptr noundef @.str.47, ptr noundef %119) #11, !dbg !1058
  %120 = load i32, ptr %23, align 4, !dbg !1060
  store i32 %120, ptr @newlines2, align 4, !dbg !1061
  store i1 false, ptr %11, align 1, !dbg !1062
  br label %379, !dbg !1062

121:                                              ; preds = %114
  br label %122, !dbg !1063

122:                                              ; preds = %121, %90, %87
  %123 = load i32, ptr %31, align 4, !dbg !1064
  %124 = icmp ne i32 %123, 0, !dbg !1066
  br i1 %124, label %125, label %126, !dbg !1067

125:                                              ; preds = %122
  store i8 1, ptr %30, align 1, !dbg !1068
  br label %126, !dbg !1069

126:                                              ; preds = %125, %122
  %127 = load i8, ptr %30, align 1, !dbg !1070
  %128 = trunc i8 %127 to i1, !dbg !1070
  br i1 %128, label %131, label %129, !dbg !1072

129:                                              ; preds = %126
  %130 = load ptr, ptr %14, align 8, !dbg !1073
  call void @write_pending(ptr noundef %130, ptr noundef %27), !dbg !1074
  br label %131, !dbg !1074

131:                                              ; preds = %129, %126
  %132 = load i32, ptr @input_desc, align 4, !dbg !1077
  %133 = load ptr, ptr %12, align 8, !dbg !1078
  %134 = load i64, ptr %13, align 8, !dbg !1079
  %135 = call i64 @safe_read(i32 noundef %132, ptr noundef %133, i64 noundef %134), !dbg !1080
  store i64 %135, ptr %32, align 8, !dbg !1076
  %136 = load i64, ptr %32, align 8, !dbg !1081
  %137 = icmp slt i64 %136, 0, !dbg !1083
  br i1 %137, label %138, label %145, !dbg !1084

138:                                              ; preds = %131
  %139 = call ptr @__error(), !dbg !1085
  %140 = load i32, ptr %139, align 4, !dbg !1085
  %141 = load ptr, ptr @infile, align 8, !dbg !1085
  %142 = call ptr @quotearg_n_style_colon(i32 noundef 0, i32 noundef 3, ptr noundef %141), !dbg !1085
  call void (i32, i32, ptr, ...) @error(i32 noundef 0, i32 noundef %140, ptr noundef @.str.26, ptr noundef %142) #11, !dbg !1085
  %143 = load ptr, ptr %14, align 8, !dbg !1087
  call void @write_pending(ptr noundef %143, ptr noundef %27), !dbg !1088
  %144 = load i32, ptr %23, align 4, !dbg !1089
  store i32 %144, ptr @newlines2, align 4, !dbg !1090
  store i1 false, ptr %11, align 1, !dbg !1091
  br label %379, !dbg !1091

145:                                              ; preds = %131
  %146 = load i64, ptr %32, align 8, !dbg !1092
  %147 = icmp eq i64 %146, 0, !dbg !1094
  br i1 %147, label %148, label %151, !dbg !1095

148:                                              ; preds = %145
  %149 = load ptr, ptr %14, align 8, !dbg !1096
  call void @write_pending(ptr noundef %149, ptr noundef %27), !dbg !1098
  %150 = load i32, ptr %23, align 4, !dbg !1099
  store i32 %150, ptr @newlines2, align 4, !dbg !1100
  store i1 true, ptr %11, align 1, !dbg !1101
  br label %379, !dbg !1101

151:                                              ; preds = %145
  %152 = load ptr, ptr %12, align 8, !dbg !1102
  store ptr %152, ptr %26, align 8, !dbg !1103
  %153 = load ptr, ptr %26, align 8, !dbg !1104
  %154 = load i64, ptr %32, align 8, !dbg !1105
  %155 = getelementptr inbounds i8, ptr %153, i64 %154, !dbg !1106
  store ptr %155, ptr %25, align 8, !dbg !1107
  %156 = load ptr, ptr %25, align 8, !dbg !1108
  store i8 10, ptr %156, align 1, !dbg !1109
  br label %202, !dbg !1110

157:                                              ; preds = %83
  %158 = load i32, ptr %23, align 4, !dbg !1111
  %159 = add nsw i32 %158, 1, !dbg !1111
  store i32 %159, ptr %23, align 4, !dbg !1111
  %160 = icmp sgt i32 %159, 0, !dbg !1114
  br i1 %160, label %161, label %185, !dbg !1115

161:                                              ; preds = %157
  %162 = load i32, ptr %23, align 4, !dbg !1116
  %163 = icmp sge i32 %162, 2, !dbg !1119
  br i1 %163, label %164, label %172, !dbg !1120

164:                                              ; preds = %161
  store i32 2, ptr %23, align 4, !dbg !1121
  %165 = load i8, ptr %21, align 1, !dbg !1123
  %166 = trunc i8 %165 to i1, !dbg !1123
  br i1 %166, label %167, label %171, !dbg !1125

167:                                              ; preds = %164
  %168 = load ptr, ptr %26, align 8, !dbg !1126
  %169 = getelementptr inbounds i8, ptr %168, i32 1, !dbg !1126
  store ptr %169, ptr %26, align 8, !dbg !1126
  %170 = load i8, ptr %168, align 1, !dbg !1128
  store i8 %170, ptr %22, align 1, !dbg !1129
  br label %206, !dbg !1130

171:                                              ; preds = %164
  br label %172, !dbg !1131

172:                                              ; preds = %171, %161
  %173 = load i8, ptr %18, align 1, !dbg !1132
  %174 = trunc i8 %173 to i1, !dbg !1132
  br i1 %174, label %175, label %184, !dbg !1134

175:                                              ; preds = %172
  %176 = load i8, ptr %19, align 1, !dbg !1135
  %177 = trunc i8 %176 to i1, !dbg !1135
  br i1 %177, label %184, label %178, !dbg !1136

178:                                              ; preds = %175
  call void @next_line_num(), !dbg !1137
  %179 = load ptr, ptr %27, align 8, !dbg !1139
  %180 = load ptr, ptr @line_num_print, align 8, !dbg !1139
  %181 = load ptr, ptr %27, align 8, !dbg !1139
  %182 = call i64 @llvm.objectsize.i64.p0(ptr %181, i1 false, i1 true, i1 false), !dbg !1139
  %183 = call ptr @__stpcpy_chk(ptr noundef %179, ptr noundef %180, i64 noundef %182) #14, !dbg !1139
  store ptr %183, ptr %27, align 8, !dbg !1140
  br label %184, !dbg !1141

184:                                              ; preds = %178, %175, %172
  br label %185, !dbg !1142

185:                                              ; preds = %184, %157
  %186 = load i8, ptr %20, align 1, !dbg !1143
  %187 = trunc i8 %186 to i1, !dbg !1143
  br i1 %187, label %188, label %199, !dbg !1145

188:                                              ; preds = %185
  %189 = load i8, ptr @pending_cr, align 1, !dbg !1146
  %190 = trunc i8 %189 to i1, !dbg !1146
  br i1 %190, label %191, label %196, !dbg !1149

191:                                              ; preds = %188
  %192 = load ptr, ptr %27, align 8, !dbg !1150
  %193 = getelementptr inbounds i8, ptr %192, i32 1, !dbg !1150
  store ptr %193, ptr %27, align 8, !dbg !1150
  store i8 94, ptr %192, align 1, !dbg !1152
  %194 = load ptr, ptr %27, align 8, !dbg !1153
  %195 = getelementptr inbounds i8, ptr %194, i32 1, !dbg !1153
  store ptr %195, ptr %27, align 8, !dbg !1153
  store i8 77, ptr %194, align 1, !dbg !1154
  store i8 0, ptr @pending_cr, align 1, !dbg !1155
  br label %196, !dbg !1156

196:                                              ; preds = %191, %188
  %197 = load ptr, ptr %27, align 8, !dbg !1157
  %198 = getelementptr inbounds i8, ptr %197, i32 1, !dbg !1157
  store ptr %198, ptr %27, align 8, !dbg !1157
  store i8 36, ptr %197, align 1, !dbg !1158
  br label %199, !dbg !1159

199:                                              ; preds = %196, %185
  %200 = load ptr, ptr %27, align 8, !dbg !1160
  %201 = getelementptr inbounds i8, ptr %200, i32 1, !dbg !1160
  store ptr %201, ptr %27, align 8, !dbg !1160
  store i8 10, ptr %200, align 1, !dbg !1161
  br label %202

202:                                              ; preds = %199, %151
  %203 = load ptr, ptr %26, align 8, !dbg !1162
  %204 = getelementptr inbounds i8, ptr %203, i32 1, !dbg !1162
  store ptr %204, ptr %26, align 8, !dbg !1162
  %205 = load i8, ptr %203, align 1, !dbg !1163
  store i8 %205, ptr %22, align 1, !dbg !1164
  br label %206, !dbg !1165

206:                                              ; preds = %202, %167
  %207 = load i8, ptr %22, align 1, !dbg !1166
  %208 = zext i8 %207 to i32, !dbg !1166
  %209 = icmp eq i32 %208, 10, !dbg !1167
  br i1 %209, label %45, label %210, !dbg !1165, !llvm.loop !1168

210:                                              ; preds = %206
  %211 = load i8, ptr @pending_cr, align 1, !dbg !1170
  %212 = trunc i8 %211 to i1, !dbg !1170
  br i1 %212, label %213, label %216, !dbg !1172

213:                                              ; preds = %210
  %214 = load ptr, ptr %27, align 8, !dbg !1173
  %215 = getelementptr inbounds i8, ptr %214, i32 1, !dbg !1173
  store ptr %215, ptr %27, align 8, !dbg !1173
  store i8 13, ptr %214, align 1, !dbg !1175
  store i8 0, ptr @pending_cr, align 1, !dbg !1176
  br label %216, !dbg !1177

216:                                              ; preds = %213, %210
  %217 = load i32, ptr %23, align 4, !dbg !1178
  %218 = icmp sge i32 %217, 0, !dbg !1180
  br i1 %218, label %219, label %228, !dbg !1181

219:                                              ; preds = %216
  %220 = load i8, ptr %18, align 1, !dbg !1182
  %221 = trunc i8 %220 to i1, !dbg !1182
  br i1 %221, label %222, label %228, !dbg !1183

222:                                              ; preds = %219
  call void @next_line_num(), !dbg !1184
  %223 = load ptr, ptr %27, align 8, !dbg !1186
  %224 = load ptr, ptr @line_num_print, align 8, !dbg !1186
  %225 = load ptr, ptr %27, align 8, !dbg !1186
  %226 = call i64 @llvm.objectsize.i64.p0(ptr %225, i1 false, i1 true, i1 false), !dbg !1186
  %227 = call ptr @__stpcpy_chk(ptr noundef %223, ptr noundef %224, i64 noundef %226) #14, !dbg !1186
  store ptr %227, ptr %27, align 8, !dbg !1187
  br label %228, !dbg !1188

228:                                              ; preds = %222, %219, %216
  %229 = load i8, ptr %16, align 1, !dbg !1189
  %230 = trunc i8 %229 to i1, !dbg !1189
  br i1 %230, label %231, label %322, !dbg !1191

231:                                              ; preds = %228
  br label %232, !dbg !1192

232:                                              ; preds = %317, %231
  %233 = load i8, ptr %22, align 1, !dbg !1194
  %234 = zext i8 %233 to i32, !dbg !1194
  %235 = icmp sge i32 %234, 32, !dbg !1197
  br i1 %235, label %236, label %291, !dbg !1198

236:                                              ; preds = %232
  %237 = load i8, ptr %22, align 1, !dbg !1199
  %238 = zext i8 %237 to i32, !dbg !1199
  %239 = icmp slt i32 %238, 127, !dbg !1202
  br i1 %239, label %240, label %244, !dbg !1203

240:                                              ; preds = %236
  %241 = load i8, ptr %22, align 1, !dbg !1204
  %242 = load ptr, ptr %27, align 8, !dbg !1205
  %243 = getelementptr inbounds i8, ptr %242, i32 1, !dbg !1205
  store ptr %243, ptr %27, align 8, !dbg !1205
  store i8 %241, ptr %242, align 1, !dbg !1206
  br label %290, !dbg !1207

244:                                              ; preds = %236
  %245 = load i8, ptr %22, align 1, !dbg !1208
  %246 = zext i8 %245 to i32, !dbg !1208
  %247 = icmp eq i32 %246, 127, !dbg !1210
  br i1 %247, label %248, label %253, !dbg !1211

248:                                              ; preds = %244
  %249 = load ptr, ptr %27, align 8, !dbg !1212
  %250 = getelementptr inbounds i8, ptr %249, i32 1, !dbg !1212
  store ptr %250, ptr %27, align 8, !dbg !1212
  store i8 94, ptr %249, align 1, !dbg !1214
  %251 = load ptr, ptr %27, align 8, !dbg !1215
  %252 = getelementptr inbounds i8, ptr %251, i32 1, !dbg !1215
  store ptr %252, ptr %27, align 8, !dbg !1215
  store i8 63, ptr %251, align 1, !dbg !1216
  br label %289, !dbg !1217

253:                                              ; preds = %244
  %254 = load ptr, ptr %27, align 8, !dbg !1218
  %255 = getelementptr inbounds i8, ptr %254, i32 1, !dbg !1218
  store ptr %255, ptr %27, align 8, !dbg !1218
  store i8 77, ptr %254, align 1, !dbg !1220
  %256 = load ptr, ptr %27, align 8, !dbg !1221
  %257 = getelementptr inbounds i8, ptr %256, i32 1, !dbg !1221
  store ptr %257, ptr %27, align 8, !dbg !1221
  store i8 45, ptr %256, align 1, !dbg !1222
  %258 = load i8, ptr %22, align 1, !dbg !1223
  %259 = zext i8 %258 to i32, !dbg !1223
  %260 = icmp sge i32 %259, 160, !dbg !1225
  br i1 %260, label %261, label %278, !dbg !1226

261:                                              ; preds = %253
  %262 = load i8, ptr %22, align 1, !dbg !1227
  %263 = zext i8 %262 to i32, !dbg !1227
  %264 = icmp slt i32 %263, 255, !dbg !1230
  br i1 %264, label %265, label %272, !dbg !1231

265:                                              ; preds = %261
  %266 = load i8, ptr %22, align 1, !dbg !1232
  %267 = zext i8 %266 to i32, !dbg !1232
  %268 = sub nsw i32 %267, 128, !dbg !1233
  %269 = trunc i32 %268 to i8, !dbg !1232
  %270 = load ptr, ptr %27, align 8, !dbg !1234
  %271 = getelementptr inbounds i8, ptr %270, i32 1, !dbg !1234
  store ptr %271, ptr %27, align 8, !dbg !1234
  store i8 %269, ptr %270, align 1, !dbg !1235
  br label %277, !dbg !1236

272:                                              ; preds = %261
  %273 = load ptr, ptr %27, align 8, !dbg !1237
  %274 = getelementptr inbounds i8, ptr %273, i32 1, !dbg !1237
  store ptr %274, ptr %27, align 8, !dbg !1237
  store i8 94, ptr %273, align 1, !dbg !1239
  %275 = load ptr, ptr %27, align 8, !dbg !1240
  %276 = getelementptr inbounds i8, ptr %275, i32 1, !dbg !1240
  store ptr %276, ptr %27, align 8, !dbg !1240
  store i8 63, ptr %275, align 1, !dbg !1241
  br label %277

277:                                              ; preds = %272, %265
  br label %288, !dbg !1242

278:                                              ; preds = %253
  %279 = load ptr, ptr %27, align 8, !dbg !1243
  %280 = getelementptr inbounds i8, ptr %279, i32 1, !dbg !1243
  store ptr %280, ptr %27, align 8, !dbg !1243
  store i8 94, ptr %279, align 1, !dbg !1245
  %281 = load i8, ptr %22, align 1, !dbg !1246
  %282 = zext i8 %281 to i32, !dbg !1246
  %283 = sub nsw i32 %282, 128, !dbg !1247
  %284 = add nsw i32 %283, 64, !dbg !1248
  %285 = trunc i32 %284 to i8, !dbg !1246
  %286 = load ptr, ptr %27, align 8, !dbg !1249
  %287 = getelementptr inbounds i8, ptr %286, i32 1, !dbg !1249
  store ptr %287, ptr %27, align 8, !dbg !1249
  store i8 %285, ptr %286, align 1, !dbg !1250
  br label %288

288:                                              ; preds = %278, %277
  br label %289

289:                                              ; preds = %288, %248
  br label %290

290:                                              ; preds = %289, %240
  br label %317, !dbg !1251

291:                                              ; preds = %232
  %292 = load i8, ptr %22, align 1, !dbg !1252
  %293 = zext i8 %292 to i32, !dbg !1252
  %294 = icmp eq i32 %293, 9, !dbg !1254
  br i1 %294, label %295, label %301, !dbg !1255

295:                                              ; preds = %291
  %296 = load i8, ptr %17, align 1, !dbg !1256
  %297 = trunc i8 %296 to i1, !dbg !1256
  br i1 %297, label %301, label %298, !dbg !1257

298:                                              ; preds = %295
  %299 = load ptr, ptr %27, align 8, !dbg !1258
  %300 = getelementptr inbounds i8, ptr %299, i32 1, !dbg !1258
  store ptr %300, ptr %27, align 8, !dbg !1258
  store i8 9, ptr %299, align 1, !dbg !1259
  br label %316, !dbg !1260

301:                                              ; preds = %295, %291
  %302 = load i8, ptr %22, align 1, !dbg !1261
  %303 = zext i8 %302 to i32, !dbg !1261
  %304 = icmp eq i32 %303, 10, !dbg !1263
  br i1 %304, label %305, label %306, !dbg !1264

305:                                              ; preds = %301
  store i32 -1, ptr %23, align 4, !dbg !1265
  br label %321, !dbg !1267

306:                                              ; preds = %301
  %307 = load ptr, ptr %27, align 8, !dbg !1268
  %308 = getelementptr inbounds i8, ptr %307, i32 1, !dbg !1268
  store ptr %308, ptr %27, align 8, !dbg !1268
  store i8 94, ptr %307, align 1, !dbg !1270
  %309 = load i8, ptr %22, align 1, !dbg !1271
  %310 = zext i8 %309 to i32, !dbg !1271
  %311 = add nsw i32 %310, 64, !dbg !1272
  %312 = trunc i32 %311 to i8, !dbg !1271
  %313 = load ptr, ptr %27, align 8, !dbg !1273
  %314 = getelementptr inbounds i8, ptr %313, i32 1, !dbg !1273
  store ptr %314, ptr %27, align 8, !dbg !1273
  store i8 %312, ptr %313, align 1, !dbg !1274
  br label %315

315:                                              ; preds = %306
  br label %316

316:                                              ; preds = %315, %298
  br label %317

317:                                              ; preds = %316, %290
  %318 = load ptr, ptr %26, align 8, !dbg !1275
  %319 = getelementptr inbounds i8, ptr %318, i32 1, !dbg !1275
  store ptr %319, ptr %26, align 8, !dbg !1275
  %320 = load i8, ptr %318, align 1, !dbg !1276
  store i8 %320, ptr %22, align 1, !dbg !1277
  br label %232, !dbg !1192, !llvm.loop !1278

321:                                              ; preds = %305
  br label %378, !dbg !1280

322:                                              ; preds = %228
  br label %323, !dbg !1281

323:                                              ; preds = %373, %322
  %324 = load i8, ptr %22, align 1, !dbg !1283
  %325 = zext i8 %324 to i32, !dbg !1283
  %326 = icmp eq i32 %325, 9, !dbg !1286
  br i1 %326, label %327, label %339, !dbg !1287

327:                                              ; preds = %323
  %328 = load i8, ptr %17, align 1, !dbg !1288
  %329 = trunc i8 %328 to i1, !dbg !1288
  br i1 %329, label %330, label %339, !dbg !1289

330:                                              ; preds = %327
  %331 = load ptr, ptr %27, align 8, !dbg !1290
  %332 = getelementptr inbounds i8, ptr %331, i32 1, !dbg !1290
  store ptr %332, ptr %27, align 8, !dbg !1290
  store i8 94, ptr %331, align 1, !dbg !1292
  %333 = load i8, ptr %22, align 1, !dbg !1293
  %334 = zext i8 %333 to i32, !dbg !1293
  %335 = add nsw i32 %334, 64, !dbg !1294
  %336 = trunc i32 %335 to i8, !dbg !1293
  %337 = load ptr, ptr %27, align 8, !dbg !1295
  %338 = getelementptr inbounds i8, ptr %337, i32 1, !dbg !1295
  store ptr %338, ptr %27, align 8, !dbg !1295
  store i8 %336, ptr %337, align 1, !dbg !1296
  br label %373, !dbg !1297

339:                                              ; preds = %327, %323
  %340 = load i8, ptr %22, align 1, !dbg !1298
  %341 = zext i8 %340 to i32, !dbg !1298
  %342 = icmp ne i32 %341, 10, !dbg !1300
  br i1 %342, label %343, label %371, !dbg !1301

343:                                              ; preds = %339
  %344 = load i8, ptr %22, align 1, !dbg !1302
  %345 = zext i8 %344 to i32, !dbg !1302
  %346 = icmp eq i32 %345, 13, !dbg !1305
  br i1 %346, label %347, label %366, !dbg !1306

347:                                              ; preds = %343
  %348 = load ptr, ptr %26, align 8, !dbg !1307
  %349 = load i8, ptr %348, align 1, !dbg !1308
  %350 = sext i8 %349 to i32, !dbg !1308
  %351 = icmp eq i32 %350, 10, !dbg !1309
  br i1 %351, label %352, label %366, !dbg !1310

352:                                              ; preds = %347
  %353 = load i8, ptr %20, align 1, !dbg !1311
  %354 = trunc i8 %353 to i1, !dbg !1311
  br i1 %354, label %355, label %366, !dbg !1312

355:                                              ; preds = %352
  %356 = load ptr, ptr %26, align 8, !dbg !1313
  %357 = load ptr, ptr %25, align 8, !dbg !1316
  %358 = icmp eq ptr %356, %357, !dbg !1317
  br i1 %358, label %359, label %360, !dbg !1318

359:                                              ; preds = %355
  store i8 1, ptr @pending_cr, align 1, !dbg !1319
  br label %365, !dbg !1320

360:                                              ; preds = %355
  %361 = load ptr, ptr %27, align 8, !dbg !1321
  %362 = getelementptr inbounds i8, ptr %361, i32 1, !dbg !1321
  store ptr %362, ptr %27, align 8, !dbg !1321
  store i8 94, ptr %361, align 1, !dbg !1323
  %363 = load ptr, ptr %27, align 8, !dbg !1324
  %364 = getelementptr inbounds i8, ptr %363, i32 1, !dbg !1324
  store ptr %364, ptr %27, align 8, !dbg !1324
  store i8 77, ptr %363, align 1, !dbg !1325
  br label %365

365:                                              ; preds = %360, %359
  br label %370, !dbg !1326

366:                                              ; preds = %352, %347, %343
  %367 = load i8, ptr %22, align 1, !dbg !1327
  %368 = load ptr, ptr %27, align 8, !dbg !1328
  %369 = getelementptr inbounds i8, ptr %368, i32 1, !dbg !1328
  store ptr %369, ptr %27, align 8, !dbg !1328
  store i8 %367, ptr %368, align 1, !dbg !1329
  br label %370

370:                                              ; preds = %366, %365
  br label %372, !dbg !1330

371:                                              ; preds = %339
  store i32 -1, ptr %23, align 4, !dbg !1331
  br label %377, !dbg !1333

372:                                              ; preds = %370
  br label %373

373:                                              ; preds = %372, %330
  %374 = load ptr, ptr %26, align 8, !dbg !1334
  %375 = getelementptr inbounds i8, ptr %374, i32 1, !dbg !1334
  store ptr %375, ptr %26, align 8, !dbg !1334
  %376 = load i8, ptr %374, align 1, !dbg !1335
  store i8 %376, ptr %22, align 1, !dbg !1336
  br label %323, !dbg !1281, !llvm.loop !1337

377:                                              ; preds = %371
  br label %378

378:                                              ; preds = %377, %321
  br label %44, !dbg !977, !llvm.loop !1339

379:                                              ; preds = %148, %138, %115
  %380 = load i1, ptr %11, align 1, !dbg !1341
  ret i1 %380, !dbg !1341
}

declare void @alignfree(ptr noundef) #1

declare i32 @"\01_close"(i32 noundef) #1

declare i64 @full_write(i32 noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @write_error() #2 !dbg !1342 {
  %1 = alloca i32, align 4
  %2 = call ptr @__error(), !dbg !1345
  %3 = load i32, ptr %2, align 4, !dbg !1345
  store i32 %3, ptr %1, align 4, !dbg !1344
  %4 = load ptr, ptr @__stdoutp, align 8, !dbg !1346
  %5 = call i32 @rpl_fflush(ptr noundef %4), !dbg !1347
  %6 = load ptr, ptr @__stdoutp, align 8, !dbg !1348
  %7 = call i32 @rpl_fpurge(ptr noundef %6), !dbg !1349
  %8 = load ptr, ptr @__stdoutp, align 8, !dbg !1350
  %9 = getelementptr inbounds %struct.__sFILE, ptr %8, i32 0, i32 3, !dbg !1350
  %10 = load i16, ptr %9, align 8, !dbg !1350
  %11 = sext i16 %10 to i32, !dbg !1350
  %12 = and i32 %11, -97, !dbg !1350
  %13 = trunc i32 %12 to i16, !dbg !1350
  store i16 %13, ptr %9, align 8, !dbg !1350
  %14 = load i32, ptr %1, align 4, !dbg !1351
  call void (i32, i32, ptr, ...) @error(i32 noundef 1, i32 noundef %14, ptr noundef @.str.48) #11, !dbg !1351
  unreachable, !dbg !1351
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly, ptr noalias readonly, i64, i1 immarg) #8

declare void @emit_bug_reporting_address() #1

declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #1

declare i32 @stdc_leading_zeros_ull(i64 noundef) #1

declare i64 @copy_file_range(i32 noundef, ptr noundef, i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal zeroext i1 @is_ENOTSUP(i32 noundef %0) #2 !dbg !1352 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4, !dbg !1357
  %4 = icmp eq i32 %3, 102, !dbg !1358
  br i1 %4, label %8, label %5, !dbg !1359

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4, !dbg !1360
  %7 = icmp eq i32 %6, 45, !dbg !1361
  br label %8, !dbg !1359

8:                                                ; preds = %5, %1
  %9 = phi i1 [ true, %1 ], [ %7, %5 ]
  ret i1 %9, !dbg !1362
}

declare i64 @safe_read(i32 noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nounwind
declare ptr @__memmove_chk(ptr noundef, ptr noundef, i64 noundef, i64 noundef) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #7

declare i32 @ioctl(i32 noundef, i64 noundef, ...) #1

declare ptr @quotearg_style(i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @write_pending(ptr noundef %0, ptr noundef %1) #2 !dbg !1363 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8, !dbg !1372
  %7 = load ptr, ptr %6, align 8, !dbg !1373
  %8 = load ptr, ptr %3, align 8, !dbg !1374
  %9 = ptrtoint ptr %7 to i64, !dbg !1375
  %10 = ptrtoint ptr %8 to i64, !dbg !1375
  %11 = sub i64 %9, %10, !dbg !1375
  store i64 %11, ptr %5, align 8, !dbg !1371
  %12 = load i64, ptr %5, align 8, !dbg !1376
  %13 = icmp slt i64 0, %12, !dbg !1378
  br i1 %13, label %14, label %24, !dbg !1379

14:                                               ; preds = %2
  %15 = load ptr, ptr %3, align 8, !dbg !1380
  %16 = load i64, ptr %5, align 8, !dbg !1383
  %17 = call i64 @full_write(i32 noundef 1, ptr noundef %15, i64 noundef %16), !dbg !1384
  %18 = load i64, ptr %5, align 8, !dbg !1385
  %19 = icmp ne i64 %17, %18, !dbg !1386
  br i1 %19, label %20, label %21, !dbg !1387

20:                                               ; preds = %14
  call void @write_error(), !dbg !1388
  br label %21, !dbg !1388

21:                                               ; preds = %20, %14
  %22 = load ptr, ptr %3, align 8, !dbg !1389
  %23 = load ptr, ptr %4, align 8, !dbg !1390
  store ptr %22, ptr %23, align 8, !dbg !1391
  br label %24, !dbg !1392

24:                                               ; preds = %21, %2
  ret void, !dbg !1393
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define internal void @next_line_num() #2 !dbg !1394 {
  %1 = alloca ptr, align 8
  %2 = load ptr, ptr @line_num_end, align 8, !dbg !1397
  store ptr %2, ptr %1, align 8, !dbg !1396
  br label %3, !dbg !1398

3:                                                ; preds = %13, %0
  %4 = load ptr, ptr %1, align 8, !dbg !1399
  %5 = load i8, ptr %4, align 1, !dbg !1402
  %6 = add i8 %5, 1, !dbg !1402
  store i8 %6, ptr %4, align 1, !dbg !1402
  %7 = sext i8 %5 to i32, !dbg !1403
  %8 = icmp slt i32 %7, 57, !dbg !1404
  br i1 %8, label %9, label %10, !dbg !1405

9:                                                ; preds = %3
  br label %31, !dbg !1406

10:                                               ; preds = %3
  %11 = load ptr, ptr %1, align 8, !dbg !1407
  %12 = getelementptr inbounds i8, ptr %11, i32 -1, !dbg !1407
  store ptr %12, ptr %1, align 8, !dbg !1407
  store i8 48, ptr %11, align 1, !dbg !1408
  br label %13, !dbg !1409

13:                                               ; preds = %10
  %14 = load ptr, ptr %1, align 8, !dbg !1410
  %15 = load ptr, ptr @line_num_start, align 8, !dbg !1411
  %16 = icmp uge ptr %14, %15, !dbg !1412
  br i1 %16, label %3, label %17, !dbg !1409, !llvm.loop !1413

17:                                               ; preds = %13
  %18 = load ptr, ptr @line_num_start, align 8, !dbg !1415
  %19 = icmp ugt ptr %18, @line_buf, !dbg !1417
  br i1 %19, label %20, label %23, !dbg !1418

20:                                               ; preds = %17
  %21 = load ptr, ptr @line_num_start, align 8, !dbg !1419
  %22 = getelementptr inbounds i8, ptr %21, i32 -1, !dbg !1419
  store ptr %22, ptr @line_num_start, align 8, !dbg !1419
  store i8 49, ptr %22, align 1, !dbg !1420
  br label %24, !dbg !1421

23:                                               ; preds = %17
  store i8 62, ptr @line_buf, align 1, !dbg !1422
  br label %24

24:                                               ; preds = %23, %20
  %25 = load ptr, ptr @line_num_start, align 8, !dbg !1423
  %26 = load ptr, ptr @line_num_print, align 8, !dbg !1425
  %27 = icmp ult ptr %25, %26, !dbg !1426
  br i1 %27, label %28, label %31, !dbg !1427

28:                                               ; preds = %24
  %29 = load ptr, ptr @line_num_print, align 8, !dbg !1428
  %30 = getelementptr inbounds i8, ptr %29, i32 -1, !dbg !1428
  store ptr %30, ptr @line_num_print, align 8, !dbg !1428
  br label %31, !dbg !1429

31:                                               ; preds = %28, %24, %9
  ret void, !dbg !1430
}

; Function Attrs: nounwind
declare ptr @__stpcpy_chk(ptr noundef, ptr noundef, i64 noundef) #9

declare i32 @rpl_fflush(ptr noundef) #1

declare i32 @rpl_fpurge(ptr noundef) #1

declare void @monitorAction(ptr)

declare void @initAutomaton(ptr, i32, ptr)

declare void @setMonitorPolicy(ptr)

define internal void @automaton.init() {
entry:
  call void @setMonitorPolicy(ptr @0)
  call void @initAutomaton(ptr @automatonArray, i32 66, ptr @1)
  ret void
}

attributes #0 = { noinline noreturn nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { cold "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #6 = { allocsize(1) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
!781 = !DILocation(line: 803, column: 10, scope: !782)
!782 = distinct !DILexicalBlock(scope: !46, file: !2, line: 803, column: 10)
!783 = !DILocation(line: 803, column: 10, scope: !46)
!784 = !DILocation(line: 805, column: 14, scope: !785)
!785 = distinct !DILexicalBlock(scope: !786, file: !2, line: 805, column: 14)
!786 = distinct !DILexicalBlock(scope: !782, file: !2, line: 804, column: 8)
!787 = !DILocation(line: 805, column: 50, scope: !785)
!788 = !DILocation(line: 805, column: 14, scope: !786)
!789 = !DILocation(line: 806, column: 12, scope: !785)
!790 = !DILocation(line: 807, column: 8, scope: !786)
!791 = !DILocation(line: 809, column: 10, scope: !792)
!792 = distinct !DILexicalBlock(scope: !46, file: !2, line: 809, column: 10)
!793 = !DILocation(line: 809, column: 26, scope: !792)
!794 = !DILocation(line: 809, column: 29, scope: !792)
!795 = !DILocation(line: 809, column: 50, scope: !792)
!796 = !DILocation(line: 809, column: 10, scope: !46)
!797 = !DILocation(line: 810, column: 8, scope: !792)
!798 = !DILocation(line: 812, column: 13, scope: !46)
!799 = !DILocation(line: 812, column: 6, scope: !46)
!800 = distinct !DISubprogram(name: "io_blksize", scope: !85, file: !85, line: 80, type: !801, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!801 = !DISubroutineType(types: !802)
!802 = !{!525, !803}
!803 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !804, size: 64)
!804 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !398)
!805 = !DILocalVariable(name: "st", arg: 1, scope: !800, file: !85, line: 80, type: !803)
!806 = !DILocation(line: 80, column: 32, scope: !800)
!807 = !DILocalVariable(name: "blocksize", scope: !800, file: !85, line: 83, type: !525)
!808 = !DILocation(line: 83, column: 9, scope: !800)
!809 = !DILocation(line: 83, column: 21, scope: !800)
!810 = !DILocation(line: 83, column: 38, scope: !800)
!811 = !DILocation(line: 83, column: 58, scope: !800)
!812 = !DILocation(line: 87, column: 54, scope: !800)
!813 = !DILocation(line: 87, column: 52, scope: !800)
!814 = !DILocation(line: 87, column: 33, scope: !800)
!815 = !DILocation(line: 87, column: 13, scope: !800)
!816 = !DILocation(line: 95, column: 7, scope: !817)
!817 = distinct !DILexicalBlock(scope: !800, file: !85, line: 95, column: 7)
!818 = !DILocation(line: 95, column: 29, scope: !817)
!819 = !DILocation(line: 95, column: 32, scope: !817)
!820 = !DILocation(line: 95, column: 45, scope: !817)
!821 = !DILocation(line: 95, column: 55, scope: !817)
!822 = !DILocation(line: 95, column: 42, scope: !817)
!823 = !DILocation(line: 95, column: 7, scope: !800)
!824 = !DILocalVariable(name: "leading_zeros", scope: !825, file: !85, line: 97, type: !49)
!825 = distinct !DILexicalBlock(scope: !817, file: !85, line: 96, column: 5)
!826 = !DILocation(line: 97, column: 11, scope: !825)
!827 = !DILocation(line: 97, column: 51, scope: !825)
!828 = !DILocation(line: 97, column: 27, scope: !825)
!829 = !DILocalVariable(name: "power", scope: !830, file: !85, line: 100, type: !419)
!830 = distinct !DILexicalBlock(scope: !831, file: !85, line: 99, column: 9)
!831 = distinct !DILexicalBlock(scope: !825, file: !85, line: 98, column: 11)
!832 = !DILocation(line: 100, column: 30, scope: !830)
!833 = !DILocation(line: 100, column: 62, scope: !830)
!834 = !DILocation(line: 100, column: 60, scope: !830)
!835 = !DILocation(line: 100, column: 43, scope: !830)
!836 = !DILocation(line: 101, column: 15, scope: !837)
!837 = distinct !DILexicalBlock(scope: !830, file: !85, line: 101, column: 15)
!838 = !DILocation(line: 101, column: 21, scope: !837)
!839 = !DILocation(line: 101, column: 15, scope: !830)
!840 = !DILocation(line: 102, column: 25, scope: !837)
!841 = !DILocation(line: 102, column: 23, scope: !837)
!842 = !DILocation(line: 102, column: 13, scope: !837)
!843 = !DILocation(line: 104, column: 5, scope: !825)
!844 = !DILocation(line: 108, column: 10, scope: !800)
!845 = !DILocation(line: 108, column: 3, scope: !800)
!846 = distinct !DISubprogram(name: "copy_cat", scope: !2, file: !2, line: 501, type: !847, scopeLine: 502, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!847 = !DISubroutineType(types: !848)
!848 = !{!49}
!849 = !DILocalVariable(name: "copy_max", scope: !846, file: !2, line: 506, type: !850)
!850 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !851, line: 31, baseType: !852)
!851 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_ssize_t.h", directory: "", checksumkind: CSK_MD5, checksum: "9b4f5bef81dd94a882775a3ce650ab9c")
!852 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ssize_t", file: !96, line: 118, baseType: !435)
!853 = !DILocation(line: 506, column: 14, scope: !846)
!854 = !DILocalVariable(name: "some_copied", scope: !855, file: !2, line: 514, type: !92)
!855 = distinct !DILexicalBlock(scope: !846, file: !2, line: 514, column: 6)
!856 = !DILocation(line: 514, column: 16, scope: !855)
!857 = !DILocation(line: 514, column: 11, scope: !855)
!858 = !DILocation(line: 515, column: 33, scope: !859)
!859 = distinct !DILexicalBlock(scope: !855, file: !2, line: 514, column: 6)
!860 = !DILocation(line: 515, column: 78, scope: !859)
!861 = !DILocation(line: 515, column: 16, scope: !859)
!862 = !DILocation(line: 515, column: 8, scope: !859)
!863 = !DILocation(line: 518, column: 19, scope: !864)
!864 = distinct !DILexicalBlock(scope: !859, file: !2, line: 516, column: 10)
!865 = !DILocation(line: 518, column: 12, scope: !864)
!866 = !DILocation(line: 521, column: 16, scope: !867)
!867 = distinct !DILexicalBlock(scope: !864, file: !2, line: 521, column: 16)
!868 = !DILocation(line: 521, column: 22, scope: !867)
!869 = !DILocation(line: 521, column: 32, scope: !867)
!870 = !DILocation(line: 521, column: 47, scope: !867)
!871 = !DILocation(line: 521, column: 35, scope: !867)
!872 = !DILocation(line: 521, column: 54, scope: !867)
!873 = !DILocation(line: 521, column: 57, scope: !867)
!874 = !DILocation(line: 521, column: 63, scope: !867)
!875 = !DILocation(line: 521, column: 73, scope: !867)
!876 = !DILocation(line: 521, column: 76, scope: !867)
!877 = !DILocation(line: 521, column: 82, scope: !867)
!878 = !DILocation(line: 521, column: 91, scope: !867)
!879 = !DILocation(line: 521, column: 94, scope: !867)
!880 = !DILocation(line: 521, column: 100, scope: !867)
!881 = !DILocation(line: 521, column: 109, scope: !867)
!882 = !DILocation(line: 521, column: 112, scope: !867)
!883 = !DILocation(line: 521, column: 118, scope: !867)
!884 = !DILocation(line: 521, column: 129, scope: !867)
!885 = !DILocation(line: 521, column: 132, scope: !867)
!886 = !DILocation(line: 521, column: 138, scope: !867)
!887 = !DILocation(line: 521, column: 16, scope: !864)
!888 = !DILocation(line: 522, column: 14, scope: !867)
!889 = !DILocation(line: 523, column: 12, scope: !864)
!890 = !DILocation(line: 524, column: 12, scope: !864)
!891 = !DILocation(line: 525, column: 10, scope: !864)
!892 = !DILocation(line: 514, column: 51, scope: !859)
!893 = !DILocation(line: 514, column: 6, scope: !859)
!894 = distinct !{!894, !895, !896}
!895 = !DILocation(line: 514, column: 6, scope: !855)
!896 = !DILocation(line: 525, column: 10, scope: !855)
!897 = !DILocation(line: 526, column: 4, scope: !846)
!898 = distinct !DISubprogram(name: "simple_cat", scope: !2, file: !2, line: 156, type: !899, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!899 = !DISubroutineType(types: !900)
!900 = !{!92, !51, !525}
!901 = !DILocalVariable(name: "buf", arg: 1, scope: !898, file: !2, line: 156, type: !51)
!902 = !DILocation(line: 156, column: 22, scope: !898)
!903 = !DILocalVariable(name: "bufsize", arg: 2, scope: !898, file: !2, line: 156, type: !525)
!904 = !DILocation(line: 156, column: 33, scope: !898)
!905 = !DILocation(line: 160, column: 6, scope: !898)
!906 = !DILocalVariable(name: "n_read", scope: !907, file: !2, line: 164, type: !527)
!907 = distinct !DILexicalBlock(scope: !898, file: !2, line: 161, column: 8)
!908 = !DILocation(line: 164, column: 20, scope: !907)
!909 = !DILocation(line: 164, column: 40, scope: !907)
!910 = !DILocation(line: 164, column: 52, scope: !907)
!911 = !DILocation(line: 164, column: 57, scope: !907)
!912 = !DILocation(line: 164, column: 29, scope: !907)
!913 = !DILocation(line: 165, column: 14, scope: !914)
!914 = distinct !DILexicalBlock(scope: !907, file: !2, line: 165, column: 14)
!915 = !DILocation(line: 165, column: 21, scope: !914)
!916 = !DILocation(line: 165, column: 14, scope: !907)
!917 = !DILocation(line: 167, column: 14, scope: !918)
!918 = distinct !DILexicalBlock(scope: !914, file: !2, line: 166, column: 12)
!919 = !DILocation(line: 168, column: 14, scope: !918)
!920 = !DILocation(line: 173, column: 14, scope: !921)
!921 = distinct !DILexicalBlock(scope: !907, file: !2, line: 173, column: 14)
!922 = !DILocation(line: 173, column: 21, scope: !921)
!923 = !DILocation(line: 173, column: 14, scope: !907)
!924 = !DILocation(line: 174, column: 12, scope: !921)
!925 = !DILocation(line: 178, column: 41, scope: !926)
!926 = distinct !DILexicalBlock(scope: !907, file: !2, line: 178, column: 14)
!927 = !DILocation(line: 178, column: 46, scope: !926)
!928 = !DILocation(line: 178, column: 14, scope: !926)
!929 = !DILocation(line: 178, column: 57, scope: !926)
!930 = !DILocation(line: 178, column: 54, scope: !926)
!931 = !DILocation(line: 178, column: 14, scope: !907)
!932 = !DILocation(line: 179, column: 12, scope: !926)
!933 = distinct !{!933, !905, !934}
!934 = !DILocation(line: 180, column: 8, scope: !898)
!935 = !DILocation(line: 181, column: 4, scope: !898)
!936 = distinct !DISubprogram(name: "cat", scope: !2, file: !2, line: 212, type: !937, scopeLine: 215, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!937 = !DISubroutineType(types: !938)
!938 = !{!92, !51, !525, !51, !525, !92, !92, !92, !92, !92, !92}
!939 = !DILocalVariable(name: "inbuf", arg: 1, scope: !936, file: !2, line: 212, type: !51)
!940 = !DILocation(line: 212, column: 15, scope: !936)
!941 = !DILocalVariable(name: "insize", arg: 2, scope: !936, file: !2, line: 212, type: !525)
!942 = !DILocation(line: 212, column: 28, scope: !936)
!943 = !DILocalVariable(name: "outbuf", arg: 3, scope: !936, file: !2, line: 212, type: !51)
!944 = !DILocation(line: 212, column: 42, scope: !936)
!945 = !DILocalVariable(name: "outsize", arg: 4, scope: !936, file: !2, line: 212, type: !525)
!946 = !DILocation(line: 212, column: 56, scope: !936)
!947 = !DILocalVariable(name: "show_nonprinting", arg: 5, scope: !936, file: !2, line: 213, type: !92)
!948 = !DILocation(line: 213, column: 14, scope: !936)
!949 = !DILocalVariable(name: "show_tabs", arg: 6, scope: !936, file: !2, line: 213, type: !92)
!950 = !DILocation(line: 213, column: 37, scope: !936)
!951 = !DILocalVariable(name: "number", arg: 7, scope: !936, file: !2, line: 213, type: !92)
!952 = !DILocation(line: 213, column: 53, scope: !936)
!953 = !DILocalVariable(name: "number_nonblank", arg: 8, scope: !936, file: !2, line: 213, type: !92)
!954 = !DILocation(line: 213, column: 66, scope: !936)
!955 = !DILocalVariable(name: "show_ends", arg: 9, scope: !936, file: !2, line: 214, type: !92)
!956 = !DILocation(line: 214, column: 14, scope: !936)
!957 = !DILocalVariable(name: "squeeze_blank", arg: 10, scope: !936, file: !2, line: 214, type: !92)
!958 = !DILocation(line: 214, column: 30, scope: !936)
!959 = !DILocalVariable(name: "ch", scope: !936, file: !2, line: 217, type: !960)
!960 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!961 = !DILocation(line: 217, column: 20, scope: !936)
!962 = !DILocalVariable(name: "newlines", scope: !936, file: !2, line: 224, type: !49)
!963 = !DILocation(line: 224, column: 10, scope: !936)
!964 = !DILocation(line: 224, column: 21, scope: !936)
!965 = !DILocalVariable(name: "use_fionread", scope: !936, file: !2, line: 229, type: !92)
!966 = !DILocation(line: 229, column: 11, scope: !936)
!967 = !DILocalVariable(name: "eob", scope: !936, file: !2, line: 237, type: !51)
!968 = !DILocation(line: 237, column: 12, scope: !936)
!969 = !DILocation(line: 237, column: 18, scope: !936)
!970 = !DILocalVariable(name: "bpin", scope: !936, file: !2, line: 240, type: !51)
!971 = !DILocation(line: 240, column: 12, scope: !936)
!972 = !DILocation(line: 240, column: 19, scope: !936)
!973 = !DILocation(line: 240, column: 23, scope: !936)
!974 = !DILocalVariable(name: "bpout", scope: !936, file: !2, line: 243, type: !51)
!975 = !DILocation(line: 243, column: 12, scope: !936)
!976 = !DILocation(line: 243, column: 20, scope: !936)
!977 = !DILocation(line: 245, column: 6, scope: !936)
!978 = !DILocation(line: 247, column: 10, scope: !979)
!979 = distinct !DILexicalBlock(scope: !936, file: !2, line: 246, column: 8)
!980 = !DILocation(line: 251, column: 18, scope: !981)
!981 = distinct !DILexicalBlock(scope: !982, file: !2, line: 251, column: 18)
!982 = distinct !DILexicalBlock(scope: !979, file: !2, line: 248, column: 12)
!983 = !DILocation(line: 251, column: 27, scope: !981)
!984 = !DILocation(line: 251, column: 25, scope: !981)
!985 = !DILocation(line: 251, column: 38, scope: !981)
!986 = !DILocation(line: 251, column: 35, scope: !981)
!987 = !DILocation(line: 251, column: 18, scope: !982)
!988 = !DILocalVariable(name: "wp", scope: !989, file: !2, line: 253, type: !51)
!989 = distinct !DILexicalBlock(scope: !981, file: !2, line: 252, column: 16)
!990 = !DILocation(line: 253, column: 24, scope: !989)
!991 = !DILocation(line: 253, column: 29, scope: !989)
!992 = !DILocalVariable(name: "remaining_bytes", scope: !989, file: !2, line: 254, type: !525)
!993 = !DILocation(line: 254, column: 24, scope: !989)
!994 = !DILocation(line: 255, column: 18, scope: !989)
!995 = !DILocation(line: 257, column: 53, scope: !996)
!996 = distinct !DILexicalBlock(scope: !997, file: !2, line: 257, column: 26)
!997 = distinct !DILexicalBlock(scope: !989, file: !2, line: 256, column: 20)
!998 = !DILocation(line: 257, column: 57, scope: !996)
!999 = !DILocation(line: 257, column: 26, scope: !996)
!1000 = !DILocation(line: 257, column: 69, scope: !996)
!1001 = !DILocation(line: 257, column: 66, scope: !996)
!1002 = !DILocation(line: 257, column: 26, scope: !997)
!1003 = !DILocation(line: 258, column: 24, scope: !996)
!1004 = !DILocation(line: 259, column: 28, scope: !997)
!1005 = !DILocation(line: 259, column: 25, scope: !997)
!1006 = !DILocation(line: 260, column: 40, scope: !997)
!1007 = !DILocation(line: 260, column: 48, scope: !997)
!1008 = !DILocation(line: 260, column: 46, scope: !997)
!1009 = !DILocation(line: 260, column: 38, scope: !997)
!1010 = !DILocation(line: 261, column: 20, scope: !997)
!1011 = !DILocation(line: 262, column: 25, scope: !989)
!1012 = !DILocation(line: 262, column: 36, scope: !989)
!1013 = !DILocation(line: 262, column: 33, scope: !989)
!1014 = distinct !{!1014, !994, !1015, !357}
!1015 = !DILocation(line: 262, column: 51, scope: !989)
!1016 = !DILocation(line: 267, column: 18, scope: !989)
!1017 = !DILocation(line: 268, column: 26, scope: !989)
!1018 = !DILocation(line: 268, column: 35, scope: !989)
!1019 = !DILocation(line: 268, column: 33, scope: !989)
!1020 = !DILocation(line: 268, column: 24, scope: !989)
!1021 = !DILocation(line: 269, column: 16, scope: !989)
!1022 = !DILocation(line: 273, column: 18, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !982, file: !2, line: 273, column: 18)
!1024 = !DILocation(line: 273, column: 25, scope: !1023)
!1025 = !DILocation(line: 273, column: 23, scope: !1023)
!1026 = !DILocation(line: 273, column: 18, scope: !982)
!1027 = !DILocalVariable(name: "input_pending", scope: !1028, file: !2, line: 275, type: !92)
!1028 = distinct !DILexicalBlock(scope: !1023, file: !2, line: 274, column: 16)
!1029 = !DILocation(line: 275, column: 23, scope: !1028)
!1030 = !DILocalVariable(name: "n_to_read", scope: !1028, file: !2, line: 277, type: !49)
!1031 = !DILocation(line: 277, column: 22, scope: !1028)
!1032 = !DILocation(line: 283, column: 22, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1028, file: !2, line: 283, column: 22)
!1034 = !DILocation(line: 283, column: 35, scope: !1033)
!1035 = !DILocation(line: 283, column: 45, scope: !1033)
!1036 = !DILocation(line: 283, column: 38, scope: !1033)
!1037 = !DILocation(line: 283, column: 79, scope: !1033)
!1038 = !DILocation(line: 283, column: 22, scope: !1028)
!1039 = !DILocation(line: 291, column: 26, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1041, file: !2, line: 291, column: 26)
!1041 = distinct !DILexicalBlock(scope: !1033, file: !2, line: 284, column: 20)
!1042 = !DILocation(line: 291, column: 32, scope: !1040)
!1043 = !DILocation(line: 291, column: 46, scope: !1040)
!1044 = !DILocation(line: 291, column: 49, scope: !1040)
!1045 = !DILocation(line: 291, column: 55, scope: !1040)
!1046 = !DILocation(line: 291, column: 65, scope: !1040)
!1047 = !DILocation(line: 291, column: 68, scope: !1040)
!1048 = !DILocation(line: 291, column: 74, scope: !1040)
!1049 = !DILocation(line: 291, column: 84, scope: !1040)
!1050 = !DILocation(line: 291, column: 87, scope: !1040)
!1051 = !DILocation(line: 291, column: 93, scope: !1040)
!1052 = !DILocation(line: 291, column: 103, scope: !1040)
!1053 = !DILocation(line: 291, column: 106, scope: !1040)
!1054 = !DILocation(line: 291, column: 112, scope: !1040)
!1055 = !DILocation(line: 291, column: 26, scope: !1041)
!1056 = !DILocation(line: 292, column: 37, scope: !1040)
!1057 = !DILocation(line: 292, column: 24, scope: !1040)
!1058 = !DILocation(line: 295, column: 26, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1040, file: !2, line: 294, column: 24)
!1060 = !DILocation(line: 297, column: 38, scope: !1059)
!1061 = !DILocation(line: 297, column: 36, scope: !1059)
!1062 = !DILocation(line: 298, column: 26, scope: !1059)
!1063 = !DILocation(line: 300, column: 20, scope: !1041)
!1064 = !DILocation(line: 301, column: 22, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1028, file: !2, line: 301, column: 22)
!1066 = !DILocation(line: 301, column: 32, scope: !1065)
!1067 = !DILocation(line: 301, column: 22, scope: !1028)
!1068 = !DILocation(line: 302, column: 34, scope: !1065)
!1069 = !DILocation(line: 302, column: 20, scope: !1065)
!1070 = !DILocation(line: 305, column: 23, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1028, file: !2, line: 305, column: 22)
!1072 = !DILocation(line: 305, column: 22, scope: !1028)
!1073 = !DILocation(line: 306, column: 35, scope: !1071)
!1074 = !DILocation(line: 306, column: 20, scope: !1071)
!1075 = !DILocalVariable(name: "n_read", scope: !1028, file: !2, line: 310, type: !527)
!1076 = !DILocation(line: 310, column: 28, scope: !1028)
!1077 = !DILocation(line: 310, column: 48, scope: !1028)
!1078 = !DILocation(line: 310, column: 60, scope: !1028)
!1079 = !DILocation(line: 310, column: 67, scope: !1028)
!1080 = !DILocation(line: 310, column: 37, scope: !1028)
!1081 = !DILocation(line: 311, column: 22, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1028, file: !2, line: 311, column: 22)
!1083 = !DILocation(line: 311, column: 29, scope: !1082)
!1084 = !DILocation(line: 311, column: 22, scope: !1028)
!1085 = !DILocation(line: 313, column: 22, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1082, file: !2, line: 312, column: 20)
!1087 = !DILocation(line: 314, column: 37, scope: !1086)
!1088 = !DILocation(line: 314, column: 22, scope: !1086)
!1089 = !DILocation(line: 315, column: 34, scope: !1086)
!1090 = !DILocation(line: 315, column: 32, scope: !1086)
!1091 = !DILocation(line: 316, column: 22, scope: !1086)
!1092 = !DILocation(line: 318, column: 22, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1028, file: !2, line: 318, column: 22)
!1094 = !DILocation(line: 318, column: 29, scope: !1093)
!1095 = !DILocation(line: 318, column: 22, scope: !1028)
!1096 = !DILocation(line: 320, column: 37, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1093, file: !2, line: 319, column: 20)
!1098 = !DILocation(line: 320, column: 22, scope: !1097)
!1099 = !DILocation(line: 321, column: 34, scope: !1097)
!1100 = !DILocation(line: 321, column: 32, scope: !1097)
!1101 = !DILocation(line: 322, column: 22, scope: !1097)
!1102 = !DILocation(line: 328, column: 25, scope: !1028)
!1103 = !DILocation(line: 328, column: 23, scope: !1028)
!1104 = !DILocation(line: 329, column: 24, scope: !1028)
!1105 = !DILocation(line: 329, column: 31, scope: !1028)
!1106 = !DILocation(line: 329, column: 29, scope: !1028)
!1107 = !DILocation(line: 329, column: 22, scope: !1028)
!1108 = !DILocation(line: 330, column: 19, scope: !1028)
!1109 = !DILocation(line: 330, column: 23, scope: !1028)
!1110 = !DILocation(line: 331, column: 16, scope: !1028)
!1111 = !DILocation(line: 339, column: 22, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1113, file: !2, line: 339, column: 22)
!1113 = distinct !DILexicalBlock(scope: !1023, file: !2, line: 333, column: 16)
!1114 = !DILocation(line: 339, column: 33, scope: !1112)
!1115 = !DILocation(line: 339, column: 22, scope: !1113)
!1116 = !DILocation(line: 341, column: 26, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1118, file: !2, line: 341, column: 26)
!1118 = distinct !DILexicalBlock(scope: !1112, file: !2, line: 340, column: 20)
!1119 = !DILocation(line: 341, column: 35, scope: !1117)
!1120 = !DILocation(line: 341, column: 26, scope: !1118)
!1121 = !DILocation(line: 346, column: 35, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1117, file: !2, line: 342, column: 24)
!1123 = !DILocation(line: 351, column: 30, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1122, file: !2, line: 351, column: 30)
!1125 = !DILocation(line: 351, column: 30, scope: !1122)
!1126 = !DILocation(line: 353, column: 40, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1124, file: !2, line: 352, column: 28)
!1128 = !DILocation(line: 353, column: 35, scope: !1127)
!1129 = !DILocation(line: 353, column: 33, scope: !1127)
!1130 = !DILocation(line: 354, column: 30, scope: !1127)
!1131 = !DILocation(line: 356, column: 24, scope: !1122)
!1132 = !DILocation(line: 360, column: 26, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1118, file: !2, line: 360, column: 26)
!1134 = !DILocation(line: 360, column: 33, scope: !1133)
!1135 = !DILocation(line: 360, column: 37, scope: !1133)
!1136 = !DILocation(line: 360, column: 26, scope: !1118)
!1137 = !DILocation(line: 362, column: 26, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1133, file: !2, line: 361, column: 24)
!1139 = !DILocation(line: 363, column: 34, scope: !1138)
!1140 = !DILocation(line: 363, column: 32, scope: !1138)
!1141 = !DILocation(line: 364, column: 24, scope: !1138)
!1142 = !DILocation(line: 365, column: 20, scope: !1118)
!1143 = !DILocation(line: 368, column: 22, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1113, file: !2, line: 368, column: 22)
!1145 = !DILocation(line: 368, column: 22, scope: !1113)
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
!1160 = !DILocation(line: 381, column: 24, scope: !1113)
!1161 = !DILocation(line: 381, column: 27, scope: !1113)
!1162 = !DILocation(line: 383, column: 24, scope: !982)
!1163 = !DILocation(line: 383, column: 19, scope: !982)
!1164 = !DILocation(line: 383, column: 17, scope: !982)
!1165 = !DILocation(line: 384, column: 12, scope: !982)
!1166 = !DILocation(line: 385, column: 17, scope: !979)
!1167 = !DILocation(line: 385, column: 20, scope: !979)
!1168 = distinct !{!1168, !978, !1169, !357}
!1169 = !DILocation(line: 385, column: 27, scope: !979)
!1170 = !DILocation(line: 389, column: 14, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !979, file: !2, line: 389, column: 14)
!1172 = !DILocation(line: 389, column: 14, scope: !979)
!1173 = !DILocation(line: 391, column: 20, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1171, file: !2, line: 390, column: 12)
!1175 = !DILocation(line: 391, column: 23, scope: !1174)
!1176 = !DILocation(line: 392, column: 25, scope: !1174)
!1177 = !DILocation(line: 393, column: 12, scope: !1174)
!1178 = !DILocation(line: 397, column: 14, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !979, file: !2, line: 397, column: 14)
!1180 = !DILocation(line: 397, column: 23, scope: !1179)
!1181 = !DILocation(line: 397, column: 28, scope: !1179)
!1182 = !DILocation(line: 397, column: 31, scope: !1179)
!1183 = !DILocation(line: 397, column: 14, scope: !979)
!1184 = !DILocation(line: 399, column: 14, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1179, file: !2, line: 398, column: 12)
!1186 = !DILocation(line: 400, column: 22, scope: !1185)
!1187 = !DILocation(line: 400, column: 20, scope: !1185)
!1188 = !DILocation(line: 401, column: 12, scope: !1185)
!1189 = !DILocation(line: 409, column: 14, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !979, file: !2, line: 409, column: 14)
!1191 = !DILocation(line: 409, column: 14, scope: !979)
!1192 = !DILocation(line: 411, column: 14, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1190, file: !2, line: 410, column: 12)
!1194 = !DILocation(line: 413, column: 22, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1196, file: !2, line: 413, column: 22)
!1196 = distinct !DILexicalBlock(scope: !1193, file: !2, line: 412, column: 16)
!1197 = !DILocation(line: 413, column: 25, scope: !1195)
!1198 = !DILocation(line: 413, column: 22, scope: !1196)
!1199 = !DILocation(line: 415, column: 26, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1201, file: !2, line: 415, column: 26)
!1201 = distinct !DILexicalBlock(scope: !1195, file: !2, line: 414, column: 20)
!1202 = !DILocation(line: 415, column: 29, scope: !1200)
!1203 = !DILocation(line: 415, column: 26, scope: !1201)
!1204 = !DILocation(line: 416, column: 35, scope: !1200)
!1205 = !DILocation(line: 416, column: 30, scope: !1200)
!1206 = !DILocation(line: 416, column: 33, scope: !1200)
!1207 = !DILocation(line: 416, column: 24, scope: !1200)
!1208 = !DILocation(line: 417, column: 31, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1200, file: !2, line: 417, column: 31)
!1210 = !DILocation(line: 417, column: 34, scope: !1209)
!1211 = !DILocation(line: 417, column: 31, scope: !1200)
!1212 = !DILocation(line: 419, column: 32, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1209, file: !2, line: 418, column: 24)
!1214 = !DILocation(line: 419, column: 35, scope: !1213)
!1215 = !DILocation(line: 420, column: 32, scope: !1213)
!1216 = !DILocation(line: 420, column: 35, scope: !1213)
!1217 = !DILocation(line: 421, column: 24, scope: !1213)
!1218 = !DILocation(line: 424, column: 32, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1209, file: !2, line: 423, column: 24)
!1220 = !DILocation(line: 424, column: 35, scope: !1219)
!1221 = !DILocation(line: 425, column: 32, scope: !1219)
!1222 = !DILocation(line: 425, column: 35, scope: !1219)
!1223 = !DILocation(line: 426, column: 30, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1219, file: !2, line: 426, column: 30)
!1225 = !DILocation(line: 426, column: 33, scope: !1224)
!1226 = !DILocation(line: 426, column: 30, scope: !1219)
!1227 = !DILocation(line: 428, column: 34, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1229, file: !2, line: 428, column: 34)
!1229 = distinct !DILexicalBlock(scope: !1224, file: !2, line: 427, column: 28)
!1230 = !DILocation(line: 428, column: 37, scope: !1228)
!1231 = !DILocation(line: 428, column: 34, scope: !1229)
!1232 = !DILocation(line: 429, column: 43, scope: !1228)
!1233 = !DILocation(line: 429, column: 46, scope: !1228)
!1234 = !DILocation(line: 429, column: 38, scope: !1228)
!1235 = !DILocation(line: 429, column: 41, scope: !1228)
!1236 = !DILocation(line: 429, column: 32, scope: !1228)
!1237 = !DILocation(line: 432, column: 40, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1228, file: !2, line: 431, column: 32)
!1239 = !DILocation(line: 432, column: 43, scope: !1238)
!1240 = !DILocation(line: 433, column: 40, scope: !1238)
!1241 = !DILocation(line: 433, column: 43, scope: !1238)
!1242 = !DILocation(line: 435, column: 28, scope: !1229)
!1243 = !DILocation(line: 438, column: 36, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1224, file: !2, line: 437, column: 28)
!1245 = !DILocation(line: 438, column: 39, scope: !1244)
!1246 = !DILocation(line: 439, column: 41, scope: !1244)
!1247 = !DILocation(line: 439, column: 44, scope: !1244)
!1248 = !DILocation(line: 439, column: 50, scope: !1244)
!1249 = !DILocation(line: 439, column: 36, scope: !1244)
!1250 = !DILocation(line: 439, column: 39, scope: !1244)
!1251 = !DILocation(line: 442, column: 20, scope: !1201)
!1252 = !DILocation(line: 443, column: 27, scope: !1253)
!1253 = distinct !DILexicalBlock(scope: !1195, file: !2, line: 443, column: 27)
!1254 = !DILocation(line: 443, column: 30, scope: !1253)
!1255 = !DILocation(line: 443, column: 38, scope: !1253)
!1256 = !DILocation(line: 443, column: 42, scope: !1253)
!1257 = !DILocation(line: 443, column: 27, scope: !1195)
!1258 = !DILocation(line: 444, column: 26, scope: !1253)
!1259 = !DILocation(line: 444, column: 29, scope: !1253)
!1260 = !DILocation(line: 444, column: 20, scope: !1253)
!1261 = !DILocation(line: 445, column: 27, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1253, file: !2, line: 445, column: 27)
!1263 = !DILocation(line: 445, column: 30, scope: !1262)
!1264 = !DILocation(line: 445, column: 27, scope: !1253)
!1265 = !DILocation(line: 447, column: 31, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1262, file: !2, line: 446, column: 20)
!1267 = !DILocation(line: 448, column: 22, scope: !1266)
!1268 = !DILocation(line: 452, column: 28, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1262, file: !2, line: 451, column: 20)
!1270 = !DILocation(line: 452, column: 31, scope: !1269)
!1271 = !DILocation(line: 453, column: 33, scope: !1269)
!1272 = !DILocation(line: 453, column: 36, scope: !1269)
!1273 = !DILocation(line: 453, column: 28, scope: !1269)
!1274 = !DILocation(line: 453, column: 31, scope: !1269)
!1275 = !DILocation(line: 456, column: 28, scope: !1196)
!1276 = !DILocation(line: 456, column: 23, scope: !1196)
!1277 = !DILocation(line: 456, column: 21, scope: !1196)
!1278 = distinct !{!1278, !1192, !1279}
!1279 = !DILocation(line: 457, column: 16, scope: !1193)
!1280 = !DILocation(line: 458, column: 12, scope: !1193)
!1281 = !DILocation(line: 462, column: 14, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1190, file: !2, line: 460, column: 12)
!1283 = !DILocation(line: 464, column: 22, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1285, file: !2, line: 464, column: 22)
!1285 = distinct !DILexicalBlock(scope: !1282, file: !2, line: 463, column: 16)
!1286 = !DILocation(line: 464, column: 25, scope: !1284)
!1287 = !DILocation(line: 464, column: 33, scope: !1284)
!1288 = !DILocation(line: 464, column: 36, scope: !1284)
!1289 = !DILocation(line: 464, column: 22, scope: !1285)
!1290 = !DILocation(line: 466, column: 28, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1284, file: !2, line: 465, column: 20)
!1292 = !DILocation(line: 466, column: 31, scope: !1291)
!1293 = !DILocation(line: 467, column: 33, scope: !1291)
!1294 = !DILocation(line: 467, column: 36, scope: !1291)
!1295 = !DILocation(line: 467, column: 28, scope: !1291)
!1296 = !DILocation(line: 467, column: 31, scope: !1291)
!1297 = !DILocation(line: 468, column: 20, scope: !1291)
!1298 = !DILocation(line: 469, column: 27, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1284, file: !2, line: 469, column: 27)
!1300 = !DILocation(line: 469, column: 30, scope: !1299)
!1301 = !DILocation(line: 469, column: 27, scope: !1284)
!1302 = !DILocation(line: 471, column: 26, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1304, file: !2, line: 471, column: 26)
!1304 = distinct !DILexicalBlock(scope: !1299, file: !2, line: 470, column: 20)
!1305 = !DILocation(line: 471, column: 29, scope: !1303)
!1306 = !DILocation(line: 471, column: 37, scope: !1303)
!1307 = !DILocation(line: 471, column: 41, scope: !1303)
!1308 = !DILocation(line: 471, column: 40, scope: !1303)
!1309 = !DILocation(line: 471, column: 46, scope: !1303)
!1310 = !DILocation(line: 471, column: 54, scope: !1303)
!1311 = !DILocation(line: 471, column: 57, scope: !1303)
!1312 = !DILocation(line: 471, column: 26, scope: !1304)
!1313 = !DILocation(line: 473, column: 30, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1315, file: !2, line: 473, column: 30)
!1315 = distinct !DILexicalBlock(scope: !1303, file: !2, line: 472, column: 24)
!1316 = !DILocation(line: 473, column: 38, scope: !1314)
!1317 = !DILocation(line: 473, column: 35, scope: !1314)
!1318 = !DILocation(line: 473, column: 30, scope: !1315)
!1319 = !DILocation(line: 474, column: 39, scope: !1314)
!1320 = !DILocation(line: 474, column: 28, scope: !1314)
!1321 = !DILocation(line: 477, column: 36, scope: !1322)
!1322 = distinct !DILexicalBlock(scope: !1314, file: !2, line: 476, column: 28)
!1323 = !DILocation(line: 477, column: 39, scope: !1322)
!1324 = !DILocation(line: 478, column: 36, scope: !1322)
!1325 = !DILocation(line: 478, column: 39, scope: !1322)
!1326 = !DILocation(line: 480, column: 24, scope: !1315)
!1327 = !DILocation(line: 482, column: 35, scope: !1303)
!1328 = !DILocation(line: 482, column: 30, scope: !1303)
!1329 = !DILocation(line: 482, column: 33, scope: !1303)
!1330 = !DILocation(line: 483, column: 20, scope: !1304)
!1331 = !DILocation(line: 486, column: 31, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1299, file: !2, line: 485, column: 20)
!1333 = !DILocation(line: 487, column: 22, scope: !1332)
!1334 = !DILocation(line: 490, column: 28, scope: !1285)
!1335 = !DILocation(line: 490, column: 23, scope: !1285)
!1336 = !DILocation(line: 490, column: 21, scope: !1285)
!1337 = distinct !{!1337, !1281, !1338}
!1338 = !DILocation(line: 491, column: 16, scope: !1282)
!1339 = distinct !{!1339, !977, !1340}
!1340 = !DILocation(line: 493, column: 8, scope: !936)
!1341 = !DILocation(line: 494, column: 4, scope: !936)
!1342 = distinct !DISubprogram(name: "write_error", scope: !56, file: !56, line: 741, type: !323, scopeLine: 742, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1343 = !DILocalVariable(name: "saved_errno", scope: !1342, file: !56, line: 743, type: !49)
!1344 = !DILocation(line: 743, column: 7, scope: !1342)
!1345 = !DILocation(line: 743, column: 21, scope: !1342)
!1346 = !DILocation(line: 744, column: 11, scope: !1342)
!1347 = !DILocation(line: 744, column: 3, scope: !1342)
!1348 = !DILocation(line: 745, column: 11, scope: !1342)
!1349 = !DILocation(line: 745, column: 3, scope: !1342)
!1350 = !DILocation(line: 746, column: 3, scope: !1342)
!1351 = !DILocation(line: 747, column: 3, scope: !1342)
!1352 = distinct !DISubprogram(name: "is_ENOTSUP", scope: !56, file: !56, line: 774, type: !1353, scopeLine: 775, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!92, !49}
!1355 = !DILocalVariable(name: "err", arg: 1, scope: !1352, file: !56, line: 774, type: !49)
!1356 = !DILocation(line: 774, column: 17, scope: !1352)
!1357 = !DILocation(line: 776, column: 10, scope: !1352)
!1358 = !DILocation(line: 776, column: 14, scope: !1352)
!1359 = !DILocation(line: 776, column: 28, scope: !1352)
!1360 = !DILocation(line: 776, column: 57, scope: !1352)
!1361 = !DILocation(line: 776, column: 61, scope: !1352)
!1362 = !DILocation(line: 776, column: 3, scope: !1352)
!1363 = distinct !DISubprogram(name: "write_pending", scope: !2, file: !2, line: 188, type: !1364, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1364 = !DISubroutineType(types: !1365)
!1365 = !{null, !51, !50}
!1366 = !DILocalVariable(name: "outbuf", arg: 1, scope: !1363, file: !2, line: 188, type: !51)
!1367 = !DILocation(line: 188, column: 25, scope: !1363)
!1368 = !DILocalVariable(name: "bpout", arg: 2, scope: !1363, file: !2, line: 188, type: !50)
!1369 = !DILocation(line: 188, column: 40, scope: !1363)
!1370 = !DILocalVariable(name: "n_write", scope: !1363, file: !2, line: 190, type: !525)
!1371 = !DILocation(line: 190, column: 12, scope: !1363)
!1372 = !DILocation(line: 190, column: 23, scope: !1363)
!1373 = !DILocation(line: 190, column: 22, scope: !1363)
!1374 = !DILocation(line: 190, column: 31, scope: !1363)
!1375 = !DILocation(line: 190, column: 29, scope: !1363)
!1376 = !DILocation(line: 191, column: 14, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1363, file: !2, line: 191, column: 10)
!1378 = !DILocation(line: 191, column: 12, scope: !1377)
!1379 = !DILocation(line: 191, column: 10, scope: !1363)
!1380 = !DILocation(line: 193, column: 41, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1382, file: !2, line: 193, column: 14)
!1382 = distinct !DILexicalBlock(scope: !1377, file: !2, line: 192, column: 8)
!1383 = !DILocation(line: 193, column: 49, scope: !1381)
!1384 = !DILocation(line: 193, column: 14, scope: !1381)
!1385 = !DILocation(line: 193, column: 61, scope: !1381)
!1386 = !DILocation(line: 193, column: 58, scope: !1381)
!1387 = !DILocation(line: 193, column: 14, scope: !1382)
!1388 = !DILocation(line: 194, column: 12, scope: !1381)
!1389 = !DILocation(line: 195, column: 19, scope: !1382)
!1390 = !DILocation(line: 195, column: 11, scope: !1382)
!1391 = !DILocation(line: 195, column: 17, scope: !1382)
!1392 = !DILocation(line: 196, column: 8, scope: !1382)
!1393 = !DILocation(line: 197, column: 4, scope: !1363)
!1394 = distinct !DISubprogram(name: "next_line_num", scope: !2, file: !2, line: 132, type: !323, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !52, retainedNodes: !271)
!1395 = !DILocalVariable(name: "endp", scope: !1394, file: !2, line: 134, type: !51)
!1396 = !DILocation(line: 134, column: 12, scope: !1394)
!1397 = !DILocation(line: 134, column: 19, scope: !1394)
!1398 = !DILocation(line: 135, column: 6, scope: !1394)
!1399 = !DILocation(line: 137, column: 16, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1401, file: !2, line: 137, column: 14)
!1401 = distinct !DILexicalBlock(scope: !1394, file: !2, line: 136, column: 8)
!1402 = !DILocation(line: 137, column: 21, scope: !1400)
!1403 = !DILocation(line: 137, column: 14, scope: !1400)
!1404 = !DILocation(line: 137, column: 24, scope: !1400)
!1405 = !DILocation(line: 137, column: 14, scope: !1401)
!1406 = !DILocation(line: 138, column: 12, scope: !1400)
!1407 = !DILocation(line: 139, column: 15, scope: !1401)
!1408 = !DILocation(line: 139, column: 18, scope: !1401)
!1409 = !DILocation(line: 140, column: 8, scope: !1401)
!1410 = !DILocation(line: 141, column: 13, scope: !1394)
!1411 = !DILocation(line: 141, column: 21, scope: !1394)
!1412 = !DILocation(line: 141, column: 18, scope: !1394)
!1413 = distinct !{!1413, !1398, !1414, !357}
!1414 = !DILocation(line: 141, column: 35, scope: !1394)
!1415 = !DILocation(line: 143, column: 10, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1394, file: !2, line: 143, column: 10)
!1417 = !DILocation(line: 143, column: 25, scope: !1416)
!1418 = !DILocation(line: 143, column: 10, scope: !1394)
!1419 = !DILocation(line: 144, column: 9, scope: !1416)
!1420 = !DILocation(line: 144, column: 26, scope: !1416)
!1421 = !DILocation(line: 144, column: 8, scope: !1416)
!1422 = !DILocation(line: 146, column: 18, scope: !1416)
!1423 = !DILocation(line: 147, column: 10, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1394, file: !2, line: 147, column: 10)
!1425 = !DILocation(line: 147, column: 27, scope: !1424)
!1426 = !DILocation(line: 147, column: 25, scope: !1424)
!1427 = !DILocation(line: 147, column: 10, scope: !1394)
!1428 = !DILocation(line: 148, column: 22, scope: !1424)
!1429 = !DILocation(line: 148, column: 8, scope: !1424)
!1430 = !DILocation(line: 149, column: 4, scope: !1394)
