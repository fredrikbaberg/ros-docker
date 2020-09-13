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
    rm -rf ~/.gazebo/models/.git
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
    ros-indigo-gazebo-ros-pkgs && \
    rm -rf /var/lib/apt/lists/*
COPY run.sh .
RUN chmod +x run.sh
COPY youbot_jaco_gazebo /root/ros/ws/src/youbot_jaco_gazebo
RUN touch /root/ros/ws/src/kinova-ros/kinova_moveit/kinova_arm_moveit_demo/CATKIN_IGNORE
RUN sed -i 's+hardware_interface/++g' /root/ros/ws/src/kinova-ros/kinova_description/urdf/kinova_common.xacro
RUN . /opt/ros/indigo/setup.sh && cd /root/ros/ws && catkin build
ENTRYPOINT ["./run.sh"]
CMD [ "roslaunch", "youbot_jaco_gazebo", "youbot_jaco.launch" ]
