%{
#include <stdio.h>
%}
%%
[a-z] { printf("Lowercase alphabet a-z recognized: %s\n", yytext); }
.     { /* Ignore other */ }
\n    { return 0; }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }
