#include <math.h>
#include "NumClass.h"

int reverse(int num);

int powerfun(int, int);

int isPalindrome(int num) {
    if (num == reverse(num)) {
        return 1;
    }
    return 0;
}

int reverse(int num) {
    int digit = (int) log10(num);
    if (num == 0)
        return 0;

    return ((num % 10 * pow(10, digit)) + reverse(num / 10));
}

int isArmstrong(int n) {
    int sum = 0, temp, remainder, digits = 0;
    temp = n;
    while (temp != 0) {
        digits++;
        temp = temp / 10;
    }
    temp = n;
    while (temp != 0) {
        remainder = temp % 10;
        sum = sum + powerfun(remainder, digits);
        temp = temp / 10;
    }
    if (n == sum)
        return 1;
    else
        return 0;
}

int powerfun(int num, int r) {
    int c, res = 1;

    for (c = 1; c <= r; c++)
        res = res * num;

    return res;
}