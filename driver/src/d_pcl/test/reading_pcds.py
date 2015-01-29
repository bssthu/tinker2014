#!/usr/bin/env python
# -*- coding: utf-8 -*-
# File          : reading_pcds.py
# Module        : d_pcl@tinker
# Author        : bss
# Creation date : 2015-01-29
#  Last modified: 2015-01-30, 03:20:46
# Description   : read pcd files
#

import sys
import os
import time
import pcl
import getopt
import rospkg
import rospy
#import sensor_msgs
import sensor_msgs.point_cloud2 as pc2
from sensor_msgs.msg import PointCloud2


pcl_pub = rospy.Publisher('/pcl/points2', PointCloud2, queue_size=1) 


def Usage():
    print();
    print("test_reading_pcds node in d_pcl");
    print("Usage: rosrun d_pcl test_reading_pcds ");
    print("[OPTION] -d SOURCE");
    print("指定一个名字(SOURCE),读取/pcl/points2目录下到文件");
    print("不要尝试过于不合法的输入");
    print("-d SOURCE: input dir name(put it in ui/d_pcl).");
    print("-h,--help: print help message.");
    print("-r,--rate: sending rate, in Hz.");
    print("-f: how to repeat.");
    print("  always:always repeat;");
    print("  delay,times:延迟times帧再重复,例如'delay,10'");
    print("  key:wait for key;");
    print("  [other]:don't repeat;");
    print("  default is 'key'");
    print("");
    print("example:");
    print("rosrun d_pcl test_reading_pcds.py test");


def analysisOpts(argv):
    # opt
    try:
        opts, argv = getopt.getopt(argv[1:], 'hr:f:d:', ['help', 'rate='])
    except getopt.GetoptError, err:
        print(str(err))
        Usage()
        sys.exit(2)
    except:
        Usage()
        sys.exit(1)

    rate_Hz = 5
    repeat_func = 'key'
    repeat_times = 20
    pcd_name = ''

    for o, a in opts:
        if o in ('-h', '--help'):
            Usage()
            sys.exit(0)
        if o in ('-r', '--rate'):
            rate_Hz = int(a)
        if o in ('-f'):
            repeat_func = str(a)
            if repeat_func.startswith('delay'):
                delay_split = repeat_func.split(',')
                if delay_split.length == 2:
                    repeat_func = 'delay'
                    repeat_times = int(delay_split[1])
                else:
                    Usage()
                    sys.exit(2)
        if o in ('-d'):
            pcd_name = str(a)
            if ('.' in pcd_name) or ('/' in pcd_name):
                print('Invalid pcd name')
                sys.exit(2)

    if pcd_name == '':
        print('Must input a pcd name')
        sys.exit(2)

    return (rate_Hz, repeat_func, pcd_name)


def sendPcds(rate_Hz, repeat_func, pcddir):
    rate = rospy.Rate(rate_Hz)
    i = 0
    print('init ok.')
    while not rospy.is_shutdown():
        filepath = pcddir + '/pcd' + str(i) + '.pcd'
        pcd = pcl.PointCloud()
        pcd.from_file(filepath)
        pcd2 = PointCloud2()
        pcd2 = pc2.create_cloud(pcd2.header, pcd)
        pcl_pub.publish(pcd)
        rate.sleep()


def main(argv):
    (rate_Hz, repeat_func, pcd_name) = analysisOpts(argv)
    pcddir = rospkg.RosPack().get_path('d_pcl') \
            + '/../../../share/d_pcl/' + pcd_name

    print('-rate = ' + str(rate_Hz) + 'Hz')
    print('-repeat function = ' + repeat_func)
    print('-dir = ' + pcddir)

    if not os.path.exists(pcddir):
        print('Error: dir ' + pcddir + ' do not exist.')
        sys.exit(1)

    # ros init
    rospy.init_node('test_reading_pcds', anonymous=True)

    sendPcds(rate_Hz, repeat_func, pcddir)


if __name__ == '__main__':
    main(sys.argv)
    print('Bye!')

