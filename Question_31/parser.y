%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}
%token NUM
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
expr: e { printf("Output = %d\n", $$); } ;
e: e '+' e { $$ = $1 + $3; }
 | e '-' e { $$ = $1 - $3; }
 | e '*' e { $$ = $1 * $3; }
 | e '/' e { $$ = $1 / $3; }
 | '-' e %prec UMINUS { $$ = -$2; }
 | '(' e ')' { $$ = $2; }
 | NUM { $$ = $1; }
 ;
%%
void yyerror(char *s) { printf("Error\n"); }
int main() { yyparse(); return 0; }
