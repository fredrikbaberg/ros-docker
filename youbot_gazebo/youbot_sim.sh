#!/bin/bash
Xvfb :1 -screen 0 1600x1200x16 &
export DISPLAY=:1.0
echo "Master URI: $MASTER_URI"
if [ ! -z "${MASTER_URI}" ]; then
    echo "Exporting URI"
    export ROS_MASTER_URI=$MASTER_URI
fi
cd ~/ros/ws/
source /opt/ros/indigo/setup.bash
catkin build
source devel/setup.bash
roslaunch youbot_gazebo_robot youbot.launch world:=empty_world
