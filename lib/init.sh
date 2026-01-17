#!/bin/bash

# ==================== CONFIGURATION ====================



PROJECT_NAME="$1"
PROJECT_PATH="$PARENT_DIR_PATH/$PROJECT_NAME"
GIT_REMOTE=GIT_REMOTE="https://github.com/${GIT_USERNAME}/${PROJECT_NAME}.git" 



# ==================== CONFIG VALIDATION ====================

throw_error() {
    echo "❌ ERROR: $1"
    exit 1
}
if [ -z "$1" ]; then
    throw_error "Project name required as first argument"
  
fi


if [ ! -d "$PARENT_DIR_PATH" ]; then
    throw_error "Parent directory $PARENT_DIR_PATH does not exist. Edit PARENT_DIR_PATH in config.local.sh"
fi


if [ -d "$PROJECT_PATH" ]; then
    throw_error "Project already exists at $PROJECT_PATH"
  
fi

# Check if ROS is installed
if [ ! -d "/opt/ros/$ROS_VERSION" ]; then
    throw_error "ROS $ROS_VERSION not found at /opt/ros/$ROS_VERSION"

fi



