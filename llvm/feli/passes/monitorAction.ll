; ModuleID = '../passes/monitorAction.c'
source_filename = "../passes/monitorAction.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

%struct.AutomatonNode = type { ptr, ptr, ptr, i32, ptr, i32 }
%struct.AutomatonTransition = type { ptr, ptr }

@MM_VERDICT = global i8 0, align 1
@automaton = internal global ptr null, align 8
@automatonSize = internal global i32 0, align 4
@monitorPolicy = internal global ptr null, align 8
@.str = private unnamed_addr constant [7 x i8] c"stop-v\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"V\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"stop-iv\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"IV\00", align 1
@stopMonitoring = internal global i32 0, align 4
@currentState = internal global ptr null, align 8
@__stderrp = external global ptr, align 8
@.str.4 = private unnamed_addr constant [35 x i8] c"[ERROR] Current node %s not found\0A\00", align 1
@outputFile = internal global ptr null, align 8
@.str.5 = private unnamed_addr constant [21 x i8] c"\0A--- Monitoring ---\0A\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"Current state: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Verdict: %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"Processing transition: %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [59 x i8] c"Warning: Attempted transition '%s' from terminal state %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [49 x i8] c"Terminal state already reached with verdict: %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"Ignoring transition request.\0A\00", align 1
@.str.12 = private unnamed_addr constant [19 x i8] c"Final verdict: %s\0A\00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c"Monitoring completed.\0A\00", align 1
@.str.14 = private unnamed_addr constant [34 x i8] c"================================\0A\00", align 1
@.str.15 = private unnamed_addr constant [19 x i8] c"-----------------\0A\00", align 1
@.str.16 = private unnamed_addr constant [38 x i8] c"Transition successful. New state: %s\0A\00", align 1
@.str.17 = private unnamed_addr constant [22 x i8] c"New node verdict: %s\0A\00", align 1
@.str.18 = private unnamed_addr constant [52 x i8] c"EARLY ABORT: Policy '%s' triggered on verdict '%s'\0A\00", align 1
@.str.19 = private unnamed_addr constant [46 x i8] c"Program terminating due to policy violation.\0A\00", align 1
@.str.20 = private unnamed_addr constant [68 x i8] c"Monitor policy violation: %s verdict reached. Terminating program.\0A\00", align 1
@.str.21 = private unnamed_addr constant [28 x i8] c"Terminal state reached: %s\0A\00", align 1
@.str.22 = private unnamed_addr constant [32 x i8] c"Monitoring completed normally.\0A\00", align 1
@.str.23 = private unnamed_addr constant [47 x i8] c"Error: No valid transition '%s' from state %s\0A\00", align 1
@.str.24 = private unnamed_addr constant [47 x i8] c"Monitoring stopped due to invalid transition.\0A\00", align 1
@.str.25 = private unnamed_addr constant [53 x i8] c"[ERROR] Invalid automaton initialization parameters\0A\00", align 1
@.str.26 = private unnamed_addr constant [42 x i8] c"/Users/felicitasgarcia/monitor_output.txt\00", align 1
@.str.27 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.28 = private unnamed_addr constant [55 x i8] c"[ERROR] Could not open output file monitor_output.txt\0A\00", align 1
@.str.29 = private unnamed_addr constant [35 x i8] c"\0A================================\0A\00", align 1
@.str.30 = private unnamed_addr constant [20 x i8] c"NEW EXECUTION - %s\0A\00", align 1
@.str.31 = private unnamed_addr constant [13 x i8] c"Unknown time\00", align 1
@.str.32 = private unnamed_addr constant [56 x i8] c"Automaton initialized with %d nodes. Initial state: %s\0A\00", align 1
@.str.33 = private unnamed_addr constant [20 x i8] c"Monitor policy: %s\0A\00", align 1
@.str.34 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.35 = private unnamed_addr constant [38 x i8] c"Node %s (terminal: %d, verdict: %s):\0A\00", align 1
@.str.36 = private unnamed_addr constant [14 x i8] c"  -> %s (%s)\0A\00", align 1
@.str.37 = private unnamed_addr constant [47 x i8] c"Initial state %s is terminal with verdict: %s\0A\00", align 1
@.str.38 = private unnamed_addr constant [60 x i8] c"EARLY ABORT: Policy '%s' triggered on initial verdict '%s'\0A\00", align 1
@.str.39 = private unnamed_addr constant [85 x i8] c"Monitor policy violation: %s verdict reached in initial state. Terminating program.\0A\00", align 1
@.str.40 = private unnamed_addr constant [55 x i8] c"Terminal state reached immediately. Final verdict: %s\0A\00", align 1
@.str.41 = private unnamed_addr constant [47 x i8] c"Monitoring completed (no transitions needed).\0A\00", align 1
@.str.42 = private unnamed_addr constant [23 x i8] c"Continuing monitoring\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @findNode(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr @automaton, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %7, %1
  store ptr null, ptr %2, align 8
  br label %36

11:                                               ; preds = %7
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %32, %11
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr @automatonSize, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %35

16:                                               ; preds = %12
  %17 = load ptr, ptr @automaton, align 8
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.AutomatonNode, ptr %17, i64 %19
  %21 = getelementptr inbounds %struct.AutomatonNode, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = call i32 @strcmp(ptr noundef %22, ptr noundef %23)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %31

26:                                               ; preds = %16
  %27 = load ptr, ptr @automaton, align 8
  %28 = load i32, ptr %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.AutomatonNode, ptr %27, i64 %29
  store ptr %30, ptr %2, align 8
  br label %36

31:                                               ; preds = %16
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %4, align 4
  br label %12, !llvm.loop !6

35:                                               ; preds = %12
  store ptr null, ptr %2, align 8
  br label %36

36:                                               ; preds = %35, %26, %10
  %37 = load ptr, ptr %2, align 8
  ret ptr %37
}

declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @setMonitorPolicy(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr @monitorPolicy, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load ptr, ptr @monitorPolicy, align 8
  call void @free(ptr noundef %6)
  br label %7

7:                                                ; preds = %5, %1
  %8 = load ptr, ptr %2, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = load ptr, ptr %2, align 8
  %12 = call ptr @strdup(ptr noundef %11)
  br label %14

13:                                               ; preds = %7
  br label %14

14:                                               ; preds = %13, %10
  %15 = phi ptr [ %12, %10 ], [ null, %13 ]
  store ptr %15, ptr @monitorPolicy, align 8
  ret void
}

declare void @free(ptr noundef) #1

declare ptr @strdup(ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @shouldAbortOnVerdict(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr @monitorPolicy, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = load ptr, ptr %3, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %6, %1
  store i32 0, ptr %2, align 4
  br label %29

10:                                               ; preds = %6
  %11 = load ptr, ptr @monitorPolicy, align 8
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = call i32 @strcmp(ptr noundef %15, ptr noundef @.str.1)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %14
  store i32 1, ptr %2, align 4
  br label %29

19:                                               ; preds = %14, %10
  %20 = load ptr, ptr @monitorPolicy, align 8
  %21 = call i32 @strcmp(ptr noundef %20, ptr noundef @.str.2)
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %28

23:                                               ; preds = %19
  %24 = load ptr, ptr %3, align 8
  %25 = call i32 @strcmp(ptr noundef %24, ptr noundef @.str.3)
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  store i32 1, ptr %2, align 4
  br label %29

28:                                               ; preds = %23, %19
  store i32 0, ptr %2, align 4
  br label %29

29:                                               ; preds = %28, %27, %18, %9
  %30 = load i32, ptr %2, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @monitorAction(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %7 = load i32, ptr @stopMonitoring, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %15, label %9

9:                                                ; preds = %1
  %10 = load ptr, ptr @automaton, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = load ptr, ptr @currentState, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %16, label %15

15:                                               ; preds = %12, %9, %1
  br label %238

16:                                               ; preds = %12
  %17 = load ptr, ptr @currentState, align 8
  %18 = call ptr @findNode(ptr noundef %17)
  store ptr %18, ptr %3, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %32, label %21

21:                                               ; preds = %16
  %22 = load ptr, ptr @__stderrp, align 8
  %23 = load ptr, ptr @currentState, align 8
  %24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %22, ptr noundef @.str.4, ptr noundef %23)
  %25 = load ptr, ptr @outputFile, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %31

27:                                               ; preds = %21
  %28 = load ptr, ptr @outputFile, align 8
  %29 = load ptr, ptr @currentState, align 8
  %30 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %28, ptr noundef @.str.4, ptr noundef %29)
  br label %31

31:                                               ; preds = %27, %21
  br label %238

32:                                               ; preds = %16
  %33 = load ptr, ptr @outputFile, align 8
  %34 = icmp ne ptr %33, null
  br i1 %34, label %35, label %51

35:                                               ; preds = %32
  %36 = load ptr, ptr @outputFile, align 8
  %37 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %36, ptr noundef @.str.5)
  %38 = load ptr, ptr @outputFile, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.AutomatonNode, ptr %39, i32 0, i32 0
  %41 = load ptr, ptr %40, align 8
  %42 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %38, ptr noundef @.str.6, ptr noundef %41)
  %43 = load ptr, ptr @outputFile, align 8
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.AutomatonNode, ptr %44, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %43, ptr noundef @.str.7, ptr noundef %46)
  %48 = load ptr, ptr @outputFile, align 8
  %49 = load ptr, ptr %2, align 8
  %50 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %48, ptr noundef @.str.8, ptr noundef %49)
  br label %51

51:                                               ; preds = %35, %32
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds %struct.AutomatonNode, ptr %52, i32 0, i32 3
  %54 = load i32, ptr %53, align 8
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %87

56:                                               ; preds = %51
  %57 = load ptr, ptr @outputFile, align 8
  %58 = icmp ne ptr %57, null
  br i1 %58, label %59, label %86

59:                                               ; preds = %56
  %60 = load ptr, ptr @outputFile, align 8
  %61 = load ptr, ptr %2, align 8
  %62 = load ptr, ptr %3, align 8
  %63 = getelementptr inbounds %struct.AutomatonNode, ptr %62, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  %65 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %60, ptr noundef @.str.9, ptr noundef %61, ptr noundef %64)
  %66 = load ptr, ptr @outputFile, align 8
  %67 = load ptr, ptr %3, align 8
  %68 = getelementptr inbounds %struct.AutomatonNode, ptr %67, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  %70 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %66, ptr noundef @.str.10, ptr noundef %69)
  %71 = load ptr, ptr @outputFile, align 8
  %72 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %71, ptr noundef @.str.11)
  %73 = load ptr, ptr @outputFile, align 8
  %74 = load ptr, ptr %3, align 8
  %75 = getelementptr inbounds %struct.AutomatonNode, ptr %74, i32 0, i32 1
  %76 = load ptr, ptr %75, align 8
  %77 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %73, ptr noundef @.str.12, ptr noundef %76)
  %78 = load ptr, ptr @outputFile, align 8
  %79 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %78, ptr noundef @.str.13)
  %80 = load ptr, ptr @outputFile, align 8
  %81 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %80, ptr noundef @.str.14)
  %82 = load ptr, ptr @outputFile, align 8
  %83 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %82, ptr noundef @.str.15)
  %84 = load ptr, ptr @outputFile, align 8
  %85 = call i32 @fflush(ptr noundef %84)
  br label %86

86:                                               ; preds = %59, %56
  br label %238

87:                                               ; preds = %51
  store ptr null, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %88

88:                                               ; preds = %116, %87
  %89 = load i32, ptr %5, align 4
  %90 = load ptr, ptr %3, align 8
  %91 = getelementptr inbounds %struct.AutomatonNode, ptr %90, i32 0, i32 5
  %92 = load i32, ptr %91, align 8
  %93 = icmp slt i32 %89, %92
  br i1 %93, label %94, label %119

94:                                               ; preds = %88
  %95 = load ptr, ptr %3, align 8
  %96 = getelementptr inbounds %struct.AutomatonNode, ptr %95, i32 0, i32 4
  %97 = load ptr, ptr %96, align 8
  %98 = load i32, ptr %5, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.AutomatonTransition, ptr %97, i64 %99
  %101 = getelementptr inbounds %struct.AutomatonTransition, ptr %100, i32 0, i32 0
  %102 = load ptr, ptr %101, align 8
  %103 = load ptr, ptr %2, align 8
  %104 = call i32 @strcmp(ptr noundef %102, ptr noundef %103)
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %106, label %115

106:                                              ; preds = %94
  %107 = load ptr, ptr %3, align 8
  %108 = getelementptr inbounds %struct.AutomatonNode, ptr %107, i32 0, i32 4
  %109 = load ptr, ptr %108, align 8
  %110 = load i32, ptr %5, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds %struct.AutomatonTransition, ptr %109, i64 %111
  %113 = getelementptr inbounds %struct.AutomatonTransition, ptr %112, i32 0, i32 1
  %114 = load ptr, ptr %113, align 8
  store ptr %114, ptr %4, align 8
  br label %119

115:                                              ; preds = %94
  br label %116

116:                                              ; preds = %115
  %117 = load i32, ptr %5, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, ptr %5, align 4
  br label %88, !llvm.loop !8

119:                                              ; preds = %106, %88
  %120 = load ptr, ptr %4, align 8
  %121 = icmp ne ptr %120, null
  br i1 %121, label %122, label %209

122:                                              ; preds = %119
  %123 = load ptr, ptr %4, align 8
  store ptr %123, ptr @currentState, align 8
  %124 = load ptr, ptr @outputFile, align 8
  %125 = icmp ne ptr %124, null
  br i1 %125, label %126, label %130

126:                                              ; preds = %122
  %127 = load ptr, ptr @outputFile, align 8
  %128 = load ptr, ptr @currentState, align 8
  %129 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %127, ptr noundef @.str.16, ptr noundef %128)
  br label %130

130:                                              ; preds = %126, %122
  %131 = load ptr, ptr @currentState, align 8
  %132 = call ptr @findNode(ptr noundef %131)
  store ptr %132, ptr %6, align 8
  %133 = load ptr, ptr %6, align 8
  %134 = icmp ne ptr %133, null
  br i1 %134, label %135, label %208

135:                                              ; preds = %130
  %136 = load ptr, ptr @outputFile, align 8
  %137 = icmp ne ptr %136, null
  br i1 %137, label %138, label %144

138:                                              ; preds = %135
  %139 = load ptr, ptr @outputFile, align 8
  %140 = load ptr, ptr %6, align 8
  %141 = getelementptr inbounds %struct.AutomatonNode, ptr %140, i32 0, i32 1
  %142 = load ptr, ptr %141, align 8
  %143 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %139, ptr noundef @.str.17, ptr noundef %142)
  br label %144

144:                                              ; preds = %138, %135
  %145 = load ptr, ptr %6, align 8
  %146 = getelementptr inbounds %struct.AutomatonNode, ptr %145, i32 0, i32 1
  %147 = load ptr, ptr %146, align 8
  call void @setVerdict(ptr noundef %147)
  %148 = load ptr, ptr %6, align 8
  %149 = getelementptr inbounds %struct.AutomatonNode, ptr %148, i32 0, i32 1
  %150 = load ptr, ptr %149, align 8
  %151 = call i32 @shouldAbortOnVerdict(ptr noundef %150)
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %177

153:                                              ; preds = %144
  %154 = load ptr, ptr @outputFile, align 8
  %155 = icmp ne ptr %154, null
  br i1 %155, label %156, label %171

156:                                              ; preds = %153
  %157 = load ptr, ptr @outputFile, align 8
  %158 = load ptr, ptr @monitorPolicy, align 8
  %159 = load ptr, ptr %6, align 8
  %160 = getelementptr inbounds %struct.AutomatonNode, ptr %159, i32 0, i32 1
  %161 = load ptr, ptr %160, align 8
  %162 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %157, ptr noundef @.str.18, ptr noundef %158, ptr noundef %161)
  %163 = load ptr, ptr @outputFile, align 8
  %164 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %163, ptr noundef @.str.19)
  %165 = load ptr, ptr @outputFile, align 8
  %166 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %165, ptr noundef @.str.14)
  %167 = load ptr, ptr @outputFile, align 8
  %168 = call i32 @fflush(ptr noundef %167)
  %169 = load ptr, ptr @outputFile, align 8
  %170 = call i32 @fclose(ptr noundef %169)
  store ptr null, ptr @outputFile, align 8
  br label %171

171:                                              ; preds = %156, %153
  store i32 1, ptr @stopMonitoring, align 4
  store ptr null, ptr @automaton, align 8
  %172 = load ptr, ptr @__stderrp, align 8
  %173 = load ptr, ptr %6, align 8
  %174 = getelementptr inbounds %struct.AutomatonNode, ptr %173, i32 0, i32 1
  %175 = load ptr, ptr %174, align 8
  %176 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %172, ptr noundef @.str.20, ptr noundef %175)
  call void @exit(i32 noundef 1) #3
  unreachable

177:                                              ; preds = %144
  %178 = load ptr, ptr %6, align 8
  %179 = getelementptr inbounds %struct.AutomatonNode, ptr %178, i32 0, i32 3
  %180 = load i32, ptr %179, align 8
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %182, label %207

182:                                              ; preds = %177
  %183 = load ptr, ptr @outputFile, align 8
  %184 = icmp ne ptr %183, null
  br i1 %184, label %185, label %200

185:                                              ; preds = %182
  %186 = load ptr, ptr @outputFile, align 8
  %187 = load ptr, ptr %6, align 8
  %188 = getelementptr inbounds %struct.AutomatonNode, ptr %187, i32 0, i32 1
  %189 = load ptr, ptr %188, align 8
  %190 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %186, ptr noundef @.str.21, ptr noundef %189)
  %191 = load ptr, ptr @outputFile, align 8
  %192 = load ptr, ptr %6, align 8
  %193 = getelementptr inbounds %struct.AutomatonNode, ptr %192, i32 0, i32 1
  %194 = load ptr, ptr %193, align 8
  %195 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %191, ptr noundef @.str.12, ptr noundef %194)
  %196 = load ptr, ptr @outputFile, align 8
  %197 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %196, ptr noundef @.str.22)
  %198 = load ptr, ptr @outputFile, align 8
  %199 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %198, ptr noundef @.str.14)
  br label %200

200:                                              ; preds = %185, %182
  store i32 1, ptr @stopMonitoring, align 4
  store ptr null, ptr @automaton, align 8
  %201 = load ptr, ptr @outputFile, align 8
  %202 = icmp ne ptr %201, null
  br i1 %202, label %203, label %206

203:                                              ; preds = %200
  %204 = load ptr, ptr @outputFile, align 8
  %205 = call i32 @fclose(ptr noundef %204)
  store ptr null, ptr @outputFile, align 8
  br label %206

206:                                              ; preds = %203, %200
  br label %207

207:                                              ; preds = %206, %177
  br label %208

208:                                              ; preds = %207, %130
  br label %230

209:                                              ; preds = %119
  %210 = load ptr, ptr @outputFile, align 8
  %211 = icmp ne ptr %210, null
  br i1 %211, label %212, label %223

212:                                              ; preds = %209
  %213 = load ptr, ptr @outputFile, align 8
  %214 = load ptr, ptr %2, align 8
  %215 = load ptr, ptr %3, align 8
  %216 = getelementptr inbounds %struct.AutomatonNode, ptr %215, i32 0, i32 0
  %217 = load ptr, ptr %216, align 8
  %218 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %213, ptr noundef @.str.23, ptr noundef %214, ptr noundef %217)
  %219 = load ptr, ptr @outputFile, align 8
  %220 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %219, ptr noundef @.str.24)
  %221 = load ptr, ptr @outputFile, align 8
  %222 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %221, ptr noundef @.str.14)
  br label %223

223:                                              ; preds = %212, %209
  store i32 1, ptr @stopMonitoring, align 4
  %224 = load ptr, ptr @outputFile, align 8
  %225 = icmp ne ptr %224, null
  br i1 %225, label %226, label %229

226:                                              ; preds = %223
  %227 = load ptr, ptr @outputFile, align 8
  %228 = call i32 @fclose(ptr noundef %227)
  store ptr null, ptr @outputFile, align 8
  br label %229

229:                                              ; preds = %226, %223
  br label %230

230:                                              ; preds = %229, %208
  %231 = load ptr, ptr @outputFile, align 8
  %232 = icmp ne ptr %231, null
  br i1 %232, label %233, label %238

233:                                              ; preds = %230
  %234 = load ptr, ptr @outputFile, align 8
  %235 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %234, ptr noundef @.str.15)
  %236 = load ptr, ptr @outputFile, align 8
  %237 = call i32 @fflush(ptr noundef %236)
  br label %238

238:                                              ; preds = %15, %31, %86, %233, %230
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @fflush(ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @setVerdict(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 @strcmp(ptr noundef %3, ptr noundef @.str.3)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i8 2, ptr @MM_VERDICT, align 1
  br label %14

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = call i32 @strcmp(ptr noundef %8, ptr noundef @.str.1)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %7
  store i8 1, ptr @MM_VERDICT, align 1
  br label %13

12:                                               ; preds = %7
  store i8 0, ptr @MM_VERDICT, align 1
  br label %13

13:                                               ; preds = %12, %11
  br label %14

14:                                               ; preds = %13, %6
  ret void
}

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noreturn
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @initAutomaton(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %21

15:                                               ; preds = %3
  %16 = load i32, ptr %5, align 4
  %17 = icmp sle i32 %16, 0
  br i1 %17, label %21, label %18

18:                                               ; preds = %15
  %19 = load ptr, ptr %6, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %24, label %21

21:                                               ; preds = %18, %15, %3
  %22 = load ptr, ptr @__stderrp, align 8
  %23 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %22, ptr noundef @.str.25)
  br label %210

24:                                               ; preds = %18
  %25 = load ptr, ptr @automaton, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %28

27:                                               ; preds = %24
  store i32 1, ptr @stopMonitoring, align 4
  br label %210

28:                                               ; preds = %24
  store i8 0, ptr @MM_VERDICT, align 1
  %29 = call ptr @"\01_fopen"(ptr noundef @.str.26, ptr noundef @.str.27)
  store ptr %29, ptr @outputFile, align 8
  %30 = load ptr, ptr @outputFile, align 8
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %35

32:                                               ; preds = %28
  %33 = load ptr, ptr @__stderrp, align 8
  %34 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %33, ptr noundef @.str.28)
  br label %210

35:                                               ; preds = %28
  %36 = load ptr, ptr %4, align 8
  store ptr %36, ptr @automaton, align 8
  %37 = load i32, ptr %5, align 4
  store i32 %37, ptr @automatonSize, align 4
  %38 = load ptr, ptr %6, align 8
  store ptr %38, ptr @currentState, align 8
  %39 = call i64 @time(ptr noundef null)
  store i64 %39, ptr %7, align 8
  %40 = call ptr @ctime(ptr noundef %7)
  store ptr %40, ptr %8, align 8
  %41 = load ptr, ptr %8, align 8
  %42 = icmp ne ptr %41, null
  br i1 %42, label %43, label %51

43:                                               ; preds = %35
  %44 = load ptr, ptr %8, align 8
  %45 = call ptr @strchr(ptr noundef %44, i32 noundef 10)
  store ptr %45, ptr %9, align 8
  %46 = load ptr, ptr %9, align 8
  %47 = icmp ne ptr %46, null
  br i1 %47, label %48, label %50

48:                                               ; preds = %43
  %49 = load ptr, ptr %9, align 8
  store i8 0, ptr %49, align 1
  br label %50

50:                                               ; preds = %48, %43
  br label %51

51:                                               ; preds = %50, %35
  %52 = load ptr, ptr @outputFile, align 8
  %53 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %52, ptr noundef @.str.29)
  %54 = load ptr, ptr @outputFile, align 8
  %55 = load ptr, ptr %8, align 8
  %56 = icmp ne ptr %55, null
  br i1 %56, label %57, label %59

57:                                               ; preds = %51
  %58 = load ptr, ptr %8, align 8
  br label %60

59:                                               ; preds = %51
  br label %60

60:                                               ; preds = %59, %57
  %61 = phi ptr [ %58, %57 ], [ @.str.31, %59 ]
  %62 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %54, ptr noundef @.str.30, ptr noundef %61)
  %63 = load ptr, ptr @outputFile, align 8
  %64 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %63, ptr noundef @.str.14)
  %65 = load ptr, ptr @outputFile, align 8
  %66 = load i32, ptr %5, align 4
  %67 = load ptr, ptr @currentState, align 8
  %68 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %65, ptr noundef @.str.32, i32 noundef %66, ptr noundef %67)
  %69 = load ptr, ptr @outputFile, align 8
  %70 = load ptr, ptr @monitorPolicy, align 8
  %71 = icmp ne ptr %70, null
  br i1 %71, label %72, label %74

72:                                               ; preds = %60
  %73 = load ptr, ptr @monitorPolicy, align 8
  br label %75

74:                                               ; preds = %60
  br label %75

75:                                               ; preds = %74, %72
  %76 = phi ptr [ %73, %72 ], [ @.str.34, %74 ]
  %77 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %69, ptr noundef @.str.33, ptr noundef %76)
  store i32 0, ptr %10, align 4
  br label %78

78:                                               ; preds = %141, %75
  %79 = load i32, ptr %10, align 4
  %80 = load i32, ptr @automatonSize, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %144

82:                                               ; preds = %78
  %83 = load ptr, ptr @outputFile, align 8
  %84 = load ptr, ptr @automaton, align 8
  %85 = load i32, ptr %10, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds %struct.AutomatonNode, ptr %84, i64 %86
  %88 = getelementptr inbounds %struct.AutomatonNode, ptr %87, i32 0, i32 0
  %89 = load ptr, ptr %88, align 8
  %90 = load ptr, ptr @automaton, align 8
  %91 = load i32, ptr %10, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds %struct.AutomatonNode, ptr %90, i64 %92
  %94 = getelementptr inbounds %struct.AutomatonNode, ptr %93, i32 0, i32 3
  %95 = load i32, ptr %94, align 8
  %96 = load ptr, ptr @automaton, align 8
  %97 = load i32, ptr %10, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds %struct.AutomatonNode, ptr %96, i64 %98
  %100 = getelementptr inbounds %struct.AutomatonNode, ptr %99, i32 0, i32 1
  %101 = load ptr, ptr %100, align 8
  %102 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %83, ptr noundef @.str.35, ptr noundef %89, i32 noundef %95, ptr noundef %101)
  store i32 0, ptr %11, align 4
  br label %103

103:                                              ; preds = %137, %82
  %104 = load i32, ptr %11, align 4
  %105 = load ptr, ptr @automaton, align 8
  %106 = load i32, ptr %10, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds %struct.AutomatonNode, ptr %105, i64 %107
  %109 = getelementptr inbounds %struct.AutomatonNode, ptr %108, i32 0, i32 5
  %110 = load i32, ptr %109, align 8
  %111 = icmp slt i32 %104, %110
  br i1 %111, label %112, label %140

112:                                              ; preds = %103
  %113 = load ptr, ptr @outputFile, align 8
  %114 = load ptr, ptr @automaton, align 8
  %115 = load i32, ptr %10, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds %struct.AutomatonNode, ptr %114, i64 %116
  %118 = getelementptr inbounds %struct.AutomatonNode, ptr %117, i32 0, i32 4
  %119 = load ptr, ptr %118, align 8
  %120 = load i32, ptr %11, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds %struct.AutomatonTransition, ptr %119, i64 %121
  %123 = getelementptr inbounds %struct.AutomatonTransition, ptr %122, i32 0, i32 0
  %124 = load ptr, ptr %123, align 8
  %125 = load ptr, ptr @automaton, align 8
  %126 = load i32, ptr %10, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds %struct.AutomatonNode, ptr %125, i64 %127
  %129 = getelementptr inbounds %struct.AutomatonNode, ptr %128, i32 0, i32 4
  %130 = load ptr, ptr %129, align 8
  %131 = load i32, ptr %11, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds %struct.AutomatonTransition, ptr %130, i64 %132
  %134 = getelementptr inbounds %struct.AutomatonTransition, ptr %133, i32 0, i32 1
  %135 = load ptr, ptr %134, align 8
  %136 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %113, ptr noundef @.str.36, ptr noundef %124, ptr noundef %135)
  br label %137

137:                                              ; preds = %112
  %138 = load i32, ptr %11, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, ptr %11, align 4
  br label %103, !llvm.loop !9

140:                                              ; preds = %103
  br label %141

141:                                              ; preds = %140
  %142 = load i32, ptr %10, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, ptr %10, align 4
  br label %78, !llvm.loop !10

144:                                              ; preds = %78
  %145 = load ptr, ptr @currentState, align 8
  %146 = call ptr @findNode(ptr noundef %145)
  store ptr %146, ptr %12, align 8
  %147 = load ptr, ptr %12, align 8
  %148 = icmp ne ptr %147, null
  br i1 %148, label %149, label %201

149:                                              ; preds = %144
  %150 = load ptr, ptr %12, align 8
  %151 = getelementptr inbounds %struct.AutomatonNode, ptr %150, i32 0, i32 3
  %152 = load i32, ptr %151, align 8
  %153 = icmp ne i32 %152, 0
  br i1 %153, label %154, label %201

154:                                              ; preds = %149
  %155 = load ptr, ptr @outputFile, align 8
  %156 = load ptr, ptr @currentState, align 8
  %157 = load ptr, ptr %12, align 8
  %158 = getelementptr inbounds %struct.AutomatonNode, ptr %157, i32 0, i32 1
  %159 = load ptr, ptr %158, align 8
  %160 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %155, ptr noundef @.str.37, ptr noundef %156, ptr noundef %159)
  %161 = load ptr, ptr %12, align 8
  %162 = getelementptr inbounds %struct.AutomatonNode, ptr %161, i32 0, i32 1
  %163 = load ptr, ptr %162, align 8
  call void @setVerdict(ptr noundef %163)
  %164 = load ptr, ptr %12, align 8
  %165 = getelementptr inbounds %struct.AutomatonNode, ptr %164, i32 0, i32 1
  %166 = load ptr, ptr %165, align 8
  %167 = call i32 @shouldAbortOnVerdict(ptr noundef %166)
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %169, label %187

169:                                              ; preds = %154
  %170 = load ptr, ptr @outputFile, align 8
  %171 = load ptr, ptr @monitorPolicy, align 8
  %172 = load ptr, ptr %12, align 8
  %173 = getelementptr inbounds %struct.AutomatonNode, ptr %172, i32 0, i32 1
  %174 = load ptr, ptr %173, align 8
  %175 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %170, ptr noundef @.str.38, ptr noundef %171, ptr noundef %174)
  %176 = load ptr, ptr @outputFile, align 8
  %177 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %176, ptr noundef @.str.14)
  %178 = load ptr, ptr @outputFile, align 8
  %179 = call i32 @fflush(ptr noundef %178)
  %180 = load ptr, ptr @outputFile, align 8
  %181 = call i32 @fclose(ptr noundef %180)
  store ptr null, ptr @outputFile, align 8
  store i32 1, ptr @stopMonitoring, align 4
  store ptr null, ptr @automaton, align 8
  %182 = load ptr, ptr @__stderrp, align 8
  %183 = load ptr, ptr %12, align 8
  %184 = getelementptr inbounds %struct.AutomatonNode, ptr %183, i32 0, i32 1
  %185 = load ptr, ptr %184, align 8
  %186 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %182, ptr noundef @.str.39, ptr noundef %185)
  call void @exit(i32 noundef 1) #3
  unreachable

187:                                              ; preds = %154
  %188 = load ptr, ptr @outputFile, align 8
  %189 = load ptr, ptr %12, align 8
  %190 = getelementptr inbounds %struct.AutomatonNode, ptr %189, i32 0, i32 1
  %191 = load ptr, ptr %190, align 8
  %192 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %188, ptr noundef @.str.40, ptr noundef %191)
  %193 = load ptr, ptr @outputFile, align 8
  %194 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %193, ptr noundef @.str.41)
  %195 = load ptr, ptr @outputFile, align 8
  %196 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %195, ptr noundef @.str.14)
  %197 = load ptr, ptr @outputFile, align 8
  %198 = call i32 @fflush(ptr noundef %197)
  %199 = load ptr, ptr @outputFile, align 8
  %200 = call i32 @fclose(ptr noundef %199)
  store ptr null, ptr @outputFile, align 8
  store i32 1, ptr @stopMonitoring, align 4
  store ptr null, ptr @automaton, align 8
  br label %204

201:                                              ; preds = %149, %144
  %202 = load ptr, ptr @outputFile, align 8
  %203 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %202, ptr noundef @.str.42)
  br label %204

204:                                              ; preds = %201, %187
  %205 = load ptr, ptr @outputFile, align 8
  %206 = icmp ne ptr %205, null
  br i1 %206, label %207, label %210

207:                                              ; preds = %204
  %208 = load ptr, ptr @outputFile, align 8
  %209 = call i32 @fflush(ptr noundef %208)
  br label %210

210:                                              ; preds = %21, %27, %32, %207, %204
  ret void
}

declare ptr @"\01_fopen"(ptr noundef, ptr noundef) #1

declare i64 @time(ptr noundef) #1

declare ptr @ctime(ptr noundef) #1

declare ptr @strchr(ptr noundef, i32 noundef) #1

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 16.0.0 (clang-1600.0.26.6)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
