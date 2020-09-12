FROM ros:indigo
# Change ROS repository
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros1-snapshots.list
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# Checkout code from Github.
RUN mkdir -p ~/ros/ws/src && cd ~/ros/ws/src && \
    # git clone https://github.com/mas-group/youbot_simulation.git --single-branch --branch indigo-devel && \
    git clone https://github.com/fredrikbaberg/youbot_simulation.git --single-branch --branch dev && \
    git clone https://github.com/mas-group/youbot_description.git --single-branch --branch indigo-devel && \
    mkdir -p ~/.gazebo && \
    git clone https://github.com/osrf/gazebo_models --single-branch --branch master ~/.gazebo/models && \
    rm -rf ~/.gazebo/models/.git
# Could remove some files in ~/.gazebo/models to save space.
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    rosdep update --include-eol-distros && \
    cd ~/ros/ws && rosdep install --from-path src --ignore-src -ry && \
    rm -rf /var/lib/apt/lists/*
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
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
    ros-indigo-gazebo-plugins && \
    rm -rf /var/lib/apt/lists/*
ARG MASTER_URI
ENV MASTER_URI=$MASTER_URI
COPY run.sh .
RUN chmod +x run.sh
RUN . /opt/ros/indigo/setup.sh && cd /root/ros/ws && catkin build
ENTRYPOINT ["./run.sh"]
CMD [ "roslaunch", "youbot_gazebo_robot", "youbot.launch", "world:=empty_world", "headless:=true" ]

# FROM osrf/ros_legacy:hydro-ros-precise
# RUN apt update && apt install -y \
#     ros-hydro-simulators \
#     ros-hydro-youbot-simulation \
#     ros-hydro-gazebo-ros-control \
#     ros-hydro-ros-control \
#     ros-hydro-ros-controllers && \
#     rm -rf /var/lib/apt/lists/*