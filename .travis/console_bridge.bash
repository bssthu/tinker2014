#!/bin/bash
# -*- coding: utf-8 -*-
# console_bridge.bash
# created by bss at 2015-03-19
# 

export CI_SOURCE_PATH=$(pwd)

cd $HOME
mkdir -p projects
cd projects
# for console_bridge in 12.04
#git clone https://github.com/ros/console_bridge.git
wget --no-check-certificate 'https://googledrive.com/host/0B-kQc2-wuHntUkJUZWQzd0d4Zk0' -O console_bridge.tar.gz
tar -xzf console_bridge.tar.gz
cd console_bridge/
mkdir -p build
cd build/
#cmake ..
#make -j4
sudo make install
cd ../..

# urdfdom_headers
#git clone https://github.com/ros/urdfdom_headers.git
wget --no-check-certificate 'https://googledrive.com/host/0B-kQc2-wuHntaWVrUlBnV1dnS0' -O urdfdom_headers.tar.gz
tar -xzf urdfdom_headers.tar.gz
cd urdfdom_headers/
mkdir -p build
cd build/
#cmake ..
sudo make install
cd ../..

# urdfdom
#git clone https://github.com/ros/urdfdom.git
wget --no-check-certificate 'https://googledrive.com/host/0B-kQc2-wuHntWTI1X2VDN1ZCQUU' -O urdfdom.tar.gz
tar -xzf urdfdom.tar.gz
cd urdfdom
mkdir -p build
cd build/
#cmake ..
sudo make install
cd ../..


cd $CI_SOURCE_PATH

