#!/bin/bash

# Replace 'word1' with 'word2' in a specified file

# Check if a file name is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# File to be processed
file="$1"

# Using sed to replace '/word1/' with '/word2/'
sed -i 's/"word1"/"word2:wq"/g' "$file"
