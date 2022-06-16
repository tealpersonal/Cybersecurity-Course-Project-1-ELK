#!/bin/bash/

#input time must be in single or double quotes. must be in HH:MM:SS AM/PM format
#date is handled by filename, as all files are separated by dates in the file system
grep "$1" $2 | awk -F'\t' '{print $1, $2, $3, $4}' 
