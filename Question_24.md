# Question 24: Predictive parser in C.
**C Code:**
```c
#include<stdio.h>
#include<string.h>

char input[10]; int i=0, err=0;
void E(); void T(); void F();

void E() { T(); if(input[i]=='+') { i++; T(); } }
void T() { F(); if(input[i]=='*') { i++; F(); } }
void F() { 
    if(input[i]=='i') i++; 
    else if(input[i]=='(') { i++; E(); if(input[i]==')') i++; else err=1; }
    else err=1; 
}
int main() {
    printf("Enter string for Grammar E->E+T|T, T->T*F|F, F->(E)|i : ");
    scanf("%s", input);
    E();
    if(strlen(input)==i && err==0) printf("Accepted\n");
    else printf("Rejected\n");
    return 0;
}
```
