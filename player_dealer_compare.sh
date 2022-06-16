#!/bin/bash/

rm Dealers_working_during_hours.txt
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13; #this is so ugly i'm sorry i tried getting other loops working
do
	l=$(head -$i ~/Homework/HW3/Lucky_Duck_Investigations/Player_Analysis/Roulette_Losses | tail +$i |  awk '{print $1,$2,$3}') #grabbing the date and time per line
	grep "$l" ~/Homework/HW3/Lucky_Duck_Investigations/Dealer_Analysis/ddt_total.txt >> Dealers_working_during_hours.txt
done

