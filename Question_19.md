# Question 19: YAAC a^n b^n.
**Lex Code:**
```lex
%{
#include "y.tab.h"
%}
%%
a { return A; }
b { return B; }
\n { return NL; }
. { return yytext[0]; }
%%
int yywrap() { return 1; }
```
**Yacc Code:**
```yacc
%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);
%}
%token A B NL
%%
S: X NL { printf("Accepted\n"); exit(0); }
X: A X B | ;
%%
void yyerror(char *s) { printf("Rejected\n"); exit(0); }
int main() { yyparse(); return 0; }
```
