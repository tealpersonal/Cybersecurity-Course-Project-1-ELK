#!/bin/bash

grep -e '05:00' -e '08:00' -e '11:00' -e '02:00' $1 | awk -F'\t' '{print '$1', $1, $2, $3, $4}' | sed s/_Dealer_schedule.txt// > ddt_$1.txt
#grep 'Mylie' /home/sysadmin/Homework/HW3/Lucky_Duck_Investigations/Player_Analysis 
