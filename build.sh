#!/bin/bash


rm -rf build
rm -rf thirdparty

mkdir -p build
echo "Currently in $PWD"
pushd $PWD/build
echo "now in  $PWD .."
cmake ..
make all 
popd
