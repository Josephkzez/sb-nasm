#include <stdio.h>

extern int test(int c);

int main(){
    int x = 5;
    printf("Original value: %d\nUpdated value: %d\n", 3, test(3));
    printf("Original value: %d\nUpdated value: %d\n", 7, test(7));
    printf("Original value: %d\nUpdated value: %d\n", 10, test(10));
    printf("Original value: %d\nUpdated value: %d\n", 13, test(13));
    return 0;
}
