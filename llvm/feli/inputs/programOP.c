/* Oracle Program (OP) — original, correct version.
 * Classifies an integer into four categories.
 *
 * Usage: ./op <integer>
 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc < 2)
    {
        fprintf(stderr, "usage: %s <integer>\n", argv[0]);
        return 1;
    }
    int n = atoi(argv[1]);
    int result;
    if (n < 0)
        result = -1; /* negative              */
    else if (n == 0)
        result = 0; /* zero                  */
    else if (n < 128)
        result = 1; /* small positive [1,127] */
    else
        result = 2; /* large positive [128,∞) */
    printf("%d\n", result);
    return 0;
}
