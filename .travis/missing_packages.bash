#!/bin/bash
# -*- coding: utf-8 -*-
# missing_packages.bash
# created by bss at 2015-03-20
# 

export CI_SOURCE_PATH=$(pwd)

# download
cd $CI_SOURCE_PATH
cd downloaded/src/
# std_msgs
git clone https://github.com/ros/std_msgs.git -b groovy-devel
# common_msgs
git clone https://github.com/ros/common_msgs.git -b indigo-devel
cd common_msgs/
rm -rf .*
mv * ../
cd ..
# pcl_ros
git clone https://github.com/ros-perception/perception_pcl.git -b indigo-devel
cd perception_pcl/
rm -rf .*
mv * ../
cd ..

rospack profile

