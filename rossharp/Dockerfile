FROM ros:kinetic-ros-core
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt install -y \
    git \
    python-catkin-tools \
    build-essential \
    ros-kinetic-rosbridge-server && \
    rm -rf /var/lib/apt/lists/*
# Checkout code from Github.
RUN mkdir -p ~/ros/ws/src && \
    cd ~/ros/ws/src && \
    git clone https://github.com/siemens/ros-sharp.git /tmp/ros-sharp && \
    mv /tmp/ros-sharp/ROS/ $HOME/ros/ws/src/ROSSHARP && \
    rm -rf /tmp/*
COPY run.sh .
RUN chmod +x run.sh
RUN . /opt/ros/kinetic/setup.sh && cd /root/ros/ws && catkin build
ENTRYPOINT ["./run.sh"]
CMD [ "roslaunch", "file_server", "ros_sharp_communication.launch" ]
