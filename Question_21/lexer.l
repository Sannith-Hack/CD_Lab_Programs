%{
#include "y.tab.h"
%}
%%
[a-d] { return yytext[0]; }
\n { return NL; }
. { }
%%
int yywrap() { return 1; }
