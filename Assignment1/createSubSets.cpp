#include<iostream>
#include<string>
#include<list>
#include<vector>
#include <fstream>

using namespace std;

ofstream myfile;
void print( vector<string> l){
	myfile << "make clean && make CXXFLAGS=\"";
    for(vector<string>::iterator it=l.begin(); it!=l.end() ; ++it)
            myfile << *it << " ";
    myfile << "\" && ./lulesh2.0 \n";
}

void subset(string arr[], int size, int left, int index, vector<string> &l){
    if(left==0){
        print(l);
        return;
    }
    for(int i=index; i<size;i++){
        l.push_back(arr[i]);
        subset(arr,size,left-1,i+1,l);
        l.pop_back();
    }

}     

int main(){
	
	myfile.open ("makeSerialRunsGCC.sh");
    //string array[4]={"-march=native", "-xHost", "-unroll", "-ipo"};
    string array[7]={"-march=native","-fomit-frame-pointer","-floop-block","-floop-interchange","-floop-strip-mine","-funroll-loops","-flto"};
    vector<string> lt;
    for(int i = 1; i < 8; i++){   
		subset(array,7,i,0,lt);
	}
	myfile.close();

    return 0;
}
