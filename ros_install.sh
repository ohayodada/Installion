
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'  
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654  
sudo apt-get update  
sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential  cmake

sudo rosdep init  
rosdep update

# Create ROS workstation file
mkdir ~/ros_catkin_ws  
cd ~/ros_catkin_ws

# Install ROS Desktop Package
rosinstall_generator desktop --rosdistro melodic --deps --wet-only --tar > melodic-desktop-wet.rosinstall  

# Download all of the core ROS 
wstool init -j8 src melodic-desktop-wet.rosinstall