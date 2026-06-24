%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);
%}
%token A B C D NL
%%
S : X Y NL { printf("Valid String\n"); exit(0); }
  ;
X : A X B
  | A B
  ;
Y : C Y D
  | C D
  ;
%%
void yyerror(char *s) { printf("Invalid String\n"); exit(0); }
int main() {
    yyparse();
    return 0;
}
