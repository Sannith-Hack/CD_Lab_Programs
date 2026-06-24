# Question 21: a^n b^n c^m d^m.
**Lex Code:**
```lex
%{
#include "y.tab.h"
%}
%%
[a-d] { return yytext[0]; }
\n { return NL; }
. { }
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
%token NL
%%
S: X Y NL { printf("Accepted\n"); exit(0); };
X: 'a' X 'b' | 'a' 'b';
Y: 'c' Y 'd' | 'c' 'd';
%%
void yyerror(char *s) { printf("Rejected\n"); exit(0); }
int main() { yyparse(); return 0; }
```
