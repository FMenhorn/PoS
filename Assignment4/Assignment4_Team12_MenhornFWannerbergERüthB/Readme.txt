Clarification for IO:

We append the JobId to the Outputfiles for the IO baseline code in Baseline/canon_for_io.c and MPI-IO in MPI_IO/canon.c. That means, we give the JobId as parameter to the program, hence we have not 4 but 5 arguments:

./executable matrix_file_A matrix_file_B jobID test
