#!/bin/bash

echo System Info - date >> ~/research/sys_info.txt
uname -a >> ~/research/sys_info.txt
hostname -I >> ~/research/sys_info.txt
hostname >> ~/research/sys_info.txt

outputFile=$HOME/research/sys_info.txt

if [-d ~/research ]
then
	echo "The ~/research directory already exists"
	exit
else
	mkdir ~/research
fi

echo -e "\n 777 files:" >> $outputFile
find / -type f -perm 777 >> $outputFile

echo -e "Top 10 Processes:" >> $outputFile
ps axu -m | awk {'print $1, $2, $3, $4, $11' | head >> $outputFile


