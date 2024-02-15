#!/bin/bash

# Replace 'old_word' with 'new_word' in all files in the current directory

# Loop through all files in the current directory
for file in *.c; do
    # Check if it's a regular file (not a directory or a link, etc.)
    if [ -f "$file" ]; then
        # Using sed to replace 'word1' with 'word2'
        sed -i 's|"word1"|"word2"|g' "$file"
    fi
done
