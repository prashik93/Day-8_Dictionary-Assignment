#! /bin/bash/ -x

case1=1
case2=2
case3=3
case4=4
case5=5
case6=*

fixedWonTime=10
oneWinTime=0
twoWinTime=0
threeWinTime=0
fourWinTime=0
fiveWinTime=0
sixWinTime=0

declare -A rollDictionary

while [[ (($oneWinTime -lt $fixedWonTime) && ($twoWinTime -lt $fixedWonTime) && ($threeWinTime -lt $fixedWonTime) && ($fourWinTime -lt $fixedWonTime) && ($fiveWinTime -lt $fixedWonTime) && ($sixWinTime -lt $fixedWonTime)) ]]
do
	die=$((RANDOM%6+1))
	if [ $die -eq $case1 ]
	then
		one=$((one+1))
		rollDictionary["1"]=$one
		((oneWinTime++))

	elif [ $die -eq $case2 ]
	then
		two=$((two+1))
		rollDictionary["2"]=$two
		((twoWinTime++))
	elif [ $die -eq $case3 ]
	then
		three=$((three+1))
		rollDictionary["3"]=$three
		((threeWinTime++))

	elif [ $die -eq $case4 ]
	then
		four=$((four+1))
		rollDictionary["4"]=$four
		((fourWinTime++))

	elif [ $die -eq $case5 ]
	then
		five=$((five+1))
		rollDictionary["5"]=$five
		((fiveWinTime++))

	else
		six=$((six+1))
		rollDictionary["6"]=$six
		((sixWinTime++))
	fi
done

max_value=`for key in "${!rollDictionary[@]}";do max="${rollDictionary[$key]} = $key"; echo $max; done | sort -n | tail -1 | awk 'BEGIN{FS="="} {print $2}'`
min_value=`for key in "${!rollDictionary[@]}";do min="${rollDictionary[$key]} = $key"; echo $min ;done | sort -n | head -1 | awk 'BEGIN{FS="="} {print $2}'`

echo "max :- $max_value"
echo "min :- $min_value"


echo "The Dictionary keys :- ${!rollDictionary[@]}"
echo "The Dictionary values :- ${rollDictionary[@]}"

