# Question 17: Symbol table insertion and display.
**C Code:**
```c
#include <stdio.h>
#include <string.h>

struct Symbol { char name[10], type[10]; int size; } table[10];
int count = 0;

void insert(char *n, char *t, int s) {
    strcpy(table[count].name, n);
    strcpy(table[count].type, t);
    table[count].size = s;
    count++;
}

int main() {
    insert("x", "int", 4);
    insert("y", "float", 4);
    printf("Name\tType\tSize\n");
    for(int i=0; i<count; i++)
        printf("%s\t%s\t%d\n", table[i].name, table[i].type, table[i].size);
    return 0;
}
```
