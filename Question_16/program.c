#include <stdio.h>

int main(int argc, char *argv[]) {
    FILE *fp;
    int count[256] = {0};
    char ch;
    if(argc < 2) return 1;
    fp = fopen(argv[1], "r");
    if(fp == NULL) return 1;
    
    while((ch = fgetc(fp)) != EOF) {
        count[(int)ch]++;
    }
    fclose(fp);
    
    for(int i=0; i<256; i++){
        if(count[i] > 0 && i != '\n' && i != '\t' && i != ' ') {
            printf("Char %c: %d times\n", i, count[i]);
        }
    }
    return 0;
}
