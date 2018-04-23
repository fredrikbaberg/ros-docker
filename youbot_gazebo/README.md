# youbot_gazebo
Dockerized versions of youbot_simulation.

There were issues with running youbot_simulation on ROS Kinetic and 16.04, so this is a dockerized version with ROS Indigo.

The container runs with `network_mode host`, so the same ROS core as on host computer can be used. If required, there is an environment variable for specifying ROS_MASTER_URI.

The compiled image is roughly 2.2GB, containing gazebo models, and takes some time to build.
