# Question 5: Write a lex program to recognize any English alphabet.
**Lex Code:**
```lex
%{
#include <stdio.h>
%}
%%
[A-Za-z] { printf("Alphabet: %s\n", yytext); }
. | \n   { }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
```
