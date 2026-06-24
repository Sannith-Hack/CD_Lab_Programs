# Question 16: Count character occurrence.
**C Code:**
```c
#include <stdio.h>

int main(int argc, char *argv[]) {
    if(argc < 2) return 1;
    FILE *fp = fopen(argv[1], "r");
    int count[256] = {0}, ch;
    while((ch = fgetc(fp)) != EOF) count[ch]++;
    fclose(fp);
    for(int i=0; i<256; i++) {
        if(count[i] > 0 && i != ' ' && i != '\n')
            printf("Char %c: %d\n", i, count[i]);
    }
    return 0;
}
```
