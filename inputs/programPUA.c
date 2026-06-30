#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
extern volatile int mm_target_reached;

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        fprintf(stderr, "usage: %s <integer>\n", argv[0]);
        return 1;
    }
    int n = atoi(argv[1]);
    int result;
    if (n < 0)
        result = -1;
    else if (n == 0)
        result = 1;
    else if (n < 128)
    {
        mm_target_reached = 1;
        result = 5;
    }
    else
        result = 2;
    usleep(5000);
    result = 10 / result;
}
