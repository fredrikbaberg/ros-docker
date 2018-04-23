FROM ros:indigo
# Checkout code from github/bitbucket.
RUN mkdir -p ~/ros/ws/src && cd ~/ros/ws/src && \
    git clone https://github.com/mas-group/youbot_simulation.git --single-branch --branch indigo-devel && \
    git clone https://github.com/mas-group/youbot_description.git --single-branch --branch indigo-devel && \
    mkdir -p ~/.gazebo && \
    hg clone https://bitbucket.org/osrf/gazebo_models ~/.gazebo/models && \
    rm -rf ~/.gazebo/models/.hg
# Install necessary package for following tasks.
# RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
# Setup sources
# RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu trusty main" > /etc/apt/sources.list.d/gazebo-latest.list && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
# Install all software in one step. && apt-get upgrade -y && apt-get install -y wget
RUN apt-get update && apt-get install -y python-catkin-tools build-essential xvfb ros-indigo-gazebo-ros-control ros-indigo-joint-state-controller ros-indigo-joint-trajectory-controller ros-indigo-ros-control ros-indigo-ros-controllers ros-indigo-gazebo-plugins && \
cd ~/ros/ws && rosdep install --from-path src --ignore-src -ry && \
rm -rf /var/lib/apt/lists/*
ARG MASTER_URI
ENV MASTER_URI=$MASTER_URI
COPY youbot_sim.sh .
RUN chmod +x youbot_sim.sh
ENTRYPOINT ["./youbot_sim.sh"]
