%{
#include <stdio.h>
int line_num = 1;
%}
%%
^.*\n { printf("%d: %s", line_num++, yytext); }
%%
int main(int argc, char **argv) {
    if(argc > 1) yyin = fopen(argv[1], "r");
    yylex();
    return 0;
}
int yywrap() { return 1; }
