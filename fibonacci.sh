#!/bin/bash
: "${1?"n: $1 integer expected"}"

N=$1
function fib {
    local a
    local b
    if [ "$1" -lt 2 ]; then
        echo "$1"
    else
        a=$(fib $(($1 - 1)))
        b=$(fib $(($1 - 2)))
        echo $((a + b))
    fi
}

fib "$N"