struct Production {
    char lhs;
    char rhs[10][20]; // up to 10 alternatives, each max 20 chars
    int alt_count;
};

// Left recursion elimination:
// A -> A alpha | beta
// becomes:
// A -> beta A'
// A' -> alpha A' | epsilon

// The computation of FIRST and FOLLOW involves iterative sets.
// (See Question 22 for basic FIRST logic)
