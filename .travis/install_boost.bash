#!/bin/bash
# -*- coding: utf-8 -*-
# install_boost.bash
# created by bss at 2015-03-20
# 

export CI_SOURCE_PATH=$(pwd)

# compile opencv
cd $HOME
mkdir boost
cd boost/
wget -O boost_1_54_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.54.0/boost_1_54_0.tar.gz/download
tar -xzf boost_1_54_0.tar.gz

cd boost_1_54_0
wget https://dl.dropboxusercontent.com/u/88131281/install_boost.sh
chmod +x install_boost.sh
./install_boost.sh

cd $CI_SOURCE_PATH

