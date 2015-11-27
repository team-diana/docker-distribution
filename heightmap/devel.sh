
	# -v $HOME/.emacs.d:/root/.emacs.d:z \
	# -v $HOME/src/plan9port:/usr/local/plan9:z \

sudo docker run \
	-v /mnt/lxc/ros-dev/homefs/sebastiano/myws:/ws:z \
	--name=ctr-ros-heightmap \
	--hostname=ctr-ros-heightmap \
	-it --rm --expose=22 \
	teamdiana/heightmap /bin/bash

