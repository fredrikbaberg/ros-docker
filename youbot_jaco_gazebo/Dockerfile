FROM ros:indigo
# Checkout code from Github.
RUN mkdir -p ~/ros/ws/src && cd ~/ros/ws/src && \
    git clone https://github.com/mas-group/youbot_simulation.git --single-branch --branch indigo-devel && \
    git clone https://github.com/mas-group/youbot_description.git --single-branch --branch indigo-devel && \
    git clone https://github.com/Kinovarobotics/kinova-ros.git --single-branch --branch master && \
    mkdir -p ~/.gazebo && \
    git clone https://github.com/osrf/gazebo_models --single-branch --branch master ~/.gazebo/models && \
    rm -rf ~/.gazebo/models/.git
# Could remove some files in ~/.gazebo/models to save space.
RUN apt-get update && \
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
    ros-indigo-gazebo-plugins && \
    rm -rf /var/lib/apt/lists/*
ARG MASTER_URI
ENV MASTER_URI=$MASTER_URI
COPY run.sh .
RUN chmod +x run.sh
COPY youbot_jaco_gazebo /root/ros/ws/src/youbot_jaco_gazebo
RUN . /opt/ros/indigo/setup.sh && cd /root/ros/ws && catkin build
ENTRYPOINT ["./run.sh"]
