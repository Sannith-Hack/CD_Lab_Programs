%{
#include <stdio.h>
%}
%%
[0-9]+ { printf("Digit recognized: %s\n", yytext); }
.      { }
\n     { return 0; }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }
