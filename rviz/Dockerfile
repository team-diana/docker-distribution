FROM ros

RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list

RUN apt-get -y update && apt-get -y install ros-indigo-rviz

CMD ["rosrun", "rviz", "rviz"]
ENTRYPOINT /ros_entrypoint.sh
