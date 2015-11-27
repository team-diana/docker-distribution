#!/bin/sh

name=${name:-ctr-ros-tof-suspension-controller}
src_volume=${src_volume:-/mnt/lxc/ros-src} 
echo Running Docker container with ROS master: \`$ROS_MASTER_URI\'

sudo docker run \
     -v ${src_volume}:/usr/src:z \
     -e ROS_MASTER_URI=$ROS_MASTER_URI \
     --hostname $name --name $name \
     --rm -it teamdiana/tof-suspension-controller \
     $@
