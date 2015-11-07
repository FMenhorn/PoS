#!/bin/bash

time_line=$(grep Elapsed $1)
grind_time_line=`grep "Grind time" $1`
FOM_line=`grep FOM $1`


jobid_tmp=${1##*jobid}
jobid=${jobid_tmp%%-*}
nprocs_tmp=${1##*ncpus}
nprocs=${nprocs_tmp%%-*}
nthreads_tmp=${1##*nthreads}
nthreads=${nthreads_tmp%%-*}

result="$jobid;$nprocs;$nthreads;"
for string_line in "$time_line" "$grind_time_line" "$FOM_line"
do

	tmp=${string_line##*=}
	b=${tmp%%(*}
	result="$result;$b"
done
echo "$result"
