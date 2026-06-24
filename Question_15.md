# Question 15: Count total operators in a file.
**Lex Code:**
```lex
%{
int op = 0;
%}
%%
"+"|"-"|"*"|"/"|"="|"=="|"<"|">" { op++; }
. | \n { }
%%
int main() {
    yylex();
    printf("Total operators: %d\n", op);
    return 0;
}
int yywrap() { return 1; }
```
