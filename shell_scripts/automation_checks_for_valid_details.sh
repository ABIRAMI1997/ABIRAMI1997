#check if these three lines are in the starting of the script
#Script Name: practice.sh 
#Developer name: Abirami
#Modified: 01/03/2023


#!/bin/bash

input_file="template.txt"

if head -n 3 "$input_file" | grep -qi -vE 'Script Name:|Developer Name:|Modified:'; then
    echo "Invalid input file format"
else
    echo "Input file format is valid"
fi > valid_template.txt
