#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <stdint.h>

typedef struct {
    const char* transitionType;
    const char* targetNodeId;
} AutomatonTransition;

typedef struct {
    const char* id;
    const char* verdict;
    const char* conditionName;
    int isTerminal;
    AutomatonTransition* transitions;
    int numTransitions;
} AutomatonNode;

static AutomatonNode* automaton = NULL;
static const char* currentState = NULL;
static int stopMonitoring = 0;
static int automatonSize = 0;
static FILE* outputFile = NULL;
static int extraInstructions = 0;
static char* monitorPolicy = NULL;

// [MM_FUZZER] variable global leída por el harness de Rust
uint8_t MM_VERDICT = 0; // 0=NV, 1=V, 2=IV

AutomatonNode* findNode(const char* nodeId) {
    if (!automaton || !nodeId)
        return NULL;
    for (int i = 0; i < automatonSize; i++) {
        if (strcmp(automaton[i].id, nodeId) == 0)
            return &automaton[i];
    }
    return NULL;
}

void setMonitorPolicy(const char* policy) {
    if (monitorPolicy)
        free(monitorPolicy);
    monitorPolicy = policy ? strdup(policy) : NULL;
}

int shouldAbortOnVerdict(const char* verdict) {
    if (!monitorPolicy || !verdict)
        return 0;
    if (strcmp(monitorPolicy, "stop-v") == 0 && strcmp(verdict, "V") == 0)
        return 1;
    if (strcmp(monitorPolicy, "stop-iv") == 0 && strcmp(verdict, "IV") == 0)
        return 1;
    return 0;
}

// [MM_FUZZER] escribe el veredicto en MM_VERDICT
static void setVerdict(const char *verdict)
{
    if (strcmp(verdict, "IV") == 0)
        MM_VERDICT = 2;
    else if (strcmp(verdict, "V") == 0)
        MM_VERDICT = 1;
    else
        MM_VERDICT = 0;
}

void monitorAction(const char* transitionType) {
    if (stopMonitoring || !automaton || !currentState)
        return;

    AutomatonNode* node = findNode(currentState);
    if (!node) {
        fprintf(stderr, "[ERROR] Current node %s not found\n", currentState);
        if (outputFile)
            fprintf(outputFile, "[ERROR] Current node %s not found\n", currentState);
        return;
    }

    if (outputFile) {
        fprintf(outputFile, "\n--- Monitoring ---\n");
        fprintf(outputFile, "Current state: %s\n", node->id);
        fprintf(outputFile, "Verdict: %s\n", node->verdict);
        fprintf(outputFile, "Processing transition: %s\n", transitionType);
    }

    if (node->isTerminal) {
        if (outputFile) {
            fprintf(outputFile, "Warning: Attempted transition '%s' from terminal state %s\n",
                    transitionType, node->id);
            fprintf(outputFile, "Terminal state already reached with verdict: %s\n", node->verdict);
            fprintf(outputFile, "Ignoring transition request.\n");
            fprintf(outputFile, "Final verdict: %s\n", node->verdict);
            fprintf(outputFile, "Monitoring completed.\n");
            fprintf(outputFile, "================================\n");
            fprintf(outputFile, "-----------------\n");
            fflush(outputFile);
        }
        return;
    }

    const char* newState = NULL;
    for (int i = 0; i < node->numTransitions; i++) {
        if (strcmp(node->transitions[i].transitionType, transitionType) == 0) {
            newState = node->transitions[i].targetNodeId;
            break;
        }
    }

    if (newState) {
        currentState = newState;
        if (outputFile)
            fprintf(outputFile, "Transition successful. New state: %s\n", currentState);

        AutomatonNode* newNode = findNode(currentState);
        if (newNode) {
            if (outputFile)
                fprintf(outputFile, "New node verdict: %s\n", newNode->verdict);

            // [MM_FUZZER] escribir veredicto
            setVerdict(newNode->verdict);

            if (shouldAbortOnVerdict(newNode->verdict)) {
                if (outputFile) {
                    fprintf(outputFile, "EARLY ABORT: Policy '%s' triggered on verdict '%s'\n",
                            monitorPolicy, newNode->verdict);
                    fprintf(outputFile, "Program terminating due to policy violation.\n");
                    fprintf(outputFile, "================================\n");
                    fflush(outputFile);
                    fclose(outputFile);
                    outputFile = NULL;
                }
                stopMonitoring = 1;
                automaton = NULL;
                fprintf(stderr, "Monitor policy violation: %s verdict reached. Terminating program.\n",
                        newNode->verdict);
                exit(1);
            }

            if (newNode->isTerminal) {
                if (outputFile) {
                    fprintf(outputFile, "Terminal state reached: %s\n", newNode->verdict);
                    fprintf(outputFile, "Final verdict: %s\n", newNode->verdict);
                    fprintf(outputFile, "Monitoring completed normally.\n");
                    fprintf(outputFile, "================================\n");
                }
                stopMonitoring = 1;
                automaton = NULL;
                if (outputFile)
                {
                    fclose(outputFile);
                    outputFile = NULL;
                }
            }
        }
    } else {
        if (outputFile) {
            fprintf(outputFile, "Error: No valid transition '%s' from state %s\n", transitionType, node->id);
            fprintf(outputFile, "Monitoring stopped due to invalid transition.\n");
            fprintf(outputFile, "================================\n");
        }
        stopMonitoring = 1;
        if (outputFile)
        {
            fclose(outputFile);
            outputFile = NULL;
        }
    }

    if (outputFile)
    {
        fprintf(outputFile, "-----------------\n");
        fflush(outputFile);
    }
}

void initAutomaton(AutomatonNode* nodes, int size, const char* initialNodeId) {
    if (!nodes || size <= 0 || !initialNodeId) {
        fprintf(stderr, "[ERROR] Invalid automaton initialization parameters\n");
        return;
    }

    if (automaton != NULL)
    {
        stopMonitoring = 1;
        return;
    }

    // [MM_FUZZER] resetear veredicto al inicio de cada ejecución
    MM_VERDICT = 0;

    outputFile = fopen("/Users/felicitasgarcia/monitor_output.txt", "a");
    if (outputFile == NULL) {
        fprintf(stderr, "[ERROR] Could not open output file monitor_output.txt\n");
        return;
    }

    automaton = nodes;
    automatonSize = size;
    currentState = initialNodeId;

    time_t now = time(NULL);
    char* timeStr = ctime(&now);
    if (timeStr)
    {
        char *nl = strchr(timeStr, '\n');
        if (nl)
            *nl = '\0';
    }

    fprintf(outputFile, "\n================================\n");
    fprintf(outputFile, "NEW EXECUTION - %s\n", timeStr ? timeStr : "Unknown time");
    fprintf(outputFile, "================================\n");
    fprintf(outputFile, "Automaton initialized with %d nodes. Initial state: %s\n", size, currentState);
    fprintf(outputFile, "Monitor policy: %s\n", monitorPolicy ? monitorPolicy : "none");

    for (int i = 0; i < automatonSize; i++) {
        fprintf(outputFile, "Node %s (terminal: %d, verdict: %s):\n",
                automaton[i].id, automaton[i].isTerminal, automaton[i].verdict);
        for (int j = 0; j < automaton[i].numTransitions; j++)
            fprintf(outputFile, "  -> %s (%s)\n",
                    automaton[i].transitions[j].transitionType,
                    automaton[i].transitions[j].targetNodeId);
    }

    AutomatonNode* initialNode = findNode(currentState);
    if (initialNode && initialNode->isTerminal) {
        fprintf(outputFile, "Initial state %s is terminal with verdict: %s\n",
                currentState, initialNode->verdict);

        // [MM_FUZZER] escribir veredicto del estado inicial
        setVerdict(initialNode->verdict);

        if (shouldAbortOnVerdict(initialNode->verdict)) {
            fprintf(outputFile, "EARLY ABORT: Policy '%s' triggered on initial verdict '%s'\n",
                    monitorPolicy, initialNode->verdict);
            fprintf(outputFile, "================================\n");
            fflush(outputFile);
            fclose(outputFile);
            outputFile = NULL;
            stopMonitoring = 1;
            automaton = NULL;
            fprintf(stderr, "Monitor policy violation: %s verdict reached in initial state. Terminating program.\n",
                    initialNode->verdict);
            exit(1);
        }

        fprintf(outputFile, "Terminal state reached immediately. Final verdict: %s\n", initialNode->verdict);
        fprintf(outputFile, "Monitoring completed (no transitions needed).\n");
        fprintf(outputFile, "================================\n");
        fflush(outputFile);
        fclose(outputFile);
        outputFile = NULL;
        stopMonitoring = 1;
        automaton = NULL;
    } else {
        fprintf(outputFile, "Continuing monitoring\n");
    }

    if (outputFile)
        fflush(outputFile);
}