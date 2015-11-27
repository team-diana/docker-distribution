#!/bin/sh

# The :z suffix tells Docker that two containers share the volume
# content, and (like :Z) to relabel file objects on the shared volumes
# (in the sense of SELinux label).

# It seems to be necessary to specify DISPLAY as "unix:0.0" rather
# than simply as ":0". Most probably it's to make it clear that the X
# server must be connected to through the UNIX socket /tmp/.X11-unix

name=${name:-ctr-ros-gazebo}
src_volume=${src_volume:-/mnt/lxc/ros-src} 
echo Running Docker container with ROS master: \`$ROS_MASTER_URI\'

sudo docker run \
     \
     --device /dev/dri/card0 \
     --device /dev/dri/controlD64 \
     --device /dev/dri/renderD128 \
     --device /dev/video0 \
     -v /tmp/.X11-unix:/tmp/.X11-unix \
     -v /dev/shm:/dev/shm \
     --privileged \
     -e DISPLAY=unix:0.0 \
     \
     -v ${src_volume}:/usr/src:z \
     -e ROS_MASTER_URI=$ROS_MASTER_URI \
     --hostname $name --name $name \
     \
     --rm -it teamdiana/gazebo-amalia \
     $@
