%{
#include <stdio.h>
%}
%%
[6-9][0-9]{9} { printf("Valid Mobile: %s\n", yytext); }
https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*) { printf("Valid URL: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Valid Identifier: %s\n", yytext); }
(0[1-9]|[12][0-9]|3[01])[-/](0[1-9]|1[012])[-/](19|20)\d\d { printf("Valid Date: %s\n", yytext); }
([01][0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])? { printf("Valid Time: %s\n", yytext); }
. | \n { }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }
