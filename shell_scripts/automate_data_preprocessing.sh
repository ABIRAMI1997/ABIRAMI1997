#!/bin/bash

curr="$(pwd)/archieve.log"
exec 2>"$curr"
set -x

#data file with keys
data_file="keys.txt"
output_prefix="keys_"

#split command to split the keys based on number of rows
lines_per_file=3
split --lines=$lines_per_file --additional-suffix=".txt" $data_file $output_prefix

#code to rename the file 
# Path to input files and template file
files=keys_*.txt

# Rename input files to mcsl_1.json, mcsl_2.json, etc.
count=1
for file in keys_*.txt;
do
  mv $file Mcsl_$count.json
  count=$((count+1))
done

# set the input and output file patterns
input_pattern="Mcsl_*.txt"
output_pattern="Mcsl_*.out"

# loop through all input files and process them
for input_file in Mcsl_*.json; do

    # read the input file and store the contents in an array
    declare -a claimkeys=()
    while IFS=$'\r' read -r line || [[ -n "$line" ]]; do
        claimkeys+=("${line//$'\n'}")
    done < "$input_file"

    # loop through the array and format each claimkey
    for i in "${!claimkeys[@]}"; do
        claimkeys[$i]="'${claimkeys[$i]}'"
    done

    # write the formatted claimkeys back to the input file
    printf "%s," "${claimkeys[@]}" | sed 's/,$//' > "$input_file"

    # generate the output file name
    output_file=$(echo "$input_file"  | sed "s/\.txt$/.out/")

    # substitute the claimkeys into the template and write to the output file
    template=$(cat "template.txt")
    output=$(echo "$template" | sed "s/\?/$(printf "%s," "${claimkeys[@]}" | sed 's/,$//')/g")
    echo "$output" > "$output_file"



done

set +x

