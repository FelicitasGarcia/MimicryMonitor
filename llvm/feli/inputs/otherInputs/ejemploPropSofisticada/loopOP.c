#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main(int argc, char *argv[]) {
    int R = 10;
    for (int i = 0; i < 5; i++) {
        R += i * 2;
    }
    return R;
}