#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Function prototypes
bool Cond0(int var0);
bool Cond1(int var0);
bool isEven(int var0);
int AComputation(int var0);
bool Cond(int var0);
int HeavyRComputation(int var0, int var1);
int ChangedRComputation(int var0, int var1);
void logMessage(const char *message);
void logValue(int value);
bool PredR(int var0, int var1);

int main(int argc, char *argv[]) {
    // R Initial Value random idk
    int R = 10;
    // P parametro
    int P = argv[1] ? atoi(argv[1]) : 0;
    // A desp la definimos
    int A = 0;


    if (Cond0(P)) {
        logMessage("Error0");
    } else {
        if (Cond1(P)) {
            A = AComputation(P);
            if (Cond(A)) {
                R = HeavyRComputation(P, A);
            } else {
                R = ChangedRComputation(P, A);
            }
        } else {
            logMessage("Error");
        }

        logValue(R);
    }

    // Assertion simulation
    if (!PredR(R, P)) {
        return 1;
    }

    return 0;
}

// Function definitions
bool Cond0(int var0) {
    return var0 > 0;
}

bool Cond1(int var0) {
    return isEven(var0);
}

bool isEven(int var0) {
    return var0 % 2 == 0;
}

int AComputation(int var0) {
    return var0 * 2;
}

bool Cond(int var0) {
    return var0 < 0;
}

int HeavyRComputation(int var0, int var1) {
    return var0 + var1;
}

int ChangedRComputation(int var0, int var1) {
    return var0 - var1;
}

void logMessage(const char *message) {
    // printf("LOG: %s\n", message);
}

void logValue(int value) {
    // printf("LOG: %d\n", value);
}

bool PredR(int var0, int var1) {
    return var0 > var1;
}
