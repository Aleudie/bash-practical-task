#!/bin/bash

for i in {1..100}; do
    RESULT=""
    if [[ $((i % 3)) == 0 ]]; then
        RESULT+="Fizz"
    fi
    if [[ $((i % 5)) == 0 ]]; then
        RESULT+="Buzz"
    fi
    if [[ ${#RESULT} -eq 0 ]]; then
        echo -n "$i "
    fi
    echo "$RESULT"
done