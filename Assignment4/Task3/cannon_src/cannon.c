#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mpi.h"

int main (int argc, char **argv) {
	FILE *fp;
	double **A = NULL, **B = NULL, **C = NULL, *A_array = NULL, *B_array = NULL, *C_array = NULL;
	double *A_local_block = NULL, *A_local_block_other = NULL,
		 *B_local_block = NULL, *B_local_block_other = NULL, *C_local_block = NULL;
	char *A_local_block_read = NULL,  *B_local_block_read = NULL;
	int A_rows, A_columns, A_local_block_rows, A_local_block_columns, A_local_block_size, A_file_header_size;
	int B_rows, B_columns, B_local_block_rows, B_local_block_columns, B_local_block_size, B_file_header_size;
	int rank, size, sqrt_size, matrices_a_b_dimensions[6];
	MPI_Comm cartesian_grid_communicator, row_communicator, column_communicator;
	MPI_Status status; 
	
	double reading_time, dimensions_time, scatter_time, gather_time, writing_time;
	

	// used to manage the cartesian grid
	int dimensions[2], periods[2], coordinates[2], remain_dims[2];

	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);


	const int characters_per_number = 4;

	/* For square mesh */
	sqrt_size = (int)sqrt((double) size);             
	if(sqrt_size * sqrt_size != size){
		if( rank == 0 ) perror("need to run mpiexec with a perfect square number of processes\n");
		MPI_Abort(MPI_COMM_WORLD, -1);
	}

	// create a 2D cartesian grid 
	dimensions[0] = dimensions[1] = sqrt_size;
	periods[0] = periods[1] = 1;    
	MPI_Cart_create(MPI_COMM_WORLD, 2, dimensions, periods, 1, &cartesian_grid_communicator);
	MPI_Cart_coords(cartesian_grid_communicator, rank, 2, coordinates);

	// create a row communicator
	remain_dims[0] = 0;            
	remain_dims[1] = 1; 
	MPI_Cart_sub(cartesian_grid_communicator, remain_dims, &row_communicator);

	// create a column communicator
	remain_dims[0] = 1;
	remain_dims[1] = 0;
	MPI_Cart_sub(cartesian_grid_communicator, remain_dims, &column_communicator);

	

	// getting matrices from files at rank 0 only
	// example: mpiexec -n 64 ./cannon matrix1 matrix2 [test]
	if (rank == 0){
		int row, column;
		if ((fp = fopen (argv[1], "r")) != NULL){
			fscanf(fp, "%d %d\n%n", &matrices_a_b_dimensions[0], &matrices_a_b_dimensions[1], &matrices_a_b_dimensions[4]);
			A = (double **) malloc (matrices_a_b_dimensions[0] * sizeof(double *));
			for (row = 0; row < matrices_a_b_dimensions[0]; row++){
				A[row] = (double *) malloc(matrices_a_b_dimensions[1] * sizeof(double));
				for (column = 0; column < matrices_a_b_dimensions[1]; column++)
					fscanf(fp, "%lf", &Agi;
			}
			fclose(fp);
		} else {
			if(rank == 0) fprintf(stderr, "error opening file for matrix A (%s)\n", argv[1]);
			MPI_Abort(MPI_COMM_WORLD, -1);
		}
		if((fp = fopen (argv[2], "r")) != NULL){
			fscanf(fp, "%d %d\n%n", &matrices_a_b_dimensions[2], &matrices_a_b_dimensions[3], &matrices_a_b_dimensions[5]);
			B = (double **) malloc (matrices_a_b_dimensions[2] * sizeof(double *));
			for(row = 0; row < matrices_a_b_dimensions[2]; row++){
				B[row] = (double *) malloc(matrices_a_b_dimensions[3] * sizeof(double *));
				for(column = 0; column < matrices_a_b_dimensions[3]; column++)
					fscanf(fp, "%lf", &B[row][column]);
			}
			fclose(fp);
		} else {
			if(rank == 0) fprintf(stderr, "error opening file for matrix B (%s)\n", argv[2]);
			MPI_Abort(MPI_COMM_WORLD, -1);
		}

		// need to check that the multiplication is possible given dimensions 
		// matrices_a_b_dimensions[0] = row size of A
		// matrices_a_b_dimensions[1] = column size of A
		// matrices_a_b_dimensions[2] = row size of B
		// matrices_a_b_dimensions[3] = column size of B
		if(matrices_a_b_dimensions[1] != matrices_a_b_dimensions[2]){
			if(rank == 0) fprintf(stderr, "A's column size (%d) must match B's row size (%d)\n", 
					matrices_a_b_dimensions[1], matrices_a_b_dimensions[2]);
			MPI_Abort(MPI_COMM_WORLD, -1);
		}

		// this implementation is limited to cases where thematrices can be partitioned perfectly
		if( matrices_a_b_dimensions[0] % sqrt_size != 0 
				|| matrices_a_b_dimensions[1] % sqrt_size != 0 
				|| matrices_a_b_dimensions[2] % sqrt_size != 0 
				|| matrices_a_b_dimensions[3] % sqrt_size != 0 ){
			if(rank == 0) fprintf(stderr, "cannot distribute work evenly among processe\n"
					"all dimensions (A: r:%d c:%d; B: r:%d c:%d) need to be divisible by %d\n",
					matrices_a_b_dimensions[0],matrices_a_b_dimensions[1],
					matrices_a_b_dimensions[2],matrices_a_b_dimensions[3], sqrt_size );
			MPI_Abort(MPI_COMM_WORLD, -1);
		}
		fprintf(stderr, "I just read %d characters from %s and %d characters from %s\n", 
			matrices_a_b_dimensions[4], argv[1], matrices_a_b_dimensions[5], argv[2]);
	}
	
	
	
	
	//Start dimensions sending counter
	dimensions_time = MPI_Wtime();

    // send dimensions to all peers
	MPI_Bcast(matrices_a_b_dimensions, 6, MPI_INT, 0, cartesian_grid_communicator);
	//if(rank == 0) {
	//	int i;
	//	for(i = 1; i < size; i++){
	//		MPI_Send(matrices_a_b_dimensions, 6, MPI_INT, i, 0, cartesian_grid_communicator);
	//	}
	//} else {
	//	MPI_Recv(matrices_a_b_dimensions, 6, MPI_INT, 0, 0, cartesian_grid_communicator, &status);
	//}
	
	//stop dimensions sending counter
	dimensions_time = MPI_Wtime() - dimensions_time;
	
	
	
	
	
	
	A_rows = matrices_a_b_dimensions[0];
	A_columns = matrices_a_b_dimensions[1];
	B_rows = matrices_a_b_dimensions[2];
	B_columns = matrices_a_b_dimensions[3];
	A_file_header_size = matrices_a_b_dimensions[4];
	B_file_header_size = matrices_a_b_dimensions[5];
	

	// local metadata for A
	A_local_block_rows = A_rows / sqrt_size;
	A_local_block_columns = A_columns / sqrt_size;
	A_local_block_size = A_local_block_rows * A_local_block_columns;
	//A_local_block = (double *) malloc (A_local_block_size * sizeof(double));
	A_local_block_read = (char *) malloc (A_local_block_size * characters_per_number * sizeof(char));
	A_local_block_other = (double *) calloc (A_local_block_size , sizeof(double));

	// local metadata for B
	B_local_block_rows = B_rows / sqrt_size;
	B_local_block_columns = B_columns / sqrt_size;
	B_local_block_size = B_local_block_rows * B_local_block_columns;
	//B_local_block = (double *) malloc (B_local_block_size * sizeof(double));
	B_local_block_read = (char *) malloc (B_local_block_size * characters_per_number * sizeof(char));
	B_local_block_other = (double *) malloc (B_local_block_size * sizeof(double));

	// local metadata for C
	int C_local_block_size = A_local_block_rows * B_local_block_columns;
	C_local_block = (double *) malloc (C_local_block_size * sizeof(double));
	// C needs to be initialized at 0 (accumulates partial dot-products)
	int i;
	for(i=0; i < C_local_block_size; i++){
		C_local_block[i] = 0;
	}
	
	//Start data scattering counter
	scatter_time = MPI_Wtime();

    
	// full arrays only needed at root
	if(rank == 0){
		//A_array = (double *) malloc(sizeof(double) * A_rows * A_columns);
		//B_array = (double *) malloc(sizeof(double) * B_rows * B_columns);
		C_array = (double *) malloc(sizeof(double) * A_rows * B_columns);
		// generate the 1D arrays of the matrices at root
		int row, column, i, j;
		/*for (i = 0; i < sqrt_size; i++){
			for (j = 0; j < sqrt_size; j++){
				for (row = 0; row < A_local_block_rows; row++){
					for (column = 0; column < A_local_block_columns; column++){
						A_array[((i * sqrt_size + j) * A_local_block_size) + (row * A_local_block_columns) + column] 
							= A[i * A_local_block_rows + row][j * A_local_block_columns + column];
					}
				}
				for (row = 0; row < B_local_block_rows; row++){
					for (column = 0; column < B_local_block_columns; column++){
						B_array[((i * sqrt_size + j) * B_local_block_size) + (row * B_local_block_columns) + column] 
							= B[i * B_local_block_rows + row][j * B_local_block_columns + column];
					}
				}
			}
		}*/
		// allocate output matrix C
		C = (double **) malloc(A_rows * sizeof(double *));
		for(i=0; i<A_rows ;i++){
			C[i] = (double *) malloc(B_columns * sizeof(double));
		}
	} 
    /*
	// send a block to each process
	if(rank == 0) {
		int i;
		for(i = 1; i < size; i++){
			MPI_Send((A_array + (i * A_local_block_size)), A_local_block_size, MPI_DOUBLE, i, 0, cartesian_grid_communicator);
			MPI_Send((B_array + (i * B_local_block_size)), B_local_block_size, MPI_DOUBLE, i, 0, cartesian_grid_communicator);
		}
		for(i = 0; i < A_local_block_size; i++){
			A_local_block[i] = A_array[i];
		}
		for(i = 0; i < B_local_block_size; i++){
			B_local_block[i] = B_array[i];
		}
	} else {
		MPI_Recv(A_local_block, A_local_block_size, MPI_DOUBLE, 0, 0, cartesian_grid_communicator, &status);
		MPI_Recv(B_local_block, B_local_block_size, MPI_DOUBLE, 0, 0, cartesian_grid_communicator, &status);
	}*/
	
	MPI_Info readInfo;
	MPI_Info writeInfo;
	MPI_Info_create(&readInfo);
	MPI_Info_create(&writeInfo);
	
	MPI_Info_set(readInfo, "romio_cb_read", "enable");
	MPI_Info_set(readInfo, "romio_ds_read", "enable");
	
	MPI_Info_set(writeInfo, "romio_cb_write", "enable");
	MPI_Info_set(writeInfo, "romio_ds_write", "enable");
	

	int ierr;
	int blocksize_A[2] = {A_rows, A_columns*characters_per_number};
    int blocksize_B[2] = {B_rows, B_columns*characters_per_number};
    MPI_Datatype datatype_blocks_A;
    MPI_Datatype datatype_blocks_B;
    int subsize_A[2] = {A_local_block_rows, A_local_block_columns*characters_per_number};
    int subsize_B[2] = {B_local_block_rows, B_local_block_columns*characters_per_number};    
    int array_of_starts_A[2] = {coordinates[0]*A_local_block_rows,((coordinates[1] + coordinates[0]) % sqrt_size)*A_local_block_columns*characters_per_number};    //This shifts the starting coordinate according to the original shift in Cannon's algorithm!
    int array_of_starts_B[2] = {((coordinates[1] + coordinates[0]) % sqrt_size)*B_local_block_rows,coordinates[1]*B_local_block_columns*characters_per_number};    //This shifts the starting coordinate according to the original shift in Cannon's algorithm!
    
    ierr = MPI_Type_create_subarray(2,                  //int ndims,
                           blocksize_A,                 //const int array_of_sizes[],
                           subsize_A,                   //const int array_of_subsizes[],
                           array_of_starts_A,           //const int array_of_starts[],
                           MPI_ORDER_C,                 //int order,
                           MPI_CHAR,                    //MPI_Datatype oldtype,
                           &datatype_blocks_A);          //MPI_Datatype *newtype);
                           
    MPI_Type_commit(&datatype_blocks_A);
    
    ierr = MPI_Type_create_subarray(2,                  //int ndims,
                           blocksize_B,                 //const int array_of_sizes[],
                           subsize_B,                   //const int array_of_subsizes[],
                           array_of_starts_B,           //const int array_of_starts[],
                           MPI_ORDER_C,                 //int order,
                           MPI_CHAR,                    //MPI_Datatype oldtype,
                           &datatype_blocks_B);          //MPI_Datatype *newtype);                
	
    MPI_Type_commit(&datatype_blocks_B);
		
	//stop data scattering counter
	scatter_time = MPI_Wtime() - scatter_time;
	
	//Start I/O reading counter!
	reading_time = MPI_Wtime();
	
	MPI_File mpi_file_matrixA;
	
	ierr=MPI_File_open(MPI_COMM_WORLD,
		argv[1],
		MPI_MODE_RDONLY | MPI_MODE_UNIQUE_OPEN,
		MPI_INFO_NULL, &mpi_file_matrixA);
	
	
	if (ierr!=MPI_SUCCESS) {
		printf(" Cannot open file\n");
	}      
   
          
	MPI_File_set_view(mpi_file_matrixA, A_file_header_size, MPI_CHAR, 
		datatype_blocks_A, "native", readInfo);
	
	MPI_File_read_all(mpi_file_matrixA, A_local_block_read, A_local_block_size * characters_per_number,
		MPI_CHAR, MPI_STATUS_IGNORE);
		
	MPI_File_close(&mpi_file_matrixA);
	
	//stop I/O reading counter
	reading_time = MPI_Wtime() - reading_time;
	
	
	//Convert read chars from matrices into doubles
	for(i = 0; i < A_local_block_size; ++i)
	{
	    char tempString[4];
	    strncpy(tempString,&A_local_block_read[i*characters_per_number],characters_per_number);
		sscanf(tempString, "%lf", &A_local_block_other[i]);
		
		
        //Debug output
		/*if(A_local_block_other[i] == 9.0)
			printf("%d: Woohoo! Found 9.0 at %d = (%d,%d) (in file)\n", rank, i, i/(A_local_block_columns) + 2, 1+ 4*(i % (A_local_block_columns)));
		if(A_local_block_other[i] == 1.1)
			printf("%d: Woohoo! Found 1.1 at %d = (%d,%d) (in file)\n", rank, i, i/(A_local_block_columns) + 2, 1+ 4*(i % (A_local_block_columns)));
		if(A_local_block_other[i] != A_local_block[i])
		{
			fprintf(stderr,"%d: Error! Get different read and send results; at ind %d: recv: %lf, read: %lf\nLocal string at this place: \"%c%c%c%c:%c%c%c%c:%c%c%c%c\"\n", rank, i, A_local_block[i], A_local_block_other[i],
			A_local_block_read[i*characters_per_number-4],A_local_block_read[i*characters_per_number-3],A_local_block_read[i*characters_per_number-2],A_local_block_read[i*characters_per_number-1],
			A_local_block_read[i*characters_per_number],A_local_block_read[i*characters_per_number+1],A_local_block_read[i*characters_per_number+2],A_local_block_read[i*characters_per_number+3],
			A_local_block_read[i*characters_per_number+4],A_local_block_read[i*characters_per_number+5],A_local_block_read[i*characters_per_number+6],A_local_block_read[i*characters_per_number+7]);
			MPI_Abort(MPI_COMM_WORLD,-1);
		}*/
	}
	
	//Start I/O reading counter!
	double start_read = MPI_Wtime();
	
	//Do same for B
	MPI_File mpi_file_matrixB;
	
	ierr=MPI_File_open(MPI_COMM_WORLD,
		argv[2],
		MPI_MODE_RDONLY | MPI_MODE_UNIQUE_OPEN,
		MPI_INFO_NULL, &mpi_file_matrixB);
	
	if (ierr!=MPI_SUCCESS) {
		printf("Cannot open file\n");
	}
    
    
    MPI_File_set_view(mpi_file_matrixB, B_file_header_size, MPI_CHAR, 
		datatype_blocks_B, "native", readInfo);
	
	MPI_File_read_all(mpi_file_matrixB, B_local_block_read, B_local_block_size * characters_per_number,
		MPI_BYTE, MPI_STATUS_IGNORE);
		
	//stop I/O reading counter
	reading_time += MPI_Wtime() - start_read;
	
	
	
	//Convert read chars from matrices into doubles
	for(i = 0; i < B_local_block_size; ++i)
	{
	    char tempString[4]; //make a copy to not make sscanf try to check the whole string for terminating character
	                        //(is SUPER SLOW if one doesn't do this)
	    strncpy(tempString,&B_local_block_read[i*characters_per_number],characters_per_number);
		sscanf(tempString, "%lf", &B_local_block_other[i]);
	}
	
	A_local_block = A_local_block_other;
	B_local_block = B_local_block_other;
	
	// fix initial arrangements before the core algorithm starts
	/*if(coordinates[0] != 0){
		MPI_Sendrecv_replace(A_local_block, A_local_block_size, MPI_DOUBLE, 
				(coordinates[1] + sqrt_size - coordinates[0]) % sqrt_size, 0, 
				(coordinates[1] + coordinates[0]) % sqrt_size, 0, row_communicator, &status);
	}
	if(coordinates[1] != 0){
		MPI_Sendrecv_replace(B_local_block, B_local_block_size, MPI_DOUBLE, 
				(coordinates[0] + sqrt_size - coordinates[1]) % sqrt_size, 0, 
				(coordinates[0] + coordinates[1]) % sqrt_size, 0, column_communicator, &status);
	}*/
	
	

	// cannon's algorithm
	int cannon_block_cycle;
	double compute_time = 0, mpi_time = 0, start;
	int C_index, A_row, A_column, B_column;
	for(cannon_block_cycle = 0; cannon_block_cycle < sqrt_size; cannon_block_cycle++){
		// compute partial result for this block cycle
		start = MPI_Wtime();
		for(C_index = 0, A_row = 0; A_row < A_local_block_rows; A_row++){
			for(B_column = 0; B_column < B_local_block_columns; B_column++, C_index++){
				for(A_column = 0; A_column < A_local_block_columns; A_column++){
					C_local_block[C_index] += A_local_block[A_row * A_local_block_columns + A_column] *
						B_local_block[A_column * B_local_block_columns + B_column];
				}
			}
		}
		compute_time += MPI_Wtime() - start;
		start = MPI_Wtime();
		// rotate blocks horizontally
		MPI_Sendrecv_replace(A_local_block, A_local_block_size, MPI_DOUBLE, 
				(coordinates[1] + sqrt_size - 1) % sqrt_size, 0, 
				(coordinates[1] + 1) % sqrt_size, 0, row_communicator, &status);
		// rotate blocks vertically
		MPI_Sendrecv_replace(B_local_block, B_local_block_size, MPI_DOUBLE, 
				(coordinates[0] + sqrt_size - 1) % sqrt_size, 0, 
				(coordinates[0] + 1) % sqrt_size, 0, column_communicator, &status);
		mpi_time += MPI_Wtime() - start;
	}
	
	
	// get C parts from other processes at rank 0
	//if(rank == 0) {
	//	for(i = 0; i < A_local_block_rows * B_local_block_columns; i++){
	//		C_array[i] = C_local_block[i];
	//	}
	//	int i;
	//	for(i = 1; i < size; i++){
	//		MPI_Recv(C_array + (i * A_local_block_rows * B_local_block_columns), A_local_block_rows * B_local_block_columns, 
	//			MPI_DOUBLE, i, 0, cartesian_grid_communicator, &status);
	//	}
	//} else {
	//	MPI_Send(C_local_block, A_local_block_rows * B_local_block_columns, MPI_DOUBLE, 0, 0, cartesian_grid_communicator);
	//}
	
	
	
	
	//Start data gathering counter
	gather_time = MPI_Wtime();
    int blocksize_C[2] = {A_rows, B_columns};
    MPI_Datatype datatype_blocks_C;
    int subsize_C[2] = {A_local_block_rows, B_local_block_columns};
    int array_of_starts_C[2] = {coordinates[0]*A_local_block_rows, coordinates[1]*B_local_block_columns};    //This shifts the starting coordinate according to the original shift in Cannon's algorithm!
                           
    ierr = MPI_Type_create_subarray(2,                  //int ndims,
                           blocksize_C,                 //const int array_of_sizes[],
                           subsize_C,                   //const int array_of_subsizes[],
                           array_of_starts_C,           //const int array_of_starts[],
                           MPI_ORDER_C,                 //int order,
                           MPI_DOUBLE,                  //MPI_Datatype oldtype,
                           &datatype_blocks_C);         //MPI_Datatype *newtype);                
	
    MPI_Type_commit(&datatype_blocks_C);
	MPI_File mpi_file_matrixC;
	
	char output_filename[50];
	
	sprintf(output_filename,"output%dx%d_%d.out",A_rows,B_columns,atoi(arvg[3]));
	
	//stop data gathering counter
	gather_time = MPI_Wtime() - gather_time;
	
	//Start I/O writing counter
	writing_time = MPI_Wtime();
	
	ierr=MPI_File_open(MPI_COMM_WORLD,
		output_filename,
		MPI_MODE_WRONLY | MPI_MODE_CREATE | MPI_MODE_UNIQUE_OPEN,
		MPI_INFO_NULL, &mpi_file_matrixC);
	
	
	if (ierr!=MPI_SUCCESS) {
		printf(" Cannot open file\n");
	}      
   
          
	MPI_File_set_view(mpi_file_matrixC, 0, MPI_DOUBLE, 
		datatype_blocks_C, "native", writeInfo);
	
	
	MPI_File_write_all(mpi_file_matrixC, C_local_block, C_local_block_size,
		MPI_DOUBLE, MPI_STATUS_IGNORE);
		
	MPI_File_close(&mpi_file_matrixC);
	
	//stop I/O writing counter
	writing_time = MPI_Wtime() - writing_time;

	// generating output at rank 0
	if (rank == 0) {
		
		
		
		
		
		
		// convert the ID array into the actual C matrix 
		int i, j, k, row, column;
		//for (i = 0; i < sqrt_size; i++){  // block row index
		//	for (j = 0; j < sqrt_size; j++){ // block column index
		//		for (row = 0; row < A_local_block_rows; row++){
		//			for (column = 0; column < B_local_block_columns; column++){
		//				C[i * A_local_block_rows + row] [j * B_local_block_columns + column] = 
		//					C_array[((i * sqrt_size + j) * A_local_block_rows * B_local_block_columns) 
		//					+ (row * B_local_block_columns) + column];
		//			}
		//		}
		//	}
		//}
		
		
		
		//Print metrics
		printf("(%d,%d)x(%d,%d)=(%d,%d)\n", A_rows, A_columns, B_rows, B_columns, A_rows, B_columns);
		printf("Computation time: %lf\n", compute_time);
		printf("MPI time:         %lf\n", mpi_time);
		printf("Reading time:     %lf\n", reading_time);
		printf("Dimensions time:  %lf\n", dimensions_time);
		printf("Scattering time:  %lf\n", scatter_time);
		printf("Gathering time:   %lf\n", gather_time);
		printf("Writing time:     %lf\n", writing_time);
		
		printf("Total non-computational MPI time: %lf\n", dimensions_time + scatter_time + gather_time);
		printf("Total IO time:    %lf\n", reading_time + writing_time);

		if (argc == 5){
			// present results on the screen
			/*printf("\nA( %d x %d ):\n", A_rows, A_columns);
			for(row = 0; row < A_rows; row++) {
				for(column = 0; column < A_columns; column++)
					printf ("%7.3f ", A[row][column]);
				printf ("\n");
			}
			printf("\nB( %d x %d ):\n", B_rows, B_columns);
			for(row = 0; row < B_rows; row++){
				for(column = 0; column < B_columns; column++)
					printf("%7.3f ", B[row][column]);
				printf("\n");
			}*/
			printf("\nC( %d x %d ) = AxB:\n", A_rows, B_columns);
			for(row = 0; row < A_rows; row++){
				for(column = 0; column < B_columns; column++)
					printf("%7.3f ",C[row][column]);
				printf("\n");
			}
            //create array for comparing result
            double * C_array_other;
            if ((fp = fopen (output_filename, "rb")) != NULL){
                printf("Reading output from %s...", output_filename);
                C_array_other = (double*) malloc(A_rows * B_columns * sizeof(double));
	            fread(C_array_other, sizeof(double), A_rows * B_columns, fp);
	            fclose(fp);
            } else {
	            if(rank == 0) fprintf(stderr, "error opening file for matrix C (%s)\n", output_filename);
	            MPI_Abort(MPI_COMM_WORLD, -1);
            }

			printf("\nPerforming serial consistency check. Be patient...\n");
			fflush(stdout);
			int pass = 1;
			double temp;
			for(i=0; i<A_rows; i++){
				for(j=0; j<B_columns; j++){
					temp = 0;
					for(k=0; k<B_rows; k++){
						temp += A[i][k] * B[k][j];
					}
					printf("%7.3f ", temp);
					if(temp != C_array_other[i * B_columns + j]){
						pass = 0;
					}
				}
				printf("\n");
			}
			free(C_array_other);
			if (pass) printf("Consistency check: PASS\n");
			else printf("Consistency check: FAIL\n");
		}	
	}



	// free all memory
	if(rank == 0){
		int i;
		for(i = 0; i < A_rows; i++){
			free(A[i]);
		}
		for(i = 0; i < B_rows; i++){
			free(B[i]);
		}
		for(i = 0; i < A_rows; i++){
			free(C[i]);
		}
		free(A);
		free(B);
		free(C);
		free(A_array);
		free(B_array);
		free(C_array);
	}
	free(A_local_block);
	free(B_local_block);
	free(C_local_block);
	MPI_Info_free(&readInfo);
	MPI_Info_free(&writeInfo);

	// finalize MPI
	MPI_Finalize();
}

