#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{

    int n;

    if (scanf("%d", &n) != 1)
        return 0;

    if (n < 1 || n > 32)
    {
        printf("INVALID\n");
        return 0;
    }

    int lengths[32];
    char records[32][64];

    int totalSize = 0;

    for (int i = 0; i < n; i++)
    {

        if (scanf("%d", &lengths[i]) != 1)
            return 0;

        if (scanf("%63s", records[i]) != 1)
            return 0;

        if ((int)strlen(records[i]) != lengths[i])
        {
            printf("INVALID\n");
            return 0;
        }

        if (lengths[i] < 0 || lengths[i] > 48)
        {
            printf("INVALID\n");
            return 0;
        }

        totalSize += lengths[i];
    }

    if (totalSize > 256)
    {
        printf("INVALID\n");
        return 0;
    }

    char *buffer = malloc(totalSize + 1);

    if (buffer == NULL)
        return 0;

    buffer[0] = '\0';

    int uppercaseCount = 0;
    int digitCount = 0;

    for (int i = 0; i < n; i++)
    {

        strcat(buffer, records[i]);

        for (int j = 0; records[i][j] != '\0'; j++)
        {

            char c = records[i][j];

            if (c >= 'A' && c <= 'Z')
                uppercaseCount++;

            if (c >= '0' && c <= '9')
                digitCount++;
        }
    }

    int checksum = 0;

    for (int i = 0; buffer[i] != '\0'; i++)
        checksum += (unsigned char)buffer[i];

    printf("%d\n", checksum);
    printf("%d\n", uppercaseCount);
    printf("%d\n", digitCount);

    free(buffer);

    return 0;
}