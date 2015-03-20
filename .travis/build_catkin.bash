#!/bin/bash
# -*- coding: utf-8 -*-
# build_catkin.bash
# created by bss at 2015-03-19
# 

export CI_SOURCE_PATH=$(pwd)

sudo rosdep init
rosdep update

# build catkin
cd $HOME
mkdir ros_catkin_ws
cd ros_catkin_ws/

rosinstall_generator desktop_full --rosdistro indigo --deps --wet-only --tar > indigo-desktop-full-wet.rosinstall

if [ -d "src" ]; then
    wstool update -j 4 -t src
else
    wstool init -j8 src indigo-desktop-full-wet.rosinstall
fi

rosdep install -q --from-paths src --ignore-src --rosdistro indigo -y

cd $CI_SOURCE_PATH

