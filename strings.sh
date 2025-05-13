#!/bin/bash

: ${5?"USAGE: -i [string:input_file] -o [string:output_file] [-v | -s | -r | -l | -u]"}

if [[ $5 == "-s" ]]; then
    : ${7?"USAGE: -i [string:input_file] -o [string:output_file] [-v | -s <A_WORD> <B_WORD> | -r | -l | -u]"}  
fi

while [[ "$#" -gt 0 ]]; do
    case "$1" in
    -i)
        INPUT="$2"
        shift 2
        ;;
    -o)
        OUTPUT="$2"
        shift 2
        ;;
    -v)
        # Replaces $INPUT lowercase characters with uppercase and vise versa
        REPLACED=$(echo `cat "$INPUT"` | tr 'a-zA-Z' 'A-Za-z')
        echo -n $REPLACED > $OUTPUT
        shift
        ;;
    -s)
        # Substitutes $INPUT <A_WORD> with <B_WORD>
        A_WORD="$2"
        B_WORD="$3"
        SUBSTITUTED=$(echo `cat "$INPUT"` | sed "s/$A_WORD/$B_WORD/g")
        echo -n $SUBSTITUTED > $OUTPUT
        shift 3
        ;;
    -r)
        # Reverses $INPUT lines
        REVERSED=$(tac "$INPUT")
        echo "$REVERSED" > $OUTPUT
        shift
        ;;
    -l)
        LOWERCASE=$(echo `cat "$INPUT"` | tr 'A-Z' 'a-z')
        echo -n $LOWERCASE > $OUTPUT
        shift
        ;;
    -u)
        UPPERCASE=$(echo `cat "$INPUT"` | tr 'a-z' 'A-Z')
        echo -n $UPPERCASE > $OUTPUT
        shift
        ;;
    *)
        echo "Unknown option: $1"
        exit 1
        ;;
    esac
done