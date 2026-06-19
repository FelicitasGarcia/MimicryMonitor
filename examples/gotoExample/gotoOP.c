#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool cond(int R, int i);
int operation(int value);
int i = 0;
int main(int argc, char *argv[]) {
    int ciclo = atoi(argv[3]);
    int ok = 0;
    while (i < ciclo) {
      if (ok == true) {
        ok = false;
      }
      i++;
    }
    return ok;
}

int operation(int value) {
    return value;
}

bool cond(int R, int i) {
    return R == i;
}