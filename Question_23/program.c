#include <stdio.h>
#include <ctype.h>

int main() {
    char ch;
    FILE *fp = fopen("program.c", "r");
    if(!fp) return 1;
    while((ch = fgetc(fp)) != EOF) {
        if(isalpha(ch)) printf("Letter: %c\n", ch);
        else if(isdigit(ch)) printf("Digit: %c\n", ch);
        else if(ch == '+' || ch == '=' || ch == '-') printf("Operator: %c\n", ch);
    }
    fclose(fp);
    return 0;
}
