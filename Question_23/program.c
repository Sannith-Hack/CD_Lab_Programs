#include <stdio.h>
#include <ctype.h>
#include <string.h>

int isKeyword(char buffer[]){
    char keywords[32][10] = {"if","else","while","int","float","char","return"};
    int i, flag = 0;
    for(i = 0; i < 7; ++i){
        if(strcmp(keywords[i], buffer) == 0){
            flag = 1;
            break;
        }
    }
    return flag;
}

int main(){
    char ch, buffer[15], operators[] = "+-*/%=";
    FILE *fp = fopen("program.c","r");
    int i,j=0;
    if(fp == NULL) return 0;
    while((ch = fgetc(fp)) != EOF){
        for(i = 0; i < 6; ++i){
            if(ch == operators[i])
                printf("%c is operator\n", ch);
        }
        if(isalnum(ch)){
            buffer[j++] = ch;
        } else if((ch == ' ' || ch == '\n') && (j != 0)){
            buffer[j] = '\0';
            j = 0;
            if(isKeyword(buffer) == 1)
                printf("%s is keyword\n", buffer);
            else
                printf("%s is identifier\n", buffer);
        }
    }
    fclose(fp);
    return 0;
}
