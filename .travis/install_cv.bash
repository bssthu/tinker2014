#!/bin/bash
# -*- coding: utf-8 -*-
# install_cv.bash
# created by bss at 2015-03-20
# 

export CI_SOURCE_PATH=$(pwd)

# compile opencv
cd $HOME

mkdir cv
cd cv/
wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.9/opencv-2.4.9.zip
unzip -qq opencv-2.4.9.zip 
cd opencv-2.4.9/
mkdir build
cd build/
cmake ..
make -j4
sudo make install
sudo ldconfig

cd $CI_SOURCE_PATH

