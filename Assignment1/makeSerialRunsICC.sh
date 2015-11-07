#!/bin/bash

make clean && make CXXFLAGS="-march=native" && ./lulesh2.0 
make clean && make CXXFLAGS="-xHost" && ./lulesh2.0 
make clean && make CXXFLAGS="-unroll" && ./lulesh2.0 
make clean && make CXXFLAGS="-ipo" && ./lulesh2.0 
make clean && make CXXFLAGS="-march=native -xHost" && ./lulesh2.0 
make clean && make CXXFLAGS="-march=native -unroll" && ./lulesh2.0 
make clean && make CXXFLAGS="-march=native -ipo" && ./lulesh2.0 
make clean && make CXXFLAGS="-xHost -unroll" && ./lulesh2.0 
make clean && make CXXFLAGS="-xHost -ipo" && ./lulesh2.0 
make clean && make CXXFLAGS="-unroll -ipo" && ./lulesh2.0 
make clean && make CXXFLAGS="-march=native -xHost -unroll" && ./lulesh2.0 
make clean && make CXXFLAGS="-march=native -xHost -ipo" && ./lulesh2.0 
make clean && make CXXFLAGS="-march=native -unroll -ipo" && ./lulesh2.0 
make clean && make CXXFLAGS="-xHost -unroll -ipo" && ./lulesh2.0 
make clean && make CXXFLAGS="-march=native -xHost -unroll -ipo" && ./lulesh2.0 
