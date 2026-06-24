%{
#include <stdio.h>
%}
%%
a* { printf("Recognized a*: %s\n", yytext); }
. | \n { }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
