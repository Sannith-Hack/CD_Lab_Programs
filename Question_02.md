# Question 2: Write a lex program to recognize a to z alphabets.
**Lex Code:**
```lex
%{
#include <stdio.h>
%}
%%
[a-z] { printf("Lowercase a-z: %s\n", yytext); }
. | \n { /* Ignore */ }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
```
