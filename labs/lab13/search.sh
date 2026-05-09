#!/bin/bash
inputfile=""
outputfile=""
pattern=""
case_flag=""
line_flag=""

while getopts "i:o:p:Cn" opt
do
    case $opt in
        i) inputfile=$OPTARG;;
        o) outputfile=$OPTARG;;
        p) pattern=$OPTARG;;
        C) case_flag="-i";;
        n) line_flag="-n";;
        *) echo "Unknown option: $opt";;
    esac
done

if [ -z "$inputfile" ] || [ -z "$pattern" ]
then
    echo "Error: input file and pattern are required"
    exit 1
fi

if [ -n "$outputfile" ]
then
    grep $case_flag $line_flag "$pattern" "$inputfile" > "$outputfile"
    echo "Results saved to $outputfile"
else
    grep $case_flag $line_flag "$pattern" "$inputfile"
fi
