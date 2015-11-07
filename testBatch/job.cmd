# This job command file is called job.cmd
#@ wall_clock_limit = 00:20:00
#@ job_type = parallel
#@ output = $(HOME)/PoS/batchJob/a.out
#@ class = test
#@ node = 8
#@ total_tasks=16
#@ queue
echo "JOB is run"
