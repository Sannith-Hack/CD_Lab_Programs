%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}
%token ID
%left '+'
%left '*'
%%
E : E '+' T | T;
T : T '*' F | F;
F : '(' E ')' | ID;
%%
int yylex() { return getchar(); }
void yyerror(char *s) { printf("Error\n"); }
int main() { yyparse(); return 0; }
