#include <math.h>
#include "NumClass.h"

int isArmstrong(int num) {
    int originalNum, remainder, n = 0;
    float result = 0.0;
    originalNum = num;
    for (originalNum = num; originalNum != 0; ++n) {
        originalNum /= 10;
    }
    for (originalNum = num; originalNum != 0; originalNum /= 10) {
        remainder = originalNum % 10;
        result += pow(remainder, n);
    }
    if ((int) result == num)
        return 1;
    else
        return 0;
}

int isPalindrome(int n) {
    int r, sum = 0, temp;
    temp = n;
    while (n > 0) {
        r = n % 10;
        sum = (sum * 10) + r;
        n = n / 10;
    }
    if (temp == sum)
        return 1;
    else
        return 0;
}

