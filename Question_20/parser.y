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
