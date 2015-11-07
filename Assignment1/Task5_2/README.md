##Running

load correct mpi module
```
module unload mpi.ibm
module load mpi.intel
```
make from lulesh folder with
```
make -f ../Task5_2/MakefileMPICC
```
run with
```
mpiexec -n <nothreads> ./lulesh2.0
```
