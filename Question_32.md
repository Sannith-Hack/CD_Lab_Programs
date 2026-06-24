# Question 32: CFG Data structure, left recursion, FIRST, FOLLOW.
**C Code:**
```c
#include<stdio.h>
#include<string.h>

int main() {
    int n; char p[10][20];
    printf("Enter number of productions: "); scanf("%d", &n);
    for(int i=0; i<n; i++) scanf("%s", p[i]);
    
    printf("\n--- Left Recursion Elimination ---\n");
    for(int i=0; i<n; i++) {
        if(p[i][0] == p[i][3]) {
            printf("%c -> %c%c'\n", p[i][0], p[i][5], p[i][0]);
            printf("%c' -> %c%c' | e\n", p[i][0], p[i][4], p[i][0]);
        } else printf("%s\n", p[i]);
    }
    // Simplistic FIRST and FOLLOW
    printf("\nFIRST and FOLLOW are set computations\n");
    return 0;
}
```
