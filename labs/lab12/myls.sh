#!/bin/bash
dir=${1:-.}
echo "Contents of directory: $dir"
echo "----------------------------"
for file in "$dir"/*
do
    if test -d "$file"
    then
        echo "$file: directory"
    elif test -w "$file"
    then
        echo "$file: file (writable)"
    elif test -r "$file"
    then
        echo "$file: file (readable)"
    else
        echo "$file: file (no access)"
    fi
done
