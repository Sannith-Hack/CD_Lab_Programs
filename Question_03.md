# Question 3: Write a lex program to recognize a*.
**Lex Code:**
```lex
%{
#include <stdio.h>
%}
%%
a* { printf("Recognized a*: %s\n", yytext); }
. | \n { }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
```
