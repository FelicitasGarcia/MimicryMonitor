#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv)
{
#ifndef TARGET_BINARY
#define TARGET_BINARY "llvm/feli/outputs/instrumentedPUA"
#endif
    const char *target = TARGET_BINARY;
    if (argc < 2)
    {
        execl(target, target, (char *)NULL);
        perror("execl");
        return 1;
    }
    const char *fname = argv[1];
    FILE *f = fopen(fname, "r");
    if (!f)
    {
        perror("fopen");
        execl(target, target, (char *)NULL);
        return 1;
    }
    if (fseek(f, 0, SEEK_END) != 0)
    {
        fclose(f);
        execl(target, target, (char *)NULL);
        return 1;
    }
    long sz = ftell(f);
    if (sz < 0)
    {
        fclose(f);
        execl(target, target, (char *)NULL);
        return 1;
    }
    rewind(f);
    char *buf = malloc((size_t)sz + 1);
    if (!buf)
    {
        fclose(f);
        return 1;
    }
    size_t r = fread(buf, 1, (size_t)sz, f);
    buf[r] = '\0';
    fclose(f);
    /* Tell instrumentedPUA's AFL runtime to skip its own fork server.
     * The wrapper owns the fork server; the binary just writes coverage. */
    setenv("AFL_DEFER_FORKSRV", "1", 1);
    execl(target, target, buf, (char *)NULL);
    perror("execl");
    return 1;
}
