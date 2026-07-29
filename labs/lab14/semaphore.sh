#!/bin/bash
lockfile=/tmp/semaphore.lock
t1=10
t2=5

while true
do
    if [ ! -f "$lockfile" ]
    then
        echo "Resource is free. Acquiring resource..."
        touch "$lockfile"
        echo "Resource is being used by process $$"
        sleep $t2
        rm "$lockfile"
        echo "Resource released by process $$"
        break
    else
        echo "Resource is busy. Waiting..."
        sleep 1
    fi
done
