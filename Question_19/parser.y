%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);
%}
%token A B NL
%%
S : A S B NL { printf("Valid string\n"); exit(0); }
  | NL { printf("Valid string (n=0)\n"); exit(0); }
  ;
%%
void yyerror(char *s) {
    printf("Invalid string\n");
    exit(0);
}
int main() {
    yyparse();
    return 0;
}
