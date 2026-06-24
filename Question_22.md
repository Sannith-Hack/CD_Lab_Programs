# Question 22: Find FIRST.
**C Code:**
```c
#include<stdio.h>
#include<ctype.h>
void first(char c);
char prod[10][10]; int n;

void first(char c) {
    if(!isupper(c)) { printf("%c ", c); return; }
    for(int i=0; i<n; i++) {
        if(prod[i][0] == c) {
            if(islower(prod[i][2]) || prod[i][2] == '$') printf("%c ", prod[i][2]);
            else first(prod[i][2]);
        }
    }
}
int main() {
    printf("Enter number of productions: "); scanf("%d", &n);
    printf("Enter productions (e.g. E->T):\n");
    for(int i=0; i<n; i++) scanf("%s", prod[i]);
    char c; printf("Symbol to find FIRST: "); scanf(" %c", &c);
    printf("FIRST(%c) = { ", c); first(c); printf("}\n");
    return 0;
}
```
