#include "mm_verdict_reporter.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#ifndef MM_ENABLE_LOG_REPORTER
#define MM_ENABLE_LOG_REPORTER 0
#endif

#ifndef MM_ENABLE_AFL_REPORTER
#define MM_ENABLE_AFL_REPORTER 0
#endif

#if MM_ENABLE_LOG_REPORTER
void mm_register_log_reporter(void);
void mm_log_set_file(const char *path);
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

static void configureReporters(void)
{
    if (reportersConfigured)
        return;

    mm_clear_reporters();

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

    automaton = nodes;
    automatonSize = size;
    currentState = initialNodeId;
    stopMonitoring = 0;

    AutomatonNode *initial = findNode(currentState);
    if (!initial)
        return;

    MMVerdict v = verdictFromString(initial->verdict);
    mm_report_verdict(v);

    if (initial->isTerminal)
    {
        if (shouldAbort(initial->verdict))
            mm_report_abort(v); /* no retorna */
        stopMonitoring = 1;
        automaton = NULL;
    }
}

void monitorAction(const char *transitionType)
{
    if (stopMonitoring || !automaton || !currentState)
        return;

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
        stopMonitoring = 1;
        automaton = NULL;
        return;
    }

    currentState = newState;

    AutomatonNode *newNode = findNode(currentState);
    if (!newNode)
        return;

    MMVerdict v = verdictFromString(newNode->verdict);
    mm_report_verdict(v);

    if (shouldAbort(newNode->verdict))
        mm_report_abort(v); /* no retorna */

    if (newNode->isTerminal)
    {
        stopMonitoring = 1;
        automaton = NULL;
    }
}
