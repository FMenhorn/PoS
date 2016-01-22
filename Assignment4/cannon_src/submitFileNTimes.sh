#!/bin/bash

#submit arg#1, and do it arg#2 times.

counter=0
while ((counter < $2))
do
	llsubmit $1
	((counter++))
done
