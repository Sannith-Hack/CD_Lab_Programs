# Question 20: Evaluate arithmetic expression.
**Lex Code:**
```lex
%{
#include "y.tab.h"
extern int yylval;
%}
%%
[0-9]+ { yylval = atoi(yytext); return NUM; }
[ \t] { }
\n { return 0; }
. { return yytext[0]; }
%%
int yywrap() { return 1; }
```
**Yacc Code:**
```yacc
%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
expr: e { printf("Ans: %d\n", $$); };
e: e '+' e { $$ = $1 + $3; }
 | e '-' e { $$ = $1 - $3; }
 | e '*' e { $$ = $1 * $3; }
 | e '/' e { $$ = $1 / $3; }
 | NUM { $$ = $1; };
%%
void yyerror(char *s) { printf("Error\n"); }
int main() { yyparse(); return 0; }
```
