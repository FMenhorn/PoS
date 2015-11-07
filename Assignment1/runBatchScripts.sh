#!/bin/bash

for indexVar in {1..16}
do
	llsubmit job_nthreads$indexVar.cmd 
done
