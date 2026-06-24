// Shift-Reduce operations
if (action[state][input] == 'S') {
    push(state);
    push(input);
    advance_input();
} else if (action[state][input] == 'R') {
    // reduce by rule A -> beta
    pop(2 * length(beta));
    state = top();
    push(A);
    push(goto[state][A]);
}
