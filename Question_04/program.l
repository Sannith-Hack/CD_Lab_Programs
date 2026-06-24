%{
#include <stdio.h>
%}
%%
[A-Za-z]+ { printf("English alphabets: %s\n", yytext); }
.         { }
\n        { return 0; }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }
