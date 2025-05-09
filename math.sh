#!/bin/bash

while [[ "$#" -gt 0 ]]; do
    case "$1" in
    -o)
        OPERATION="$2"
        shift 2
        ;;
    -n)
        N1="$2"
        N2="$3"
        shift 3
        ;;
    -d)
        echo "USER: $USER"
        echo "SCRIPT: $0"
        echo "OPERATION: $OPERATION"
        echo "N1: $N1 N2: $N2"
        shift 1
        ;;
    *)
        echo "Unknown option: $1"
        echo "In case you meant to multiply, please use '\\*' instead"
        exit 1
        ;;
    esac
done

echo $(( $N1 $OPERATION $N2 ))