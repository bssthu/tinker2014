#!/bin/bash
# -*- coding: utf-8 -*-
# install_cv.bash
# created by bss at 2015-03-20
# 

export CI_SOURCE_PATH=$(pwd)

# compile opencv
cd $HOME

sudo apt-get install -qq -y libopencv-dev

cd $CI_SOURCE_PATH

