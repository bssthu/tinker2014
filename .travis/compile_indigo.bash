#!/bin/bash
# -*- coding: utf-8 -*-
# compile_indigo.bash
# created by bss at 2015-03-19
# 

export CI_SOURCE_PATH=$(pwd)

cd $HOME
cd ros_catkin_ws
./src/catkin/bin/catkin_make_isolated -j4 -q --install -DCMAKE_BUILD_TYPE=Release
if [ ! $? -eq 0 ]; then
    ./src/catkin/bin/catkin_make_isolated -j2 -q --install -DCMAKE_BUILD_TYPE=Release
    if [ ! $? -eq 0 ]; then
        ./src/catkin/bin/catkin_make_isolated -j1 -q --install -DCMAKE_BUILD_TYPE=Release
    fi
fi


source ./install_isolated/setup.bash

cd $CI_SOURCE_PATH

