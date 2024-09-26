#!/bin/bash

declare -i n=1
declare -i ct=1

str="0123456789876543210"
echo $str

for ((i=1;i<10;i++)); do 
	n=$(( i * -1 ))
	ct=1
	while [[ $ct -le $i ]]; do
		echo -n " ";
		((ct++));
	done
	echo ${str:i:n}
done
