#!/bin/bash
# -*- coding: utf-8 -*-
# download_ros.bash
# created by bss at 2015-03-21
# 

export CI_SOURCE_PATH=$(pwd)

cd $HOME
wget --no-check-certificate 'https://googledrive.com/host/0B-kQc2-wuHnteHVBWUFqYW43UHM' -O ros_catkin_ws_catkin_make_isolated.tar.gz
tar -xzf ros_catkin_ws_catkin_make_isolated.tar.gz

cd $CI_SOURCE_PATH

