%{
#include <stdio.h>
%}
%%
[a-z] { printf("Lowercase a-z: %s\n", yytext); }
. | \n { /* Ignore */ }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
