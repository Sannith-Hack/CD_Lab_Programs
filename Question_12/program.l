%{
#include <stdio.h>
int vowels = 0, consonants = 0;
%}
%%
[aeiouAEIOU] { vowels++; }
[a-zA-Z]     { consonants++; }
. | \n       { }
%%
int main(int argc, char **argv) {
    if(argc > 1) yyin = fopen(argv[1], "r");
    yylex();
    printf("Vowels: %d\nConsonants: %d\n", vowels, consonants);
    return 0;
}
int yywrap() { return 1; }
