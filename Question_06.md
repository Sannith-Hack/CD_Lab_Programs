# Question 6: Write a lex program to recognize digit.
**Lex Code:**
```lex
%{
#include <stdio.h>
%}
%%
[0-9]+ { printf("Digit: %s\n", yytext); }
. | \n { }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
```
