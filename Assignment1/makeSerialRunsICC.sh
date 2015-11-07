#!/bin/bash

echo "#########-march=native"
make clean && make CXXFLAGS="-march=native " && ./lulesh2.0 
echo "#########-xHost"
make clean && make CXXFLAGS="-xHost " && ./lulesh2.0 
echo "#########-unroll"
make clean && make CXXFLAGS="-unroll " && ./lulesh2.0 
echo "#########-ipo"
make clean && make CXXFLAGS="-ipo " && ./lulesh2.0 
echo "#########-march=native-xHost"
make clean && make CXXFLAGS="-march=native -xHost " && ./lulesh2.0 
echo "#########-march=native-unroll"
make clean && make CXXFLAGS="-march=native -unroll " && ./lulesh2.0 
echo "#########-march=native-ipo"
make clean && make CXXFLAGS="-march=native -ipo " && ./lulesh2.0 
echo "#########-xHost-unroll"
make clean && make CXXFLAGS="-xHost -unroll " && ./lulesh2.0 
echo "#########-xHost-ipo"
make clean && make CXXFLAGS="-xHost -ipo " && ./lulesh2.0 
echo "#########-unroll-ipo"
make clean && make CXXFLAGS="-unroll -ipo " && ./lulesh2.0 
echo "#########-march=native-xHost-unroll"
make clean && make CXXFLAGS="-march=native -xHost -unroll " && ./lulesh2.0 
echo "#########-march=native-xHost-ipo"
make clean && make CXXFLAGS="-march=native -xHost -ipo " && ./lulesh2.0 
echo "#########-march=native-unroll-ipo"
make clean && make CXXFLAGS="-march=native -unroll -ipo " && ./lulesh2.0 
echo "#########-xHost-unroll-ipo"
make clean && make CXXFLAGS="-xHost -unroll -ipo " && ./lulesh2.0 
echo "#########-march=native-xHost-unroll-ipo"
make clean && make CXXFLAGS="-march=native -xHost -unroll -ipo " && ./lulesh2.0 
