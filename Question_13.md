# Question 13: Find whether the given string is keyword or not.
**C Code:**
```c
#include <stdio.h>
#include <string.h>

int main() {
    char keys[5][10] = {"int", "float", "if", "else", "while"};
    char str[20];
    printf("Enter string: ");
    scanf("%s", str);
    for(int i=0; i<5; i++) {
        if(strcmp(str, keys[i]) == 0) {
            printf("Keyword\n"); return 0;
        }
    }
    printf("Not Keyword\n");
    return 0;
}
```
