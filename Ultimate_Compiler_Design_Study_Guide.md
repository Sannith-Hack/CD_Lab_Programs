# 🚀 ULTIMATE COMPILER DESIGN STUDY GUIDE 🚀

This is your master study guide. It combines all short answers, detailed long answers, and specific past paper solutions into one highly organized, easy-to-read document.

---

# 📘 PART A: Short Answers (2 Marks)

**1. Define Interpreter.**
An interpreter translates and executes a high-level source program line-by-line (statement-by-statement) at runtime, without pre-compiling the entire program into machine code.

**2. List out cousins of compiler.**
The tools that work alongside a compiler to execute a program are known as its cousins. They include: Preprocessors, Assemblers, Loaders, and Linkers.

**3. Define Lexeme, Pattern and Token.**
*   **Token:** A categorized block of text produced by the lexer (e.g., `<identifier>`, `<keyword>`).
*   **Pattern:** A rule describing the set of strings that can form a specific token (e.g., `letter(letter|digit)*`).
*   **Lexeme:** The actual sequence of characters in the code matching the pattern (e.g., `count`).

**4. What is syntax tree?**
A syntax tree (Abstract Syntax Tree) is a condensed, hierarchical representation of source code where interior nodes represent operators and leaf nodes represent operands, omitting useless punctuation.

**5. Write the disadvantages of SLR Parser.**
SLR (Simple LR) resolves conflicts using the global `FOLLOW` set. Its main disadvantage is that it may attempt to reduce using a symbol from the `FOLLOW` set that is invalid in a specific parsing state, leading to unresolvable Shift/Reduce conflicts on complex grammars.

**6. What is inherited attribute?**
In Syntax Directed Translation, an inherited attribute is one whose value at a node in a parse tree is defined in terms of the attributes of its parent node and/or its sibling nodes.

**7. Define flow graph.**
A flow graph is a directed graph used in code optimization where the nodes represent **basic blocks** (sequences of straight-line code) and the directed edges represent the flow of control (branches/jumps) between those basic blocks.

**8. What is Dead code?**
Dead code refers to instructions in the program that either compute values that are never used subsequently or are entirely unreachable during any execution path (like code after a `return`).

**9. What is Annotated parse tree?**
An annotated parse tree is a standard parse tree where each node is augmented (annotated) with attribute values computed according to semantic rules.

**10. Define Ambiguous grammar.**
A context-free grammar is ambiguous if it can generate more than one valid parse tree (or equivalently, more than one leftmost/rightmost derivation) for the exact same input string. Example: `E -> E + E | E * E | id`.

**11. What is a Reducible Graph?**
A flow graph is reducible if its edges can be partitioned into two disjoint sets: forward edges (which form an acyclic graph) and back edges (where the target node strictly dominates the source node). Structured programs always produce reducible flow graphs.

**12. Define Activation Record.**
An Activation Record (or Stack Frame) is a contiguous block of memory allocated on the run-time stack when a procedure is called. It stores local variables, parameters, the return address, and saved machine registers.

**13. What is Heap Management?**
Heap management is the process by which the OS allocates and deallocates dynamic memory at runtime (e.g., `malloc`). It handles objects whose sizes are unknown at compile time or whose lifetimes outlive their creating procedure.

**14. What is Data flow analysis?**
A global optimization technique used to gather information about how variables are defined, used, and modified across multiple basic blocks in a program's control flow graph.

**15. What is Common Sub expression Elimination?**
An optimization where the compiler identifies identical expressions evaluated multiple times without operands changing. It computes the expression once, stores the result, and replaces subsequent evaluations.

**16. Define Global Optimization.**
Code-improving transformations that analyze and optimize code across the boundaries of basic blocks (throughout an entire procedure), relying on Control Flow Graphs and Data Flow Analysis.

**17. Define syntax-directed definition (SDD).**
An SDD is a context-free grammar where each symbol is associated with attributes, and each production rule is associated with semantic rules dictating how those attributes are computed.

**18. What is a predictive parser?**
A top-down (recursive descent) parser that does not require backtracking. It uses a lookahead symbol to uniquely determine which production rule to apply (requires LL(1) grammar).

**19. What are compiler construction tools?**
Specialized software tools that automate the creation of compiler phases. Examples include Scanner Generators (Lex) and Parser Generators (Yacc).

---

# 📙 PART B: Long Answers (10-12 Marks)

## 1. Explain the phases of a compiler in detail with a neat diagram. Write the output of each phase for `C = a * b + 10`.

**Theoretical Background:**
A compiler consists of six main phases, supported by a **Symbol Table Manager** (which stores identifiers and their attributes) and an **Error Handler** (which detects and recovers from errors).

```text
                       Source Program 
                             |
                     [ Lexical Analyzer ] <--------+
                             |                     |
                     (Stream of Tokens)            |
                             |                     |
                     [ Syntax Analyzer  ] <--------+
                             |                     |
                       (Syntax Tree)               |
                             |                     |
+----------------->  [ Semantic Analyzer] <--------+  <------------------+
|                            |                     |                     |
|                  (Annotated Syntax Tree)         |                     |
|                            |                     |                     |
| Symbol Table       [ Intermediate Code] <--------+    Error Handler    |
| Manager            [    Generator     ]          |                     |
|                            |                     |                     |
|                   (Three-Address Code)           |                     |
|                            |                     |                     |
|                    [ Code Optimizer   ] <--------+                     |
|                            |                     |                     |
|                   (Optimized 3AC Code)           |                     |
|                            |                     |                     |
+----------------->  [ Code Generator   ] <--------+  <------------------+
                             |
                     Target Machine Code 
```

**Output trace for `C = a * b + 10`:**
1.  **Lexical Analysis:** Scans characters and groups into tokens.
    `<id,1> <=,> <id,2> <*,> <id,3> <+,> <num,10>`
2.  **Syntax Analysis:** Verifies grammar, produces a Syntax Tree.
    *(Root is `=`, left is `C`, right is `+`. Under `+`, left is `*` (children `a`, `b`) and right is `10`)*.
3.  **Semantic Analysis:** Checks semantic consistency (type coercion).
    The leaf `10` becomes `inttofloat(10)`.
4.  **Intermediate Code Generation:** Generates 3AC.
    `t1 = inttofloat(10)`
    `t2 = a * b`
    `t3 = t2 + t1`
    `C = t3`
5.  **Code Optimization:** Improves intermediate code.
    `t1 = a * b`
    `C = t1 + 10.0`
6.  **Code Generation:** Maps to target machine registers.
    `MOVF b, R1`
    `MULF a, R1`
    `ADDF #10.0, R1`
    `MOVF R1, C`

---

## 2. Compare SLR, CLR, and LALR parsers with advantages and disadvantages.

| Feature | SLR (Simple LR) | LALR (Look-Ahead LR) | CLR (Canonical LR) |
| :--- | :--- | :--- | :--- |
| **Items Used** | LR(0) Items | LR(1) Items (Merged) | LR(1) Items |
| **Lookahead** | Uses global FOLLOW sets. | Inherited from CLR. | Exact specific lookaheads. |
| **Number of States**| Smallest | Smallest (same as SLR) | Largest (Huge number of states) |
| **Power**| Least Powerful. | Moderately Powerful. | Most Powerful. |

*   **SLR:** *Advantage:* Easy to implement, smallest parsing tables. *Disadvantage:* Fails on many programming languages due to over-generalizing the FOLLOW set, causing Shift/Reduce conflicts.
*   **CLR:** *Advantage:* Most powerful, parses the widest range of grammars. *Disadvantage:* Parsing table is astronomically large; highly inefficient memory-wise.
*   **LALR:** *Advantage:* The perfect balance; powerful enough for most programming languages (used in YACC) while keeping the state count as small as SLR. *Disadvantage:* Merging states can occasionally introduce new Reduce/Reduce conflicts.

---

## 3. Construct SLR parser for: `E->E+T | T`, `T->T*F | F`, `F->(E) | id`.

**Step 1: Augmented Grammar**
`0. E' -> E`
`1. E -> E + T`
`2. E -> T`
`3. T -> T * F`
`4. T -> F`
`5. F -> ( E )`
`6. F -> id`

**Step 2: FIRST and FOLLOW Sets**
*   FOLLOW(E) = `{ +, ), $ }`
*   FOLLOW(T) = `{ +, *, ), $ }`
*   FOLLOW(F) = `{ +, *, ), $ }`

**Step 3: LR(0) Canonical Collection (States)**
*   **I0:** `E'->.E`, `E->.E+T`, `E->.T`, `T->.T*F`, `T->.F`, `F->.(E)`, `F->.id`
*   **I1:** Goto(I0, E): `E'->E.`, `E->E.+T`
*   **I2:** Goto(I0, T): `E->T.`, `T->T.*F`
*   **I3:** Goto(I0, F): `T->F.`
*   **I4:** Goto(I0, '('): `F->(.E)`, `E->.E+T`...
*   **I5:** Goto(I0, id): `F->id.`
*   *(Additional states I6 to I11 are derived by shifting through the operators).*

**Step 4: SLR Parsing Table Actions**
*   *Rule for Reduction:* If state has `A->α.`, REDUCE on all terminals in `FOLLOW(A)`.
*   State I1 has `E'->E.`: Put **Accept** at `$`.
*   State I2 has `E->T.`: Put **R2** at `+`, `)`, `$`.
*   State I3 has `T->F.`: Put **R4** at `+`, `*`, `)`, `$`.
*   State I5 has `F->id.`: Put **R6** at `+`, `*`, `)`, `$`.

---

## 4. Illustrate various implementations of Three Address Code.

**Example Expression:** `a = b * -c + b * -c`
3AC Sequence: `t1 = uminus c`, `t2 = b * t1`, `t3 = uminus c`, `t4 = b * t3`, `t5 = t2 + t4`, `a = t5`.

**1. Quadruples:** Explicit fields `(Operator, Arg1, Arg2, Result)`. Easy to reorder, consumes heavy memory.
| # | Op | Arg 1 | Arg 2 | Result |
| :---: | :---: | :---: | :---: | :---: |
| 0 | uminus | c | | t1 |
| 1 | * | b | t1 | t2 |

**2. Triples:** Uses `(Operator, Arg1, Arg2)`. Refers to previous results by line number. Hard to optimize (moving breaks references).
| # | Op | Arg 1 | Arg 2 |
| :---: | :---: | :---: | :---: |
| (0) | uminus | c | |
| (1) | * | b | (0) |

**3. Indirect Triples:** Uses Triples table, but with an **Instruction Array** (pointers) to dictate execution order. Easy to optimize by reordering pointers.

---

## 5. Explain in detail about Global Data Flow Analysis.

Data Flow Analysis collects information about the way variables are used, defined, and modified along various execution paths in a Control Flow Graph (CFG).

Equations are set up for each basic block `B`:
`OUT[B] = GEN[B] U (IN[B] - KILL[B])`

**Types of Data Flow Problems:**
1.  **Reaching Definitions:** Determines which definitions of a variable `x` can reach a particular point without being overwritten. Used for Constant Propagation.
2.  **Live Variable Analysis:** A variable is "live" if its value is used along some path before being overwritten. Crucial for **Register Allocation** and **Dead Code Elimination**. (Backward flow).
3.  **Available Expressions:** An expression `x + y` is "available" if every path to a point evaluates it without reassigning `x` or `y`. Used for Global Common Sub-expression Elimination.

---

## 6. Write a Code Generation Algorithm. Give an example.

**Algorithm:**
Generates machine code from 3AC using **Register Descriptors** (what is in a register) and **Address Descriptors** (where a variable is located).

For a 3AC statement `x = y op z`:
1.  Call `getReg(x = y op z)` to select a register `R` for result `x`.
2.  Check address descriptor of `y`. If `y` is not in `R`, generate: `MOV y, R`.
3.  Check address descriptor of `z`. Generate: `OP z, R` (meaning `R = R op z`).
4.  Update `R`'s register descriptor to show it contains `x`. Update `x`'s address descriptor to show its value is in `R`. Free dead registers.

**Example:** (`t = a - b`, `u = a - c`, `v = t + u`)
| 3AC | Target Code Generated | Reg Descriptors | Addr Descriptors |
| :--- | :--- | :--- | :--- |
| `t = a - b` | `MOV a, R0` <br> `SUB b, R0` | R0 contains `t` | `t` is in R0 |
| `u = a - c` | `MOV a, R1` <br> `SUB c, R1` | R0 holds `t`, R1 holds `u` | `t` in R0, `u` in R1 |
| `v = t + u` | `ADD R1, R0` | R0 contains `v` | `v` is in R0 |

---

## 7. Explain about various storage allocation strategies.

1.  **Static Allocation:** All memory addresses bound at compile time. Space reserved in static data area. *Limitation:* Forbids recursion.
2.  **Stack Allocation:** Memory managed dynamically (LIFO). On function call, an **Activation Record (Stack Frame)** is pushed. Contains: Actual Parameters, Return Values, Control Link, Saved Machine Status, Local Variables. *Advantage:* Supports recursion.
3.  **Heap Allocation:** Highly dynamic memory (e.g., `malloc`). Used for objects whose lifetimes outlive their function. *Drawback:* Prone to fragmentation.

---

## 8. Briefly explain different sources of Code Optimization.

1.  **Constant Folding:** Evaluating constant expressions at compile time (`pi = 22/7.0` -> `3.14`).
2.  **Common Sub-expression Elimination:** Reusing previously computed values (`x=a+b; y=a+b` -> `t=a+b; x=t; y=t`).
3.  **Copy Propagation:** Replacing a variable with its assigned value to expose dead code.
4.  **Dead Code Elimination:** Removing code never executed or values never used.
5.  **Loop Optimizations:** *Code Motion* (moving loop-invariant calculations outside) and *Strength Reduction* (replacing multiplication with addition).

---

## 9. Construct Predictive Parsing Table (LL1) for: `E->E+T | T; T->T*F | F; F->(E) | id`

**Step 1: Eliminate Left Recursion**
*   `E -> T E'`   |   `E' -> + T E' | ε`
*   `T -> F T'`   |   `T' -> * F T' | ε`
*   `F -> ( E ) | id`

**Step 2: Find FIRST and FOLLOW Sets**
*   **FIRST:** E, T, F = `{ (, id }`. E' = `{ +, ε }`. T' = `{ *, ε }`.
*   **FOLLOW:** E, E' = `{ ), $ }`. T, T' = `{ +, ), $ }`. F = `{ *, +, ), $ }`.

**Step 3: Predictive Table Construction**
| Non-Terminal | id | + | * | ( | ) | $ |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **E** | E -> T E' | | | E -> T E' | | |
| **E'**| | E' -> + T E'| | | E' -> ε | E' -> ε |
| **T** | T -> F T' | | | T -> F T' | | |
| **T'**| | T' -> ε | T' -> * F T'| | T' -> ε | T' -> ε |
| **F** | F -> id | | | F -> ( E ) | | |

---

## 10. Write about Syntax Directed Definition (SDD) & rules for a Desktop Calculator.

An SDD is a grammar augmented with **attributes** and **semantic rules**.
*   **S-attributed:** Uses ONLY synthesized attributes (evaluated bottom-up).
*   **L-attributed:** Uses synthesized and inherited attributes.

**Semantic Rules for Desktop Calculator (S-Attributed):**
| Production Rule | Semantic Rule (Action) |
| :--- | :--- |
| `L -> E \n` | `print(E.val)` |
| `E -> E1 + T` | `E.val = E1.val + T.val` |
| `T -> T1 * F` | `T.val = T1.val * F.val` |
| `F -> ( E )` | `F.val = E.val` |
| `F -> digit` | `F.val = digit.lexval` |

---

## 11. Briefly explain about the LEX Compiler.

LEX is a tool used to automatically generate lexical analyzers. It takes a file containing Regular Expressions and outputs a C program (`lex.yy.c`) implementing a DFA to recognize those tokens.

**Structure of a LEX Program (`.l` file):**
```c
%{
   /* 1. Declarations: C variables, includes */
   int count = 0;
%}
/* 2. Definitions: Regular expressions */
digit    [0-9]
%%
   /* 3. Rules: Pattern { Action } */
{digit}+   { printf("Number: %s", yytext); }
%%
   /* 4. C Functions: main() */
int main() {
    yylex();
    return 0;
}
```

---

## 12. Algorithms for finding FIRST and FOLLOW positions.

**Algorithm for FIRST(X):**
1.  If `X` is terminal, `FIRST(X) = { X }`.
2.  If `X -> ε` exists, add `ε` to `FIRST(X)`.
3.  If `X -> Y1 Y2 ... Yk`: Add non-`ε` symbols of `FIRST(Y1)`. If `FIRST(Y1)` has `ε`, add non-`ε` of `FIRST(Y2)`. If all have `ε`, add `ε`.

**Algorithm for FOLLOW(A):**
1.  Place `$` in `FOLLOW(Start)`.
2.  If `A -> α B β`, add everything in `FIRST(β)` except `ε` to `FOLLOW(B)`.
3.  If `A -> α B`, or `A -> α B β` where `FIRST(β)` contains `ε`, add everything in `FOLLOW(A)` to `FOLLOW(B)`.

---

## 13. Explain issues in Code Generation in detail.

1.  **Input to Code Generator:** Must handle IR and access Symbol Table. Errors here break generation.
2.  **Target Program Output:** Choose between Absolute machine language, Relocatable object files (needs linking), or Assembly.
3.  **Instruction Selection:** Choosing the optimal instructions (e.g., `INC a` instead of `ADD a, 1`).
4.  **Register Allocation:** Deciding which variables sit in fast CPU registers vs slow RAM to avoid "register spilling".
5.  **Evaluation Order:** The order of evaluating nodes dictates how many registers are required (e.g., left-to-right vs right-to-left).

---

## 14. Define basic block and write an Algorithm to construct basic blocks.

**Basic Block:** A sequence of consecutive statements where control enters at the first statement and leaves at the last statement without branching.

**Algorithm:**
1.  **Find Leaders:** The first statement is a leader. Any target of a `goto` is a leader. Any statement following a `goto` is a leader.
2.  **Form Blocks:** A basic block consists of a leader and all statements up to (but not including) the next leader.

---

## 15. Explain Peephole Optimization and Input Buffering.

**Peephole Optimization:** Local optimization on target code examining a sliding window ("peephole").
*   *Techniques:* Redundant Load/Store Elimination, Unreachable Code Elimination, Flow of Control Optimization (jumping directly to final target), Algebraic Simplification (`x * 1`).

**Input Buffering & Sentinels:**
The lexer reads code character-by-character. To speed this up, two large buffers are loaded into RAM. 
*   **Sentinels:** The compiler places an `EOF` (Sentinel) at the very end of the buffer. This allows the lexer to combine the "end of buffer" check and "end of file" check into one highly optimized step, drastically speeding up compilation.
