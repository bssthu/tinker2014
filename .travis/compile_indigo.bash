#!/bin/bash
# -*- coding: utf-8 -*-
# compile_indigo.bash
# created by bss at 2015-03-19
# 

# prepare
sudo apt-get install -qq -y python-rosdep python-rosinstall-generator
sudo apt-get install -qq -y python-wstool python-rosinstall
sudo apt-get install -qq -y python-empy python-nose
sudo apt-get install -qq -y build-essential

sudo rosdep init
rosdep update

# build catkin
mkdir ros_catkin_ws
cd ros_catkin_ws/

rosinstall_generator desktop_full --rosdistro indigo --deps --wet-only --tar > indigo-desktop-full-wet.rosinstall

if [ -d "src" ]; then
    wstool update -j 4 -t src
else
    wstool init -j8 src indigo-desktop-full-wet.rosinstall
fi

rosdep install --from-paths src --ignore-src --rosdistro indigo -y

# for console_bridge in 12.04
cd src/
git clone https://github.com/ros/console_bridge.git
cd console_bridge/
mkdir build
cd build/
cmake ..
make
sudo make install
cd ../../..

./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release

source ./install_isolated/setup.bash
rospack profile

