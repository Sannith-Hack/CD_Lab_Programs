# Question 1: Write a lex program to recognize alphabet.
**Lex Code:**
```lex
%{
#include <stdio.h>
%}
%%
[a-zA-Z] { printf("Alphabet: %s\n", yytext); }
. | \n   { /* Ignore */ }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
```
