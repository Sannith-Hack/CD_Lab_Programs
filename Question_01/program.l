%{
#include <stdio.h>
%}
%%
[a-zA-Z] { printf("Alphabet: %s\n", yytext); }
. | \n   { /* Ignore */ }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
