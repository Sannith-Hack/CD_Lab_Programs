%{
#include <stdio.h>
%}
%%
[a-zA-Z] { printf("Alphabet recognized: %s\n", yytext); }
.        { /* Ignore other characters */ }
\n       { return 0; }
%%
int main() {
    printf("Enter input:\n");
    yylex();
    return 0;
}
int yywrap() { return 1; }
