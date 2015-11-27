command=${1:-roscore}
name=${name:-ctr-ros-master}

sudo docker run \
	--name=$name --hostname=$name \
	--env ROS_MASTER_URI=$ROS_MASTER_URI \
	-it --rm docker.io/ros $command
