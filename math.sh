#!/bin/bash

NUMBERS=()
while [[ "$#" -gt 0 ]]; do
    case "$1" in
    -o)
        OPERATION="$2"
        shift 2
        ;;
    -n)
        shift
        RESULT=$1   # stores first operand
        shift
        while [[ "$1" != -* && "$#" -gt 0 ]]; do    # stores the rest of the operands
            NUMBERS+=("$1")
            shift
        done
        ;;
    -d)
        echo "USER: $USER"
        echo "SCRIPT: $0"
        echo "OPERATION: $OPERATION"
        echo -n "NUMBERS: $RESULT "
        for N in ${NUMBERS[@]}; do echo -n "$N "; done
        echo ""
        shift 1
        ;;
    *)
        echo "Unknown option: $1"
        echo "In case you meant to multiply, please use '\\*' instead"
        exit 1
        ;;
    esac
done

for N in ${NUMBERS[@]}; do
    RESULT=$(( $RESULT $OPERATION $N ))
done
echo $RESULT