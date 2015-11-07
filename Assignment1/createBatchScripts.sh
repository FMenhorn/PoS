#!/bin/bash

for indexVar in {1..16}
do
	echo -e "#!/bin/bash" \
	"\n#@ wall_clock_limit = 00:20:00"\
	"\n#@ job_name = pos-lulesh-openmp$indexVar"\
	"\n#@ job_type = MPICH"\
	"\n#@ class = test"\
	"\n#@ output = pos_lulesh_openmp_nthreads$indexVar-\$(jobid).out" \
	"\n#@ error = pos_lulesh_openmp_nthreads$indexVar-\$(jobid).out" \
	"\n#@ node = 1" \
	"\n#@ total_tasks = 16" \
	"\n#@ node_usage = not_shared" \
	"\n#@ energy_policy_tag = lulesh" \
	"\n#@ minimize_time_to_solution = yes" \
	"\n#@ island_count = 1" \
	"\n#@ queue" \
	"\n. /etc/profile" \
	"\n. /etc/profile.d/modules.sh" \
	"\nexport OMP_NUM_THREADS=$indexVar" \
	"\n\$(HOME)/PoS/Assignment1/lulesh2.0.3/lulesh2.0" > job_nthreads$indexVar.cmd
done
