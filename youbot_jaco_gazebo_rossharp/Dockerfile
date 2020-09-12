FROM ros:indigo
# Change ROS repository
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros1-snapshots.list
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# Checkout code from Github.
RUN mkdir -p ~/ros/ws/src && cd ~/ros/ws/src && \
    # git clone https://github.com/mas-group/youbot_simulation.git --single-branch --branch indigo-devel && \
    git clone https://github.com/fredrikbaberg/youbot_simulation.git --single-branch --branch dev && \
    git clone https://github.com/mas-group/youbot_description.git --single-branch --branch indigo-devel && \
    git clone https://github.com/Kinovarobotics/kinova-ros.git --single-branch --branch master && \
    mkdir -p ~/.gazebo && \
    git clone https://github.com/osrf/gazebo_models --single-branch --branch master ~/.gazebo/models && \
    rm -rf ~/.gazebo/models/.git && \
    git clone https://github.com/siemens/ros-sharp.git --single-branch --branch master /tmp/ros-sharp && \
    mv /tmp/ros-sharp/ROS/ $HOME/ros/ws/src/ROSSHARP
# Could remove some files in ~/.gazebo/models to save space.
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    rosdep update --include-eol-distros && \
    cd ~/ros/ws && rosdep install --from-path src --ignore-src -ry && \
    apt-get install -y \
    python-catkin-tools \
    build-essential \
    ros-indigo-xacro \
    ros-indigo-gazebo-ros-control \
    ros-indigo-effort-controllers \
    ros-indigo-joint-state-controller \
    ros-indigo-joint-trajectory-controller \
    ros-indigo-ros-control \
    ros-indigo-ros-controllers \
    ros-indigo-gazebo-plugins \
    ros-indigo-gazebo-ros-pkgs \
    ros-indigo-rosbridge-server && \
    rm -rf /var/lib/apt/lists/*
ARG MASTER_URI
ENV MASTER_URI=$MASTER_URI
COPY run.sh .
RUN chmod +x run.sh
COPY youbot_jaco_gazebo /root/ros/ws/src/youbot_jaco_gazebo
COPY simulation /root/ros/ws/src/simulation
RUN touch /root/ros/ws/src/kinova-ros/kinova_moveit/kinova_arm_moveit_demo/CATKIN_IGNORE
RUN sed -i 's+hardware_interface/++g' /root/ros/ws/src/kinova-ros/kinova_description/urdf/kinova_common.xacro
RUN . /opt/ros/indigo/setup.sh && cd /root/ros/ws && catkin build
COPY default.rviz /root/.rviz/default.rviz
ENTRYPOINT ["./run.sh"]
CMD [ "roslaunch", "simulation", "sim.launch" ]