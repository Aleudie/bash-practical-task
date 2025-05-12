#!/bin/bash

: ${6?"USAGE: -s [int:shift] -i [string:input_file] -o [string:output_file]"}

# === Function Definitions ===
char_to_ascii() {
    printf "%d\n" "'$1"
}

ascii_to_char() {
    local ASCII=$1
    while [[ ASCII -gt 122 ]]; do
        ASCII=$(($ASCII - 26))
    done
    printf "\\x$(printf '%x' "$ASCII")\n"
}

# === Input parameters ===
while [[ "$#" -gt 0 ]]; do
    case "$1" in
    -s)
        SHIFT="$2"
        shift 2
        ;;
    -i)
        INPUT="$2"
        shift 2
        ;;
    -o)
        OUTPUT="$2"
        shift 2
        ;;
    *)
        echo "Unknown option: $1"
        exit 1
        ;;
    esac
done


# === Main Script ===
echo "" > $OUTPUT
while IFS= read -r -n1 char; do
    if [[ "$char" =~ [A-Za-z] ]]; then
        char=$(echo "$char" | tr 'A-Z' 'a-z')
        char=$( char_to_ascii $char )
        char=$(( $char + $SHIFT ))
        char=$( ascii_to_char $char )
    fi
    printf "$char" >> $OUTPUT
    
done < $INPUT