#!/bin/bash
# file: seed_install_ros.sh
# This script installs barebones ROS on a seed emulator node.
#
apt -y install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates
add-apt-repository universe
add-apt-repository multiverse
add-apt-repository restricted
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
apt-get -y update
apt-get -y install ros-noetic-ros-base
. /opt/ros/noetic/setup.bash
echo ". /opt/ros/noetic/setup.bash" >> ~/.bashrc
apt-get -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
apt-get -y install python3-rosdep
rosdep init
rosdep update
