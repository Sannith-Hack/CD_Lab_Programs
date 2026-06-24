# Question 28: LL (1) parsing simulation.
**C Code:**
```c
#include<stdio.h>
#include<string.h>
int main() {
    char stack[20]="$E", in[20]; int top=1, i=0;
    printf("Grammar: E->i\nEnter input: "); scanf("%s", in);
    while(stack[top] != '$') {
        if(stack[top] == in[i]) { top--; i++; }
        else if(stack[top] == 'E' && in[i] == 'i') {
            top--; stack[++top] = 'i';
        } else { printf("Rejected\n"); return 0; }
    }
    if(in[i] == '$') printf("Accepted\n");
    else printf("Rejected\n");
    return 0;
}
```
