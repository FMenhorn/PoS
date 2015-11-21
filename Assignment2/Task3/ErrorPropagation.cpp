#include <iostream>
#include <iomanip>
#include <math.h> 

int main(){

	float x = 0.0;
	float constant = 0.1;
	float exact;
	int curPow = 1;
	for(int i = 1; i <= 10000000; i++){
		x = x + constant;
		if( log10(i)==curPow){
			exact = i*constant;
			std::cout <<std::setprecision(8) << "# i: "<< i <<  " # x: " << x << " Exact: " << exact << " Diff: " << exact-x << std::endl;
			curPow++;
		}
	}
	
	return 0;
}
