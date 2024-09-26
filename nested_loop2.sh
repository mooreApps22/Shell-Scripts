#!/bin/bash

set -- 1 2 3 4 5 6 7 8 9 0 9 8 7 6 5 4 3 2 1
declare -i len=1
declare -i ct=20
declare -i tmp=20

for ((st=10;st>0;st--)); do
	ct=$tmp
	while [[ $ct -gt 0 ]]; do
		echo -n " ";
		((ct--));
	done
	echo ${@:$st:$len};
	len=$(( len + 2 ));
	tmp=$(( tmp - 2 ))
done
