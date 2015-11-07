#!/bin/bash

time_line=$(grep Elapsed $1)
grind_time_line=`grep "Grind time" $1`
FOM_line=`grep FOM $1`

result=$1
for string_line in "$time_line" "$grind_time_line" "$FOM_line"
do

	tmp=${string_line##*=}
	b=${tmp%%(*}
	result="$result;$b"
done
echo "$result"
