# youbot_jaco_gazebo
Dockerized versions of youbot_simulation with jaco arm mounted instead of youbot arm and ROS# included.

There were issues with running youbot_simulation on ROS Kinetic and 16.04, so this is a dockerized version with ROS Indigo.

The container runs with `network_mode host`, so the same ROS core as on host computer can be used. If required, there is an environment variable for specifying ROS_MASTER_URI.

## Requirements

Docker and docker-compose are required, see [Docker webpage](https://www.docker.com/).

## Launching

To launch, just type `docker-compose up`.

Alternatively: `docker run --rm -it --network=host -e ROS_MASTER_URI=http://localhost:11311 fredrikbaberg/youbot-jaco-gazebo-rossharp`
This will pull and run the image, with ROS_MASTER_URI (optional). Example uses localhost, if there is not a roscore running it will start one as part of the launchfile.
