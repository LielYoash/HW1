#include "NumClass.h"
int fact(int r);

int fact(int r) {
    int mul = 1;
    for (int i = 1; i <= r; i++) {
        mul *= i;
    }
    return mul;
}

int isStrong(int n) {
    int sum = 0;
    int k = n;
    int r;
    while (k != 0) {
        r = k % 10;
        int f = fact(r);
        k = k / 10;
        sum = sum + f;
    }
    if (sum == n) {
        return 1;
    } else {
        return 0;
    }
}

int isPrime(int n) {
    int i, m;
    m = n / 2;
    if(n==1)
        return 1;
    for (i = 2; i <= m; i++) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}
