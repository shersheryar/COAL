/* example.c */
#include <stdio.h>
extern int say_hi();

int main(int argc, char *argv[])
{
    int val;

    printf("Hello from C! \n");
    say_hi(5);
    val =2;
    printf("Value returned: %d \n", val);
}

// Compile and link using: kaligcc -no-pie Lab14c.c Lab14c.o -o hello
