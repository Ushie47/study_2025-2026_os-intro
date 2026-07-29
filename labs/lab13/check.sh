#!/bin/bash
./check_number
result=$?

case $result in
    0) echo "The number is equal to zero";;
    1) echo "The number is greater than zero";;
    2) echo "The number is less than zero";;
esac
