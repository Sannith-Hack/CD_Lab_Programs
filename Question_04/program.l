%{
#include <stdio.h>
%}
%%
[A-Za-z]+ { printf("Alphabets: %s\n", yytext); }
. | \n    { }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
