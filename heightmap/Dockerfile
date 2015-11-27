FROM teamdiana/diana

RUN sed -i '/PermitRootLogin/ s/without-password/yes/' /etc/ssh/sshd_config

RUN apt-get update -y && apt-get install -y \
    ros-indigo-tf \
    ros-indigo-pcl-ros \
    ros-indigo-octomap-ros \
    libdevil-dev python-pil
