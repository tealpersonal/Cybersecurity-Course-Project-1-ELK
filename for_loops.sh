#!/bin/bash

states=(Jersey Pennsylvania Illinois Hawaii Vermont)

for state in ${states[@]}
 do
  if [ $state == 'Hawaii' ]
   then
    echo "Hawaii is kawaii!"
   else
    echo "I'm not fond of Hawaii."
  fi
done
