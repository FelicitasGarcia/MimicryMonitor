#include "mm_verdict_reporter.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#ifndef MM_ENABLE_LOG_REPORTER
#define MM_ENABLE_LOG_REPORTER 0
#endif

#ifndef MM_ENABLE_AFL_REPORTER
#define MM_ENABLE_AFL_REPORTER 0
#endif

#if MM_ENABLE_LOG_REPORTER
void mm_register_log_reporter(void);
void mm_log_set_file(const char *path);
void mm_log_clear_file(void);
void mm_log_runtimef(const char *fmt, ...);
void mm_log_divider(void);
void mm_log_header(const char *title);
#endif

#if MM_ENABLE_AFL_REPORTER
void mm_register_afl_reporter(void);
#endif

/* ------------------------------------------------------------------ */
/* Tipos — deben coincidir con los que genera el pase LLVM             */
/* ------------------------------------------------------------------ */

typedef struct
{
    const char *transitionType;
    const char *targetNodeId;
} AutomatonTransition;

typedef struct
{
    const char *id;
    const char *verdict;
    const char *conditionName;
    int isTerminal;
    AutomatonTransition *transitions;
    int numTransitions;
} AutomatonNode;

/* ------------------------------------------------------------------ */
/* Estado interno                                                       */
/* ------------------------------------------------------------------ */

static AutomatonNode *automaton = NULL;
static int automatonSize = 0;
static const char *currentState = NULL;
static int stopMonitoring = 0;
static char *monitorPolicy = NULL;
static int reportersConfigured = 0;

/* --- Early-stop telemetry (active only when $MM_STOP_LOG is set) ----------
 * Writes one line per process recording how far the monitor got (steps) and
 * whether the policy stopped the program early. Used to measure, by replaying
 * a fuzzing corpus, how often / how early the monitor short-circuits a run.
 * Gated by the env var so normal and AFL coverage runs pay nothing. */
static unsigned long mm_steps = 0;          /* monitored instructions executed */
static const char *mm_last_verdict = "NV";  /* most recent verdict seen */
static int mm_stop_recorded = 0;            /* ensure exactly one record */

volatile int mm_target_reached = 0;         /* set to 1 by the probe in the target patch */

/* ------------------------------------------------------------------ */
/* Helpers                                                              */
/* ------------------------------------------------------------------ */

static AutomatonNode *findNode(const char *id)
{
    if (!automaton || !id)
        return NULL;
    for (int i = 0; i < automatonSize; i++)
        if (strcmp(automaton[i].id, id) == 0)
            return &automaton[i];
    return NULL;
}

static MMVerdict verdictFromString(const char *v)
{
    if (!v)
        return MM_VERDICT_UNKNOWN;
    if (strcmp(v, "V") == 0)
        return MM_VERDICT_V;
    if (strcmp(v, "IV") == 0)
        return MM_VERDICT_IV;
    return MM_VERDICT_UNKNOWN;
}

static int shouldAbort(const char *verdict)
{
    if (!monitorPolicy || !verdict)
        return 0;
    if (strcmp(monitorPolicy, "stop-v") == 0 && strcmp(verdict, "V") == 0)
        return 1;
    if (strcmp(monitorPolicy, "stop-iv") == 0 && strcmp(verdict, "IV") == 0)
        return 1;
    return 0;
}

static const char *verdictForHumans(const char *verdict)
{
    if (!verdict || strcmp(verdict, "NV") == 0 || strcmp(verdict, "UNKNOWN") == 0)
        return "No Verdict yet";
    if (strcmp(verdict, "V") == 0)
        return "V";
    if (strcmp(verdict, "IV") == 0)
        return "IV";
    return verdict;
}

#if MM_ENABLE_LOG_REPORTER
static void logAutomatonSnapshot(const char *initialNodeId)
{
    mm_log_header("AUTOMATON SNAPSHOT");
    mm_log_runtimef("init automaton: nodes=%d, initial_node=%s, policy=%s",
                    automatonSize,
                    initialNodeId ? initialNodeId : "(null)",
                    monitorPolicy ? monitorPolicy : "(none)");

    for (int i = 0; i < automatonSize; i++)
    {
        const AutomatonNode *n = &automaton[i];
        mm_log_runtimef("node %s: verdict=%s, terminal=%s, condition=%s, transitions=%d",
                        n->id ? n->id : "(null)",
                        verdictForHumans(n->verdict),
                        n->isTerminal ? "yes" : "no",
                        (n->conditionName && n->conditionName[0]) ? n->conditionName : "(none)",
                        n->numTransitions);

        for (int t = 0; t < n->numTransitions; t++)
        {
            const AutomatonTransition *tr = &n->transitions[t];
            mm_log_runtimef("  transition: %s --%s--> %s",
                            n->id ? n->id : "(null)",
                            tr->transitionType ? tr->transitionType : "(null)",
                            tr->targetNodeId ? tr->targetNodeId : "(null)");
        }
    }
    mm_log_divider();
}
#endif

static void mm_record_stop(int early, const char *verdict)
{
    if (mm_stop_recorded)
        return;
    mm_stop_recorded = 1;

    const char *path = getenv("MM_STOP_LOG");
    if (!path || !path[0])
        return;

    char line[128];
    int n = snprintf(line, sizeof line, "early=%d verdict=%s steps=%lu target=%d\n",
                     early ? 1 : 0,
                     (verdict && verdict[0]) ? verdict : "NV",
                     mm_steps,
                     mm_target_reached ? 1 : 0);
    if (n <= 0)
        return;

    /* A single < PIPE_BUF write() to an O_APPEND fd is atomic, so the line
     * stays intact even if several forked children share the file. */
    int fd = open(path, O_WRONLY | O_CREAT | O_APPEND, 0644);
    if (fd < 0)
        return;
    ssize_t wr = write(fd, line, (size_t)n);
    (void)wr;
    close(fd);
}

/* Runs at normal process exit: records a non-early stop (policy never fired).
 * No-op if an early stop was already recorded. */
static void mm_atexit_record(void)
{
    mm_record_stop(0, mm_last_verdict);
}

static void configureReporters(void)
{
    if (reportersConfigured)
        return;

    mm_clear_reporters();
    atexit(mm_atexit_record);

#if MM_ENABLE_LOG_REPORTER
#ifdef MM_LOG_FILE
    mm_log_set_file(MM_LOG_FILE);
#endif
    mm_register_log_reporter();
#endif

#if MM_ENABLE_AFL_REPORTER
    mm_register_afl_reporter();
#endif

    reportersConfigured = 1;
}

/* ------------------------------------------------------------------ */
/* API pública — mismas firmas que usa el pase LLVM                    */
/* ------------------------------------------------------------------ */

void setMonitorPolicy(const char *policy)
{
    if (monitorPolicy)
        free(monitorPolicy);
    monitorPolicy = policy ? strdup(policy) : NULL;
}

void initAutomaton(AutomatonNode *nodes, int size, const char *initialNodeId)
{
    if (!nodes || size <= 0 || !initialNodeId)
        return;

    /* Si ya hay un autómata activo, ignorar re-inicialización */
    if (automaton)
    {
        stopMonitoring = 1;
        return;
    }

    configureReporters();

#if MM_ENABLE_LOG_REPORTER
    mm_log_clear_file();
#endif

    automaton = nodes;
    automatonSize = size;
    currentState = initialNodeId;
    stopMonitoring = 0;

#if MM_ENABLE_LOG_REPORTER
    logAutomatonSnapshot(initialNodeId);
#endif

    AutomatonNode *initial = findNode(currentState);
    if (!initial)
        return;

#if MM_ENABLE_LOG_REPORTER
    mm_log_header("MONITOR START");
    mm_log_runtimef("start at node %s, verdict: %s",
                    currentState,
                    verdictForHumans(initial->verdict));
#endif

    mm_last_verdict = initial->verdict;
    MMVerdict v = verdictFromString(initial->verdict);
    mm_report_verdict(v);

    if (initial->isTerminal)
    {
        if (shouldAbort(initial->verdict))
        {
            mm_record_stop(1, initial->verdict);
            mm_report_abort(v); /* no retorna */
        }
        stopMonitoring = 1;
        automaton = NULL;
    }
}

void monitorAction(const char *transitionType)
{
    if (stopMonitoring || !automaton || !currentState)
        return;

    mm_steps++; /* a monitored instruction executed */

    AutomatonNode *node = findNode(currentState);
    if (!node)
        return;

    /* Ya estamos en terminal — ignorar transiciones adicionales */
    if (node->isTerminal)
        return;

    /* Buscar la transición correspondiente */
    const char *newState = NULL;
    for (int i = 0; i < node->numTransitions; i++)
    {
        if (strcmp(node->transitions[i].transitionType, transitionType) == 0)
        {
            newState = node->transitions[i].targetNodeId;
            break;
        }
    }

    if (!newState)
    {
        /* Transición no definida — detener sin veredicto */
#if MM_ENABLE_LOG_REPORTER
        mm_log_header("MONITOR STOPPED");
        mm_log_runtimef("instruction executed: %s, node: %s, verdict: No Verdict yet, transition: missing -> monitoring stopped",
                        transitionType ? transitionType : "(null)",
                        currentState ? currentState : "(null)");
#endif
        stopMonitoring = 1;
        automaton = NULL;
        return;
    }

    currentState = newState;

    AutomatonNode *newNode = findNode(currentState);
    if (!newNode)
        return;

#if MM_ENABLE_LOG_REPORTER
    mm_log_runtimef("instruction executed: %s, node: %s, verdict: %s",
                    transitionType ? transitionType : "(null)",
                    currentState ? currentState : "(null)",
                    verdictForHumans(newNode->verdict));
#endif

    mm_last_verdict = newNode->verdict;
    MMVerdict v = verdictFromString(newNode->verdict);
    mm_report_verdict(v);

    if (shouldAbort(newNode->verdict))
    {
#if MM_ENABLE_LOG_REPORTER
        mm_log_header("MONITOR ABORT");
        mm_log_runtimef("ABORT: policy '%s' triggered at node %s with verdict %s",
                        monitorPolicy ? monitorPolicy : "(none)",
                        currentState ? currentState : "(null)",
                        verdictForHumans(newNode->verdict));
#endif
        mm_record_stop(1, newNode->verdict);
        mm_report_abort(v); /* no retorna */
    }

    if (newNode->isTerminal)
    {
#if MM_ENABLE_LOG_REPORTER
        mm_log_header("MONITOR TERMINAL");
        mm_log_runtimef("terminal node reached: %s, verdict: %s",
                        currentState ? currentState : "(null)",
                        verdictForHumans(newNode->verdict));
#endif
        stopMonitoring = 1;
        automaton = NULL;
    }
}
