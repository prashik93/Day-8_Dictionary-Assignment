#! /bin/bash/ -x

declare -A birthDictionary
declare -a daysArray
declare -a value

num=1

for((num=1;num<=50;num=$((num+1))))
do
	month=$((RANDOM%12+1))
	if [[ ${birthDictionary[$month]} = '' ]]
	then
		birthDictionary[$month]="$num "
	else
		daysArray=${birthDictionary[$month]}
		daysArray+="$num "
		birthDictionary[$month]=$daysArray
	fi
done

for key in ${!birthDictionary[@]}
do
	value=${birthDictionary[$key]}
	echo "$key=$value"
done

