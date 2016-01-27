// for further docu see
// https://fs.hlrs.de/projects/craydoc/docs/books/S-2490-40/html-S-2490-40/chapter-sc4rx058-brbethke-paralleliowithmpi.html

#include <stdlib.h>
#include "stdio.h"
#include "mpi.h"

int main(int argc, char** argv){
    int myRank;
    char* mySecret;
    int success;

    const char* filename = "./secret_file";

    // Choose one of the following access modes.
    //    MPI_MODE_RDONLY --- read only,
    //    MPI_MODE_RDWR --- reading and writing,
    //    MPI_MODE_WRONLY --- write only,
    //    MPI_MODE_CREATE --- create the file if it does not exist,
    //    MPI_MODE_EXCL --- error if creating file that already exists,
    //    MPI_MODE_DELETE_ON_CLOSE --- delete file on close,
    //    MPI_MODE_UNIQUE_OPEN --- file will not be concurrently opened elsewhere,
    //    MPI_MODE_SEQUENTIAL --- file will only be accessed sequentially,
    //    MPI_MODE_APPEND --- set initial position of all file pointers to end of file.

    int accessMode = MPI_MODE_RDONLY;

    MPI_File fh; // file handle

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &myRank);

    mySecret = malloc(3 * sizeof(char));
    mySecret[2] = '\0';

    printf("Hello, World! rank %d\n", myRank);

    // open file
    success = MPI_File_open(MPI_COMM_WORLD, filename, accessMode, MPI_INFO_NULL, &fh);
    if(success != MPI_SUCCESS){
        printf("failure: opening file. rank: %d",myRank);
        return -1;
    }

    // set view of MPI
    int disp = 2 * myRank * sizeof(char);
    success = MPI_File_set_view(fh, disp, MPI_CHAR, MPI_CHAR, "native", MPI_INFO_NULL);
    if (success != MPI_SUCCESS) {
        printf("failure: setting view. rank: %d",myRank);
        return -1;
    }

    // read file
    success = MPI_File_read(fh, mySecret, 2, MPI_CHAR, MPI_STATUS_IGNORE);
    if (success != MPI_SUCCESS) {
        printf("failure: reading file. rank: %d",myRank);
        return -1;
    }

    printf("rank %d's supersecret message: %s\n",myRank, mySecret);

    free(mySecret);
    MPI_Finalize();



    return 0;
}