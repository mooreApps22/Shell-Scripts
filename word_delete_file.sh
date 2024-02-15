#!/bin/bash

# Check if a file name is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File does not exist: $filename"
    exit 1
fi

# Use sed to delete lines containing the pattern .SH
sed -i '/.nf/d' "$filename"
sed -i '/.fi/d' "$filename"

echo "Pattern has been removed from $filename."
