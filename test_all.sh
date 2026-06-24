#!/bin/bash
cd /mnt/d/User/Desktop/SE/CD_Lab_Programs || exit 1

echo "Starting tests..."
fails=0
success=0

for q in Question_*; do
    if [ -d "$q" ]; then
        cd "$q" || continue
        echo "Testing $q..."
        
        compiled=0
        
        # Determine what to compile
        if [ -f "program.y" ] && [ -f "program.l" ]; then
            bison -y -d program.y >/dev/null 2>&1
            flex program.l >/dev/null 2>&1
            gcc lex.yy.c y.tab.c -o run_program -ll >/dev/null 2>&1 || gcc lex.yy.c y.tab.c -o run_program -lfl >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                compiled=1
            fi
            rm -f lex.yy.c y.tab.c y.tab.h run_program
            
        elif [ -f "parser.y" ] && [ -f "lexer.l" ]; then
            bison -y -d parser.y >/dev/null 2>&1
            flex lexer.l >/dev/null 2>&1
            gcc lex.yy.c y.tab.c -o run_program -ll >/dev/null 2>&1 || gcc lex.yy.c y.tab.c -o run_program -lfl >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                compiled=1
            fi
            rm -f lex.yy.c y.tab.c y.tab.h run_program
            
        elif [ -f "parser.y" ]; then
            bison -y -d parser.y >/dev/null 2>&1
            gcc y.tab.c -o run_program >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                compiled=1
            fi
            rm -f y.tab.c y.tab.h run_program
            
        elif [ -f "program.y" ]; then
            bison -y -d program.y >/dev/null 2>&1
            gcc y.tab.c -o run_program >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                compiled=1
            fi
            rm -f y.tab.c y.tab.h run_program
            
        elif [ -f "program.l" ]; then
            flex program.l >/dev/null 2>&1
            gcc lex.yy.c -o run_program -ll >/dev/null 2>&1 || gcc lex.yy.c -o run_program -lfl >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                compiled=1
            fi
            rm -f lex.yy.c run_program
            
        elif [ -f "lexer.l" ]; then
            flex lexer.l >/dev/null 2>&1
            gcc lex.yy.c -o run_program -ll >/dev/null 2>&1 || gcc lex.yy.c -o run_program -lfl >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                compiled=1
            fi
            rm -f lex.yy.c run_program
            
        elif [ -f "program.c" ]; then
            gcc program.c -o run_program >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                compiled=1
            fi
            rm -f run_program
            
        else
            echo "  [SKIP] $q has unknown files."
            cd ..
            continue
        fi
        
        if [ $compiled -eq 1 ]; then
            echo "  [OK] $q compiled successfully."
            success=$((success+1))
        else
            echo "  [FAIL] $q failed to compile."
            fails=$((fails+1))
        fi
        
        cd ..
    fi
done

echo "Tests complete. Success: $success, Fails: $fails"
