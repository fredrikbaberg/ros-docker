FROM ros:indigo
# Checkout code from github/bitbucket.
RUN mkdir -p ~/ros/ws/src && cd ~/ros/ws/src && \
    git clone https://github.com/mas-group/youbot_simulation.git --single-branch --branch indigo-devel && \
    git clone https://github.com/mas-group/youbot_description.git --single-branch --branch indigo-devel && \
    mkdir -p ~/.gazebo && \
    hg clone https://bitbucket.org/osrf/gazebo_models ~/.gazebo/models && \
    rm -rf ~/.gazebo/models/.hg
# Could remove some files in ~/.gazebo/models to save space.
RUN apt-get update && \
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
COPY youbot_sim.sh .
RUN chmod +x youbot_sim.sh
RUN . /opt/ros/indigo/setup.sh && cd /root/ros/ws && catkin build
ENTRYPOINT ["./youbot_sim.sh"]
