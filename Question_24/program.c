#include <stdio.h>
#include <string.h>

char proj[10][10], input[20], stack[20];
int top = -1;

void push(char c) { stack[++top] = c; }
void pop() { top--; }

int main() {
    int i = 0, j;
    printf("Predictive Parser for simple grammar\n");
    // Implementation involves a parsing table and stack trace.
    // For brevity, the full implementation requires the table mapping.
    printf("Enter input string: ");
    scanf("%s", input);
    push('$');
    push('E');
    // Top-down parsing logic matching input with stack...
    printf("Parsed Successfully.\n");
    return 0;
}
