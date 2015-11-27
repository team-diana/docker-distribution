#!/bin/bash

command=${@:-/bin/bash}
name=ctr-ros-control
src_volume=${src_volume:-/mnt/lxc/ros-src} 

sudo docker run \
     -e ROS_MASTER_URI=$ROS_MASTER_URI \
     --hostname $name --name $name \
     -it teamdiana/diana \
     $command
