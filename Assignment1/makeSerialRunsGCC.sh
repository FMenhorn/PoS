#!/bin/bash

echo "#########-march=native"
make clean && make CXXFLAGS="-O3 -I. -march=native " && ./lulesh2.0 
echo "#########-fomit-frame-pointer"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer " && ./lulesh2.0 
echo "#########-floop-block"
make clean && make CXXFLAGS="-O3 -I. -floop-block " && ./lulesh2.0 
echo "#########-floop-interchange"
make clean && make CXXFLAGS="-O3 -I. -floop-interchange " && ./lulesh2.0 
echo "#########-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -floop-strip-mine " && ./lulesh2.0 
echo "#########-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -funroll-loops " && ./lulesh2.0 
echo "#########-flto"
make clean && make CXXFLAGS="-O3 -I. -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer " && ./lulesh2.0 
echo "#########-march=native-floop-block"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block " && ./lulesh2.0 
echo "#########-march=native-floop-interchange"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-interchange " && ./lulesh2.0 
echo "#########-march=native-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-strip-mine " && ./lulesh2.0 
echo "#########-march=native-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-interchange"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-interchange " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-strip-mine " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -funroll-loops " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -flto " && ./lulesh2.0 
echo "#########-floop-block-floop-interchange"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-interchange " && ./lulesh2.0 
echo "#########-floop-block-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-strip-mine " && ./lulesh2.0 
echo "#########-floop-block-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -floop-block -funroll-loops " && ./lulesh2.0 
echo "#########-floop-block-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-block -flto " && ./lulesh2.0 
echo "#########-floop-interchange-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -floop-interchange -floop-strip-mine " && ./lulesh2.0 
echo "#########-floop-interchange-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -floop-interchange -funroll-loops " && ./lulesh2.0 
echo "#########-floop-interchange-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-interchange -flto " && ./lulesh2.0 
echo "#########-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-interchange"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-interchange " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-strip-mine " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -flto " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-interchange"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-interchange " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-strip-mine " && ./lulesh2.0 
echo "#########-march=native-floop-block-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-floop-block-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -flto " && ./lulesh2.0 
echo "#########-march=native-floop-interchange-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-interchange -floop-strip-mine " && ./lulesh2.0 
echo "#########-march=native-floop-interchange-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-interchange -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-floop-interchange-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-interchange -flto " && ./lulesh2.0 
echo "#########-march=native-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-march=native-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -funroll-loops -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-interchange"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-interchange " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-strip-mine " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -funroll-loops " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-interchange-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-interchange -floop-strip-mine " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-interchange-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-interchange -funroll-loops " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-interchange-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-interchange -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -funroll-loops -flto " && ./lulesh2.0 
echo "#########-floop-block-floop-interchange-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-interchange -floop-strip-mine " && ./lulesh2.0 
echo "#########-floop-block-floop-interchange-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-interchange -funroll-loops " && ./lulesh2.0 
echo "#########-floop-block-floop-interchange-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-interchange -flto " && ./lulesh2.0 
echo "#########-floop-block-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-floop-block-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-floop-block-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-block -funroll-loops -flto " && ./lulesh2.0 
echo "#########-floop-interchange-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -floop-interchange -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-floop-interchange-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-interchange -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-floop-interchange-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-interchange -funroll-loops -flto " && ./lulesh2.0 
echo "#########-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-interchange"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-interchange " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-strip-mine " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-interchange-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-interchange -floop-strip-mine " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-interchange-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-interchange -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-interchange-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-interchange -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-interchange-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-interchange -floop-strip-mine " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-interchange-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-interchange -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-interchange-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-interchange -flto " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-march=native-floop-block-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-floop-interchange-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-interchange -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-floop-interchange-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-interchange -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-march=native-floop-interchange-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-interchange -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-interchange-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-interchange -floop-strip-mine " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-interchange-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-interchange -funroll-loops " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-interchange-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-interchange -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -funroll-loops -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-interchange-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-interchange -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-interchange-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-interchange -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-interchange-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-interchange -funroll-loops -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-floop-block-floop-interchange-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-interchange -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-floop-block-floop-interchange-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-interchange -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-floop-block-floop-interchange-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-interchange -funroll-loops -flto " && ./lulesh2.0 
echo "#########-floop-block-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-floop-interchange-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-interchange -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-interchange-floop-strip-mine"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-interchange -floop-strip-mine " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-interchange-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-interchange -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-interchange-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-interchange -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-interchange-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-interchange -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-interchange-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-interchange -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-interchange-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-interchange -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-interchange-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-interchange -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-interchange-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-interchange -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-interchange-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-interchange -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-floop-interchange-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-interchange -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-interchange-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-interchange -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-interchange-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-interchange -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-interchange-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-interchange -funroll-loops -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-interchange-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-interchange -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-floop-block-floop-interchange-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -floop-block -floop-interchange -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-interchange-floop-strip-mine-funroll-loops"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-interchange -floop-strip-mine -funroll-loops " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-interchange-floop-strip-mine-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-interchange -floop-strip-mine -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-interchange-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-interchange -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-interchange-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-interchange -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-floop-block-floop-interchange-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -floop-block -floop-interchange -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-fomit-frame-pointer-floop-block-floop-interchange-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -fomit-frame-pointer -floop-block -floop-interchange -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
echo "#########-march=native-fomit-frame-pointer-floop-block-floop-interchange-floop-strip-mine-funroll-loops-flto"
make clean && make CXXFLAGS="-O3 -I. -march=native -fomit-frame-pointer -floop-block -floop-interchange -floop-strip-mine -funroll-loops -flto " && ./lulesh2.0 
