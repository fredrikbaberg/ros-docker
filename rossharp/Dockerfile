FROM ros:kinetic-ros-core
# Checkout code from Github.
RUN mkdir -p ~/ros/ws/src && \
    cd ~/ros/ws/src && \
    git clone https://github.com/siemens/ros-sharp.git /tmp/ros-sharp && \
    mv /tmp/ros-sharp/ROS/ $HOME/catkin_ws/src/ROSSHARP && \
    rm -rf /tmp/*
RUN apt-get update && \
    apt install -y ros-kinetic-rosbridge-server && \
    rm -rf /var/lib/apt/lists/*
ARG MASTER_URI
ENV MASTER_URI=$MASTER_URI
COPY run.sh .
RUN chmod +x run.sh
RUN . /opt/ros/indigo/setup.sh && cd /root/ros/ws && catkin build
ENTRYPOINT ["./run.sh"]
