#include <stdio.h>
#if USE_MPI
#include <mpi.h>
#endif
#include <omp.h>

void f(int thread_id)
{
	if(thread_id==3)
	{
		printf("\tthread: %d: I'm the best thread!\n",thread_id);
	}
	else
	{
		printf("\tthread: %d: Just one thread among others...\n",thread_id);
	}
}

int main (int argc, char* argv[])
{
  int rank, size, thread, num_threads;

printf("serial dummy statements...\n");
int a = 1;
a = a+1;
a = 10*a;
printf("no more dummy stuff!\n");

#if USE_MPI
  MPI_Init (&argc, &argv);	/* starts MPI */
  MPI_Comm_rank (MPI_COMM_WORLD, &rank);	/* get current process id */
  MPI_Comm_size (MPI_COMM_WORLD, &size);	/* get number of processes */
#else
  rank = 0;
  size = 1;
#endif

#ifdef _OPENMP
printf("opening parallel region");
#endif

#pragma omp parallel private(thread,num_threads)
{
#ifdef _OPENMP
  thread = omp_get_thread_num();
  num_threads = omp_get_num_threads();
  printf( "Hello world from process %d of %d - thread %d of %d\n", rank, size, thread, num_threads );
#else
  int thread = 0;
  printf( "Hello world from process %d of %d\n", rank, size );
#endif
  f(thread);
}

#ifdef _OPENMP
printf("parallel region closed!");
#endif

#if USE_MPI
  MPI_Finalize();
#endif
  return 0;
}
