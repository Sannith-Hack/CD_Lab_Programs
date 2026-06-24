#include <stdio.h>
#include <string.h>

int main() {
    char exp[20];
    int i=0, j=0, temp=1;
    printf("Enter expression (e.g. a=b+c*d): ");
    scanf("%s", exp);
    
    // Simplistic handling for 1 operator
    printf("Three Address Code:\n");
    for(i=0; i<strlen(exp); i++) {
        if(exp[i] == '*' || exp[i] == '/') {
            printf("t%d = %c %c %c\n", temp, exp[i-1], exp[i], exp[i+1]);
            temp++;
        }
    }
    for(i=0; i<strlen(exp); i++) {
        if(exp[i] == '+' || exp[i] == '-') {
            printf("t%d = %c %c t%d\n", temp, exp[i-1], exp[i], temp-1);
            temp++;
        }
    }
    printf("%c = t%d\n", exp[0], temp-1);
    return 0;
}
