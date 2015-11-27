FROM teamdiana/diana

RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list

ADD http://packages.osrfoundation.org/gazebo.key /tmp/gazebo.key
RUN apt-key add /tmp/gazebo.key
RUN apt-get -y update && apt-get -y install gazebo6
RUN apt-get -y update && \
    apt-get -y install python-pip ros-indigo-xacro \
    	    ros-indigo-gazebo6-ros \
    	    ros-indigo-gazebo6-ros-control \
    	    ros-indigo-gazebo6-ros-pkgs \
	    ros-indigo-robot-state-publisher

RUN echo "source /usr/src/gazebo-plugins/devel/setup.sh" >> ~/.bashrc

VOLUME /usr/src

ENV GAZEBO_PLUGIN_PATH /usr/src/gazebo-plugins/devel/lib
ENV GAZEBO_MODEL_PATH /usr/src/gazebo-models/models

# ENTRYPOINT /ros_entrypoint.sh rosrun gazebo_ros gazebo

