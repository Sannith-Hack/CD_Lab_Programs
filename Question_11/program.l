%{
#include <stdio.h>
int words = 0;
%}
%%
[a-zA-Z0-9]+ { words++; }
[ \t\n]      { }
.            { }
%%
int main() {
    yylex();
    printf("Number of words: %d\n", words);
    return 0;
}
int yywrap() { return 1; }
