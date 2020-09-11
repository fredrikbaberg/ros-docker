#!/bin/bash
echo "Master URI: $MASTER_URI"
if [ ! -z "${MASTER_URI}" ]; then
    echo "Exporting URI"
    export ROS_MASTER_URI=$MASTER_URI
fi
source /opt/ros/indigo/setup.bash
cd ~/ros/ws/
catkin build
source /root/ros/ws/devel/setup.bash
roslaunch sim sim.launch
