#!/usr/bin/env sh

# It seems to be necessary to specify DISPLAY as "unix:0.0"
# rather than simply as ":0".

command=${@:-rosrun rviz rviz}
name=ctr-ros-rviz

ROS_MASTER_URI=${ROS_MASTER_URI:-http://ctr-ros-master:11311/}

sudo docker run \
    --device /dev/dri/card0 \
    --device /dev/dri/controlD64 \
    --device /dev/dri/renderD128 \
    --device /dev/video0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev/shm:/dev/shm \
    --hostname $name --name $name \
    -e DISPLAY=unix:0.0 \
    -e ROS_MASTER_URI=$ROS_MASTER_URI \
    --privileged \
    --rm \
    -it teamdiana/rviz \
    $command
