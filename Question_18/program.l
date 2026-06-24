%{
%}
%%
[6-9][0-9]{9} { printf("Mobile\n"); }
http[s]?:\/\/[a-z0-9\.]+ { printf("URL\n"); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier\n"); }
[0-3][0-9]\/[0-1][0-9]\/[0-9]{4} { printf("Date\n"); }
[0-2][0-9]:[0-5][0-9] { printf("Time\n"); }
. | \n { }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
