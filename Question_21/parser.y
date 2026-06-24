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
