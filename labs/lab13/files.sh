#!/bin/bash
action=$1
N=$2

if [ "$action" = "create" ]
then
    for i in $(seq 1 $N)
    do
        touch "$i.tmp"
        echo "Created $i.tmp"
    done
elif [ "$action" = "delete" ]
then
    for i in $(seq 1 $N)
    do
        if test -f "$i.tmp"
        then
            rm "$i.tmp"
            echo "Deleted $i.tmp"
        fi
    done
else
    echo "Usage: ./files.sh create N or ./files.sh delete N"
fi
