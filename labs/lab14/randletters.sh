#!/bin/bash
length=${1:-10}
letters=""

for i in $(seq 1 $length)
do
    index=$((RANDOM % 26))
    letter=$(echo {a..z} | tr ' ' '\n' | sed -n "$((index+1))p")
    letters="$letters$letter"
done

echo "Random sequence: $letters"
