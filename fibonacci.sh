#!/bin/bash
: ${1?"n: $1 integer expected"}

N=$1
function fib {
    if [ $1 -lt 2 ]; then
        echo $1
    else
        local a=$(fib $(($1 - 1)))
        local b=$(fib $(($1 - 2)))
        echo $(($a + $b))
    fi
}

fib $N