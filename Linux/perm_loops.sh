#!/bin/bash

files=( '/etc/passwd' '/etc/shadow' ) #filepaths for files to test permissions

for file in ${files[@]}; do
	ls -l $file #print file permissions to stdout
done

users=( $(ls /home/) ) #puts all users in home directory into an array

for user in ${users[@]}; do
	sudo -lU  $user
done
