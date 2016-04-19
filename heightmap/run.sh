
name=ctr-ros-heightmap
src_volume=${src_volume:-/mnt/lxc/ros-src}
command=${1:-rosrun heightmap heightmap_node}


sudo docker run \
     -v $src_volume:/usr/src:z \
     --name=$name --hostname=$name \
     -e ROS_MASTER_URI=http://ctr-ros-master:11311/ \
     --rm -it \
     teamdiana/heightmap $command
