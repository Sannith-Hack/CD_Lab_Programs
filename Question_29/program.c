#include<stdio.h>
#include<string.h>
char input[10]; int i=0, err=0;
void S(); void A();
void S() { if(input[i]=='a') { i++; A(); if(input[i]=='b') i++; else err=1; } }
void A() { if(input[i]=='c') i++; }
int main() {
    printf("Grammar: S->aAb, A->c\nEnter string: ");
    scanf("%s", input);
    S();
    if(strlen(input)==i && err==0) printf("Accepted\n");
    else printf("Rejected\n");
    return 0;
}
