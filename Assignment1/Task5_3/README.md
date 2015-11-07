##Running

load correct mpi module
```
module unload mpi.ibm
module load mpi.intel
```
make from lulesh folder with
```
make -f ../Task5_3/MakefileHYBRID
```
set num threads
```
export OMP_NUM_THREADS=<noOMPthreads>
```
run with
```
mpiexec -n <noMPIthreads> ./lulesh2.0
```
