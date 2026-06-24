# Question 14: Count keywords in a file.
**Lex Code:**
```lex
%{
int k = 0;
%}
%%
int|float|char|if|else|while|for|return { k++; }
[a-zA-Z0-9_]+ { }
. | \n { }
%%
int main() {
    yylex();
    printf("Total keywords: %d\n", k);
    return 0;
}
int yywrap() { return 1; }
```
