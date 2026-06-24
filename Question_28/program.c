void ll1_parse() {
    push('$'); push('S'); // S is start symbol
    while(stack[top] != '$') {
        char X = stack[top];
        char a = input[i];
        if (X == a) {
            pop(); i++;
        } else if (isTerminal(X)) {
            error();
        } else if (M[X][a] != ERROR) {
            pop();
            push_reverse(M[X][a]); // Push rule onto stack
        } else {
            error();
        }
    }
}
