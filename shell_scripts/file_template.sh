#!/bin/bash
#data_file="C:\Users\ABIRAMI\OneDrive\Documents\2023-job_search\GIT-Repos\Shell_scripting\archieve_directory\input_file.txt"
#template_file="C:\Users\ABIRAMI\OneDrive\Documents\2023-job_search\GIT-Repos\Shell_scripting\archieve_directory\template_file.txt"
#output_file="C:\Users\ABIRAMI\OneDrive\Documents\2023-job_search\GIT-Repos\Shell_scripting\archieve_directory"


#replaces the value from multiplt input file and places it in a dynamic template and output's the multiple output file
for data_file in Mcsl*.txt; do
	output_file="${data_file%.txt}.out"
	values=$(cat "$data_file")
	result=$(cat "template_file.txt" | sed "s/\?/$values/g")
	echo "$result" > "$output_file"
done








