#!/bin/bash

# Input file
input_file="keys.txt"

# Output file prefix
output_prefix="keys_"

# Number of lines per output file
lines_per_file=2000

# Split the input file into smaller files
split --lines=$lines_per_file --additional-suffix=".txt" $input_file $output_prefix