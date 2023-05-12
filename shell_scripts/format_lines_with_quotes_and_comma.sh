#!/bin/bash

# read the input file and store the contents in an array
declare -a claimkeys=()
while IFS=$'\r' read -r line || [[ -n "$line" ]]; do
    claimkeys+=("${line//$'\n'}")
done < "input_file.txt"

# loop through the array and format each claimkey
for i in "${!claimkeys[@]}"; do
  claimkeys[$i]="'${claimkeys[$i]}'"
done

# write the formatted claimkeys back to the file
printf "%s," "${claimkeys[@]}" | sed 's/,$//' > "input_file.txt"

#input_file.txt
#123
#1234
#34534
#543
#Formated_output
#'123','1234','34534','543'
