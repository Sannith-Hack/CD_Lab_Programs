#include <stdio.h>
char input[100];
int i = 0;

void E(); void T(); void F();

void E() { T(); if(input[i]=='+') { i++; T(); } }
void T() { F(); if(input[i]=='*') { i++; F(); } }
void F() { 
    if(input[i]=='(') { i++; E(); if(input[i]==')') i++; }
    else if(input[i]=='i') { i++; } 
}

int main() {
    printf("Enter string (e.g. i+i*i): ");
    scanf("%s", input);
    E();
    if(input[i] == '\0') printf("Success\n");
    else printf("Error\n");
    return 0;
}
