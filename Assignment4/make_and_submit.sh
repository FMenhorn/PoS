#!/bin/bash


if (($# != 1))
then 
    echo "Usage: <$0> <arch_ending>"
    #echo "current number of arguments: $#"
    exit
fi 

echo "starting"

for basefolder in "Task"*
do
    cd $basefolder/cannon_src
    make clean; make
    mv cannon cannon_$1
    ./submitFileNTimes.sh ./ll-64-ibm_$1.sh 50 2>>submittedFiles.txt 1>>submittedFiles.txt &
    cd ../../
done
echo "done!"
