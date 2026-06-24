#include <stdio.h>
#include <string.h>

int main() {
    char keywords[32][10] = {"int", "float", "char", "double", "if", "else", "while", "for", "return", "void", "switch", "case"};
    char str[20];
    printf("Enter string: ");
    scanf("%s", str);
    int i, flag = 0;
    for(i=0; i<12; i++) {
        if(strcmp(str, keywords[i]) == 0) {
            flag = 1;
            break;
        }
    }
    if(flag) printf("Keyword\n");
    else printf("Not a keyword\n");
    return 0;
}
