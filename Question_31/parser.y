%{
#include<stdio.h>
int yylex(); void yyerror(char *s);
%}
%token NUM
%%
E: E '+' E { $$ = $1+$3; } | '(' E ')' { $$ = $2; } | NUM { $$=$1; };
%%
void yyerror(char *s) {}
int main() { yyparse(); return 0; }
