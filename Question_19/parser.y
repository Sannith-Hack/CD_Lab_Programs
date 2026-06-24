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
