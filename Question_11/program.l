%{
int words = 0;
%}
%%
[a-zA-Z0-9]+ { words++; }
. | \n      { }
%%
int main() {
    yylex();
    printf("Words: %d\n", words);
    return 0;
}
int yywrap() { return 1; }
