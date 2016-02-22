#!/bin/bash

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

sudo apt-get update

sudo apt-get -y install ros-indigo-desktop-full python-rosinstall ros-indigo-robot-localization ros-indigo-hector-gazebo-plugins ros-indigo-joystick-drivers git build-essential

sudo rosdep init
