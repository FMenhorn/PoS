#!/bin/bash

jobType="518-OMP_ICC" #this means only omp
outFolder="\$HOME/PoS/output"

for nthreadsVar in 1 2 4 8 16 32
do
	for ncpusVar in 1
	do
		if ((nthreadsVar * ncpusVar < 33))
		then
			fileNameBaseBase="jobtype$jobType-ncpus$ncpusVar-nthreads$nthreadsVar"
			fileNameBase="$fileNameBaseBase-jobid\$JOB_ID"
			tempFileName="$fileNameBase.out"
			outFileName="$fileNameBase.csv"
			batchFileName="$fileNameBaseBase.cmd"

			echo -e "#!/bin/bash" \
			"\n#@ wall_clock_limit = 00:20:00"\
			"\n#@ job_name = pos-lulesh-openmp$nthreadsVar"\
			"\n#@ job_type = MPICH"\
			"\n#@ class = fattest"\
			"\n#@ output = pos_lulesh_ncpus$ncpusVar-_nthreads$nthreadsVar-jobid\$(jobid).out" \
			"\n#@ error = pos_lulesh_ncpus$ncpusVar-_nthreads$nthreadsVar-jobid\$(jobid).out" \
			"\n#@ node = 1" \
			"\n#@ total_tasks = 32" \
			"\n#@ node_usage = not_shared" \
			"\n#@ energy_policy_tag = lulesh" \
			"\n#@ minimize_time_to_solution = yes" \
			"\n#@ island_count = 1" \
			"\n#@ environment = JOB_ID=\$(jobid);" \
			"\n#@ queue" \
			"\n. /etc/profile" \
			"\n. /etc/profile.d/modules.sh"\
			"\n. \$HOME/.bashrc"\
			"\n"\
			"\n#load the mpi lib we want"\
			"\nmodule unload mpi.ibm"\
			"\nmodule load mpi.intel" \
			"\nmodule load gcc/4.9" \
			"\n"\
			"\n#needed in this job"\
			"\nexport OMP_NUM_THREADS=$nthreadsVar" \
			"\n\$HOME/PoS/Assignment1/lulesh2.0.3_PRODUCTION/lulesh2.0_OMP_ICC  > $tempFileName"\
			"\necho \"Run finished. Contents of temp. file ($tempFileName):\"; echo"\
			"\ncat $tempFileName"\
			"\n"\
			"\nmkdir -p $outFolder"\
			"\n\$HOME/PoS/Assignment1/extractPerformanceMeasures.sh $tempFileName > $outFolder/$outFileName"\
			"\necho; echo \"Extraction finished. Contents of output file ($outFileName) in $outFolder:\"; echo"\
			"\ncat $outFolder/$outFileName" > "$batchFileName"
		fi	
	done
done
