# Question 26: SLR(1) Parsing shift reduce simulation.
**C Code:**
```c
#include<stdio.h>
#include<string.h>
int main() {
    char stack[20]="", input[20];
    int top=-1, i=0;
    printf("Grammar: E->E+E | i\nEnter input: ");
    scanf("%s", input);
    while(i < strlen(input)) {
        stack[++top] = input[i++]; stack[top+1] = '\0';
        printf("Shift: %s\n", stack);
        while(top>=0) {
            if(stack[top]=='i') { stack[top]='E'; printf("Reduce: %s\n", stack); }
            else if(top>=2 && stack[top-2]=='E' && stack[top-1]=='+' && stack[top]=='E') {
                top-=2; stack[top]='E'; stack[top+1]='\0';
                printf("Reduce: %s\n", stack);
            } else break;
        }
    }
    if(top==0 && stack[0]=='E') printf("Accepted\n");
    else printf("Rejected\n");
    return 0;
}
```
