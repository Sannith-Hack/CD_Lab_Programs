%{
#include <stdio.h>
#include <string.h>
%}
%%
[0-9]+ {
    int len = strlen(yytext);
    int i, flag = 1;
    for(i = 0; i < len/2; i++) {
        if(yytext[i] != yytext[len-1-i]) {
            flag = 0;
            break;
        }
    }
    if(flag) printf("Palindrome\n");
    else printf("Not Palindrome\n");
}
. | \n { return 0; }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }
