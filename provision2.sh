#!/bin/bash

rosdep update

echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc

git clone https://github.com/BCLab-UNM/Swarmathon-ROS.git ~/rover_workspace

cd ~/rover_workspace
git submodule init
git submodule update

if ! grep -q "source /opt/ros/indigo/setup.bash" ~/.bashrc
then 
    echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
fi
source ~/.bashrc

catkin_make

if ! grep -q "source ~/rover_workspace/devel/setup.bash" ~/.bashrc
then
    echo "source ~/rover_workspace/devel/setup.bash" >> ~/.bashrc
fi

if ! grep -q "export GAZEBO_MODEL_PATH=~/rover_workspace/simulation/models" ~/.bashrc
then
    echo "export GAZEBO_MODEL_PATH=~/rover_workspace/simulation/models" >> ~/.bashrc
fi

if ! grep -q "export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:~/rover_workspace/devel/lib/" ~/.bashrc
then
    echo "export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:~/rover_workspace/devel/lib/" >> ~/.bashrc
fi

source ~/.bashrc

chmod +x ~/rover_workspace/run.sh
