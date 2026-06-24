%{
#include <stdio.h>
%}
%%
a* { printf("Recognized a*: %s\n", yytext); }
.  { }
\n { return 0; }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }
