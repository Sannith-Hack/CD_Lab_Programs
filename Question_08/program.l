%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
[0-9]+ {
    int num = atoi(yytext);
    int sum = 0, i;
    for(i=1; i<num; i++){
        if(num%i == 0) sum += i;
    }
    if(sum == num) printf("Perfect Number\n");
    else printf("Not a Perfect Number\n");
}
. | \n { return 0; }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }
