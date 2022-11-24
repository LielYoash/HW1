#include <stdio.h>
#include "NumClass.h"

int main() {
    int start, end;
    printf("Enter your wanted range: \n");
    scanf("%d %d", &start, &end);

    printf("The Armstrong numbers are:");
    for (int i = 0; i < end - start; i++) {
        if (isArmstrong(i) == 1 && i >= start && i <= end) {
            printf(" %d", i);
        }
    }
    printf("\n");

    printf("The Palindromes are:");
    for (int i = 0; i <= end - start; i++) {
        if (isPalindrome(i) == 1 && i >= start && i <= end) {
            printf(" %d", i);
        }
    }
    printf("\n");

    printf("The Prime numbers are:");
    for (int i = start; i < end; i++) {
        if (isPrime(i) == 1 && i >= start && i <= end) {
            printf(" %d", i);
        }
    }
    printf("\n");

    printf("The Strong numbers are:");
    for (int i = start; i < end; i++) {
        if (isStrong(i) == 1 && i >= start && i <= end) {
            printf(" %d", i);
        }
    }
    printf("\n");

    return 0;
}