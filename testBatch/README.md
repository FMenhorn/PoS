#Batch jobs on Supermuc

## useful commands
- ```llsubmit <batchjob>``` submits batch job
- ```llq``` shows status of all batch jobs

	- ```-u <username>``` only batch jobs of current user
	- ```-s <jobid>``` only batch job with certain id

- ```llu``` shows status of all batch jobs of current user
- ```llcancel <jobid>``` cancels one job

	- ``` llcancel `myjobs` ``` cancels all jobs of user (requires ``` module load lrztools ```)

## Remarks & Troubleshooting
Job is not running, all the time in status hold

 - be sure that the specified folders/files ```#@ output```, ```#@ input```, ```#@ error``` exist and have sufficient write access! 

