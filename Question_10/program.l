%{
int line = 1;
%}
%%
^.*\n { printf("%d: %s", line++, yytext); }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
