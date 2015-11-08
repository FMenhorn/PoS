#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(){
	ofstream out;
	ifstream in;
	
	in.open("allPossibleICCSerialRuns.txt");
	out.open("extractICC.txt");
	string line;
    while ( getline (in,line) )
    {
	  if(line[0]=='#' || line[0]=='E' || line[0]=='G' || line[0]=='F'){
			out << line << '\n';
		}
    }
    in.close();
    out.close();
    
    return 0;
}
