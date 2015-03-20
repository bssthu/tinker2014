#!/bin/bash
# -*- coding: utf-8 -*-
# apt_install.bash
# created by bss at 2015-03-20
# 

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo add-apt-repository -y ppa:gezakovacs/lz4

sudo apt-get update -qq

sudo apt-get install -qq -y libpcl-1.7-all-dev
sudo apt-get install -qq -y libboost-program-options-dev libboost-test-dev
sudo apt-get install -qq -y libboost-signals-dev

# prepare
sudo apt-get install -qq -y python-rosdep python-rosinstall-generator
sudo apt-get install -qq -y python-wstool python-rosinstall
sudo apt-get install -qq -y python-empy python-nose python-sip-dev
sudo apt-get install -qq -y libpoco-dev libtinyxml-dev
sudo apt-get install -qq -y liblz4-dev libgtest-dev
sudo apt-get install -qq -y build-essential
sudo apt-get install -qq -y pyqt4-dev-tools libqt4-dev python-qt4-dev
sudo apt-get install -qq -y libfltk1.3-dev libyaml-dev

