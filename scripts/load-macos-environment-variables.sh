#!/bin/zsh

source ~/.config/zsh/.zshrc

old_IFS=$IFS
IFS=$'\n'
# loop through all environment variables
for var in $(env); do
	# extract variable name and value from the output of the env command
	varname=$(echo "$var" | cut -d= -f1)
	varvalue=$(echo "$var" | cut -d= -f2-)

	# print the variable name and value in the specified format
	launchctl setenv "$varname" "$varvalue"
done

IFS=$old_IFS
