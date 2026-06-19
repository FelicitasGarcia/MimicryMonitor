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
int RComputation(int var0, int var1);
void logMessage(const char *message);
void logValue(int value);
bool PredR(int var0, int var1);
bool PredT(int var0, int var1);

int main(int argc, char *argv[]) {
    int R = 10;
    int P = argv[1] ? atoi(argv[1]) : 0;
    int A = 0;
    int T = 10;

    if (Cond1(P)) {
            A = AComputation(P);
            if (Cond(A)) {
                R = HeavyRComputation(P, A);
            } else {
                R = RComputation(P, A);
            }
    }

    // Assertion simulation
    if (!PredR(R, P)) {
        return 1;
    }
    // Assertion simulation
    if (!PredT(T, P)) {
        return 1;
    }

    return 0;
}

// Function definitions
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
    return var0 > 5;
}

int HeavyRComputation(int var0, int var1) {
    return var0 + var1;
}

int RComputation(int var0, int var1) {
    return var0 - var1;
}

bool PredT(int var0, int var1) {
    return var0 < var1;
}

bool PredR(int var0, int var1) {
    return var0 > var1;
}