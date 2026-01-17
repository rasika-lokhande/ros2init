#!/bin/bash
# ==================== CONFIGURATION ====================

# PARENT_DIR_PATH="/media/rasika-lokhande/Data/RoboticsProjects"
# PROJECT_NAME="$1"
# PROJECT_PATH="$PARENT_DIR_PATH/$PROJECT_NAME"
# ROS_VERSION="jazzy"  
# PYTHON_VERSION="3.12.3"
# GIT_REMOTE="" 

# ==================== CREATE ROS PACKAGE ====================

source $PROJECT_PATH/ros_env.sh

#bringup
cd $PROJECT_PATH/src
ros2 pkg create ${PROJECT_NAME}_bringup 
cd ${PROJECT_NAME}_bringup
rm -rf include/
rm -rf src/
mkdir launch
mkdir config

#description
cd $PROJECT_PATH/src
ros2 pkg create ${PROJECT_NAME}_description
cd ${PROJECT_NAME}_description
mkdir launch
mkdir rviz
mkdir urdf
rm -rf include/
rm -rf src/

# custom interfaces
cd $PROJECT_PATH/src
ros2 pkg create ${PROJECT_NAME}_interfaces
cd ${PROJECT_NAME}_interfaces
rm -rf include/
rm -rf src/
mkdir msg
mkdir srv


## Create package.xml
cat > package.xml << EOF
<?xml version="1.0"?>
<?xml-model href="http://download.ros.org/schema/package_format3.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>
<package format="3">
  <name>${PROJECT_NAME}_interfaces</name>
  <version>0.0.0</version>
  <description>Custom ROS2 interfaces package</description>
  <maintainer email="user@todo.todo">user</maintainer>
  <license>TODO: License declaration</license>

  <buildtool_depend>ament_cmake</buildtool_depend>

  <buildtool_depend>rosidl_default_generators</buildtool_depend>
  <exec_depend>rosidl_default_runtime</exec_depend>
  <member_of_group>rosidl_interface_packages</member_of_group>

  <test_depend>ament_lint_auto</test_depend>
  <test_depend>ament_lint_common</test_depend>

  <export>
    <build_type>ament_cmake</build_type>
  </export>
</package>
EOF

# Create CMakeLists.txt
cat > CMakeLists.txt << EOF
cmake_minimum_required(VERSION 3.5)
project(${PROJECT_NAME}_interfaces)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# Find dependencies
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

# Generate interfaces
##### COMMENT OUT THE FOLLOWING AFTER ADDING CUSTOM INTERFACE =============================

# rosidl_generate_interfaces(${PROJECT_NAME}
#   # Add your custom interfaces here
#   # Example:
#   # "msg/MyMessage.msg"
#   # "srv/MyService.srv"
# )

ament_export_dependencies(rosidl_default_runtime)

ament_package()
EOF



