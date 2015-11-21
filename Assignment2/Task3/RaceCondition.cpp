#include <iostream>
#include <omp.h>

int main(){
	int write = -1;
	int read = -1;
	#pragma omp parallel shared(write) private(read)
	{
		write = omp_get_thread_num();
		
		if(omp_get_thread_num()==3){
			std::cout << "Thread: " << omp_get_thread_num() << " Write: " << write << std::endl;
		}
		
		read = write;
	
		if(omp_get_thread_num()==3){
			std::cout << "Thread: " << omp_get_thread_num() << " Read: " << read << std::endl;
	    }
	}
	return 0;
}
