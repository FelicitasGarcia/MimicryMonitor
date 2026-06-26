#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        fprintf(stderr, "usage: %s <integer>\n", argv[0]);
        return 1;
    }
    int n = atoi(argv[1]);
    int result = 10;
    if (n < 0)
        result = -1;
    else if (n == 0)
        result = 1;
    else if (n < 128)
        result = 1;
    else
        result = 2;
    sleep(1);
    result = 10 / result;
}
