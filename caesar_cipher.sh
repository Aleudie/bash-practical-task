#!/bin/bash

: "${6?"USAGE: -s [int:shift] -i [string:input_file] -o [string:output_file]"}"

SHIFT="$2"
INPUT="$4"
OUTPUT="$6"

# === Main Script ===
SHIFT=$((SHIFT % 26))

# Build rotated alphabets dynamically
ORIG=abcdefghijklmnopqrstuvwxyz
ROTATED=${ORIG:$SHIFT}${ORIG:0:$SHIFT}

# Lowercase contents of input file
PLAINTEXT=$( < "$INPUT" tr '[:upper:]' '[:lower:]')

# Encrypt contents using tr
CIPHERTEXT=$(echo "$PLAINTEXT" | tr "$ORIG" "$ROTATED")

echo -n "$CIPHERTEXT" > "$OUTPUT"