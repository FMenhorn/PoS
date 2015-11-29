#include <stdio.h>
#if USE_MPI
#include <mpi.h>
#endif
#include <omp.h>


int main (argc, argv)
     int argc;
     char *argv[];
{
  int rank, size;

#if USE_MPI
  MPI_Init (&argc, &argv);	/* starts MPI */
  MPI_Comm_rank (MPI_COMM_WORLD, &rank);	/* get current process id */
  MPI_Comm_size (MPI_COMM_WORLD, &size);	/* get number of processes */
#else
  rank = 0;
  size = 1;
#endif

#pragma omp parallel 
{
#ifdef _OPENMP
  int thread = omp_get_thread_num();
  int num_threads = omp_get_num_threads();
  printf( "Hello world from process %d of %d - thread %d of %d\n", rank, size, thread, num_threads );
#else
  printf( "Hello world from process %d of %d\n", rank, size );
#endif
}

#if USE_MPI
  MPI_Finalize();
#endif
  return 0;
}
