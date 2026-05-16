#!/bin/bash
if [ -z "$1" ]
then
    echo "Usage: ./myman.sh <command>"
    exit 1
fi

manfile=$(find /usr/share/man/man1 -name "$1*" | head -1)

if [ -z "$manfile" ]
then
    echo "No manual entry found for $1"
else
    less "$manfile"
fi
