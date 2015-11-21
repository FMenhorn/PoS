#include <iostream>

int main(){
	
	float a = 0.0;
	
	float b = 0.0;
	b = b - 0.1;
	b = b + 0.1;
	
	std::cout << "a: " << a << " b: " << b << std::endl;
	std::cout << "Comparison: " << (a==b) << std::endl;
	
	return 0;
}
