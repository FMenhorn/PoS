#!/bin/bash 
#@ wall_clock_limit = 00:05:00
#@ job_name = pos-cannon-mpi-ibm
#@ job_type = Parallel
#@ output = cannon_64_$(jobid).out
#@ error = cannon_64_$(jobid).out
#@ class = test
#@ node = 4
#@ total_tasks = 64
#@ node_usage = not_shared
#@ energy_policy_tag = cannon
#@ minimize_time_to_solution = yes
#@ notification = never
#@ island_count = 1
#@ environment = JOB_ID=$(jobid);
#@ queue

. /etc/profile
. /etc/profile.d/modules.sh

module load mpi.ibm

outfile="../output/jobId-$JOB_ID.csv"
cannon_matrices_path="../../cannon_matrices"

date
mpiexec -n 64 ./cannon $cannon_matrices_path/64x64-1.in $cannon_matrices_path/64x64-2.in | tee 64_$JOB_ID.out
date
mpiexec -n 64 ./cannon $cannon_matrices_path/128x128-1.in $cannon_matrices_path/128x128-2.in | tee 128_$JOB_ID.out
date
mpiexec -n 64 ./cannon $cannon_matrices_path/256x256-1.in $cannon_matrices_path/256x256-2.in | tee 256_$JOB_ID.out
date
mpiexec -n 64 ./cannon $cannon_matrices_path/512x512-1.in $cannon_matrices_path/512x512-2.in | tee 512_$JOB_ID.out
date
mpiexec -n 64 ./cannon $cannon_matrices_path/1024x1024-1.in $cannon_matrices_path/1024x1024-2.in | tee 1024_$JOB_ID.out
date
mpiexec -n 64 ./cannon $cannon_matrices_path/2048x2048-1.in $cannon_matrices_path/2048x2048-2.in | tee 2048_$JOB_ID.out
date
mpiexec -n 64 ./cannon $cannon_matrices_path/4096x4096-1.in $cannon_matrices_path/4096x4096-2.in | tee 4096_$JOB_ID.out
date

../../extractPerformanceMeasures.sh 64_$JOB_ID.out | tee --append $outfile
../../extractPerformanceMeasures.sh 128_$JOB_ID.out | tee --append $outfile
../../extractPerformanceMeasures.sh 256_$JOB_ID.out | tee --append $outfile
../../extractPerformanceMeasures.sh 512_$JOB_ID.out | tee --append $outfile
../../extractPerformanceMeasures.sh 1024_$JOB_ID.out | tee --append $outfile
../../extractPerformanceMeasures.sh 2048_$JOB_ID.out | tee --append $outfile
../../extractPerformanceMeasures.sh 4096_$JOB_ID.out | tee --append $outfile
