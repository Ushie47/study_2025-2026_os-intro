#!/bin/bash
ext=$1
dir=$2
count=$(find "$dir" -name "*$ext" | wc -l)
echo "Number of $ext files in $dir: $count"
