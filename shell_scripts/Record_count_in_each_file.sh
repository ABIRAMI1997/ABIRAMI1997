#!/bin/bash


for file in keys_*.txt; do echo "$file: $(wc -l < "$file")"; done > records_count.txt