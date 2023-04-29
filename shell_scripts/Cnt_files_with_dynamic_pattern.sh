# Command line : sh sh Cnt_files_with_ABC_pattern.sh abi
#abi = pattern needes to be searched

#!/bin/bash


#logs
curr="$(pwd)/archieve.log"
exec 2>"$curr"
set -x

#dynamic pattern
pattern="$1"

#append file name with today's date
date=$(date +"%Y-%m-%d")

# Set the search path and pattern
path=$(pwd)
#pattern="ABC"

#count of files with pattern
count=$(ls -1 "$pattern"* | wc -l)
echo "The number of files starting with $pattern in the current directory is: $count"

#rename the file with today's date
for file in "$pattern"*; do
	echo "$file"
    mv "$file" "${file%.*}_$date.${file##*.}"
done

#redirect the renamed file names to new file
ls *$date* > renamed_files.txt

set +x

