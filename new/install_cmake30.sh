#!/bin/bash -e
cd ~
wget http://www.cmake.org/files/v3.0/cmake-3.0.1.tar.gz
tar xzf cmake-3.0.1.tar.gz 
cd cmake-3.0.1
./configure 
make
make install
cmake --version
cd ~
rm -rf cmake-3.0.1*

