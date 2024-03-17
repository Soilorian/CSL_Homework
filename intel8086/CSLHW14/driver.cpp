#include <stdio.h>


extern "C"{
extern int gcd(int, int);
extern int lcm(int, int);
}
int main() {
    int n;
    scanf("%d", &n);

    int a, b;
    for (int i = 0; i < n; ++i) {
        scanf("%d %d", &a, &b);
        printf("%d %d\n", gcd(a, b), lcm(a, b));
    }

    return 0;
}