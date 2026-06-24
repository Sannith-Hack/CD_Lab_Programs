#include <stdio.h>
#include <string.h>

int main() {
    char exp[20]; int t = 1;
    printf("Enter exp (e.g. a=b+c*d): "); scanf("%s", exp);
    for(int i=0; i<strlen(exp); i++) {
        if(exp[i] == '*' || exp[i] == '/') {
            printf("t%d = %c %c %c\n", t, exp[i-1], exp[i], exp[i+1]);
            exp[i-1] = exp[i] = exp[i+1] = t + '0'; t++;
        }
    }
    for(int i=0; i<strlen(exp); i++) {
        if(exp[i] == '+' || exp[i] == '-') {
            printf("t%d = %c %c %c\n", t, exp[i-1], exp[i], exp[i+1]); t++;
        }
    }
    return 0;
}
