#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct Symbol {
    char name[20];
    char type[20];
    int size;
    struct Symbol *next;
} *head = NULL;

void insert(char *name, char *type, int size) {
    struct Symbol *node = (struct Symbol*)malloc(sizeof(struct Symbol));
    strcpy(node->name, name);
    strcpy(node->type, type);
    node->size = size;
    node->next = head;
    head = node;
}

void display() {
    struct Symbol *temp = head;
    printf("Name\tType\tSize\n");
    while(temp) {
        printf("%s\t%s\t%d\n", temp->name, temp->type, temp->size);
        temp = temp->next;
    }
}

int main() {
    insert("x", "int", 4);
    insert("y", "float", 4);
    display();
    return 0;
}
