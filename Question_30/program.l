%{
#include <stdio.h>
%}
%%
int|float { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("ID: %s\n", yytext); }
[0-9]+ { printf("Num: %s\n", yytext); }
"+"|"-" { printf("Op: %s\n", yytext); }
. | \n { }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
