#!/bin/bash
echo "Master URI: $MASTER_URI"
if [ ! -z "${MASTER_URI}" ]; then
    echo "Exporting URI"
    export ROS_MASTER_URI=$MASTER_URI
fi
cd ~/ros/ws/
# source /opt/ros/indigo/setup.bash
source /root/ros/ws/devel/setup.bash
catkin build
source devel/setup.bash
roslaunch sim sim.launch
