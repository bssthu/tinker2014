#!/bin/bash
# -*- coding: utf-8 -*-
# console_bridge.bash
# created by bss at 2015-03-19
# 

export CI_SOURCE_PATH=$(pwd)

cd $HOME
cd ros_catkin_ws
# for console_bridge in 12.04
cd src/
git clone https://github.com/ros/console_bridge.git
cd console_bridge/
mkdir build
cd build/
cmake ..
make -j4
sudo make install -j4
cd ../../..
# urdfdom_headers
cd src/
git clone https://github.com/ros/urdfdom_headers.git
cd urdfdom_headers/
mkdir build
cd build/
cmake ..
sudo make install -j4
cd ../../..
# urdfdom
cd src/
git clone https://github.com/ros/urdfdom.git
cd urdfdom
mkdir build
cd build/
cmake ..
sudo make install -j4
cd ../../..

cd $CI_SOURCE_PATH

