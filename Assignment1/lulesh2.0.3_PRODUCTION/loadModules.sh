echo "This bash script does not work on SuperMUC! just copy paste commands and it works."
echo "initial module list:"
module list
echo "loading modules necessary for Assignment 1"
module unload mpi.ibm
module load mpi.intel
module load gcc/4.9
echo "new module list:"
module list
