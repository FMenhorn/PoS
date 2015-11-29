#Minimal helloworld program
make via
```
make -f <MakefileName>
```
###for OMP version:
set num threads via:
```
export OMP_NUM_THREADS=<NumThreads>
```
then run
```
./<ExecutableName>
```
###for MPI version:
run
```
mpirun -np <NumProcs> ./<ExecutableName>
```
