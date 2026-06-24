%{
#include <stdio.h>
int count = 0;
%}
%%
"+"|"-"|"*"|"/"|"%"|"="|"<"|">"|"=="|"!="|"<="|">="|"&&"|"||"|"!" { count++; printf("Operator: %s\n", yytext); }
. | \n { }
%%
int main(int argc, char **argv) {
    if(argc > 1) yyin = fopen(argv[1], "r");
    yylex();
    printf("Total operators: %d\n", count);
    return 0;
}
int yywrap() { return 1; }
