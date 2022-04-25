#include <stdio.h>
#include <stdlib.h>

#define DEGREES_MAX (360)
typedef unsigned int degrees;

#define MOD_DEGREES(x) (x % DEGREES_MAX)

degrees add_angles(degrees* list, int length)
{
    degrees sum = 0;
    for(int i = 0; i < length; ++i) {
        sum += list[i];
    }
    return sum;
}

int main(int argc, char** argv)
{
    degrees list[argc - 1];

    for(int i = 1; i < argc; ++i) {
        list[i - 1] = MOD_DEGREES(atoi(argv[i]));
    }

    printf("Sum: %d\n", add_angles(list, argc - 1));

    return 0;
}
