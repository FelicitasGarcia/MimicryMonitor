#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char *argv[]) {
    char *dir = NULL;
    if (argc == 1) {
        dir = getenv("HOME");
    } else {
        dir = argv[2];
    }
    chdir(dir);
    return 0;
}