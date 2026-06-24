%{
#include <stdio.h>
%}
%%
[a-zA-Z] { printf("English alphabet: %s\n", yytext); }
.        { }
\n       { return 0; }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }
