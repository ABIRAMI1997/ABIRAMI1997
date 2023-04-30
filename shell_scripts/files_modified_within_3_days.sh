#!/bin/bash

 find . -type f -newermt "-3 days" -print0 | xargs -0 stat --format="%y %n" | sort -k1,1 -n | awk '{print $0}' > modified_files.txt


