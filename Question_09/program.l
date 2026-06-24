%{
#include <stdio.h>
int lines=0, chars=0, spaces=0, tabs=0;
%}
%%
\n      { lines++; chars++; }
[ \t]   { spaces++; chars++; if(yytext[0]=='\t') tabs++; }
.       { chars++; }
%%
int main() {
    yylex();
    printf("Lines: %d\nChars: %d\nSpaces: %d\nTabs: %d\n", lines, chars, spaces, tabs);
    return 0;
}
int yywrap() { return 1; }
