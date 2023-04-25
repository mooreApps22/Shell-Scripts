#!/bin/bash

# Check if enough arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Parameters: $0 <names> <number of directories>"
  exit 1
fi

names=$1

# Check if the input is a positive integer
if [[ $2 =~ ^[0-9]+$ ]]; then
  num_dirs=$2
else
  echo "Please provide a positive integer as the number of directories to create."
  exit 1
fi

# Create the directories
for ((i=0; i<=num_dirs; i++)); do
  dir_name=$(printf "%s%02d" "$names" $i)
  mkdir "$dir_name"
  echo "Created directory: $dir_name"
done
