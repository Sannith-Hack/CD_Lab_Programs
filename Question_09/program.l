%{
int l=0, c=0, s=0, t=0;
%}
%%
\n      { l++; c++; }
" "      { s++; c++; }
\t      { t++; c++; }
.        { c++; }
%%
int main() {
    yylex();
    printf("Lines:%d Chars:%d Spaces:%d Tabs:%d\n", l, c, s, t);
    return 0;
}
int yywrap() { return 1; }
