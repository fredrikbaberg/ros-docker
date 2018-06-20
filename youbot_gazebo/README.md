# youbot_gazebo
Dockerized versions of youbot_simulation.

There were issues with running youbot_simulation on ROS Kinetic and 16.04, so this is a dockerized version with ROS Indigo.

The container runs with `network_mode host`, so the same ROS core as on host computer can be used. If required, there is an environment variable for specifying ROS_MASTER_URI.

The compiled image is roughly 2.13GB, containing gazebo models, and takes some time to build.

## Requirements

Docker and docker-compose are required, see [Docker webpage](https://www.docker.com/).

## Launching

To launch, just type `docker-compose up`.

Alternatively: `docker run --rm -it --network=host -e MASTER_URI=http://localhost:11311 fredrikbaberg/youbot-gazebo`
This will pull and run the image, with the ROS_MASTER_URI specified as MASTER_URI. Example uses localhost, if there is not one running it will start one as part of the launchfile.
