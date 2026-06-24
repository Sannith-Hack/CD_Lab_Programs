# Question 8: Write a lex program to find given number is perfect or not.
**Lex Code:**
```lex
%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
[0-9]+ {
    int num = atoi(yytext), sum = 0;
    for(int i = 1; i < num; i++) if(num % i == 0) sum += i;
    if(sum == num) printf("Perfect Number\n");
    else printf("Not Perfect\n");
}
. | \n { }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
```
