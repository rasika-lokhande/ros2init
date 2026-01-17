#!/bin/bash

# ==================== CONFIGURATION ====================
# Change these variables or add it to .env file


# CHANGE THESE VALUES
source .env # comment out if not using it
PARENT_DIR_PATH=$PARENT_DIR_PATH 
ROS_VERSION=$ROS_VERSION 
PYTHON_VERSION=$PYTHON_VERSION
GIT_USERNAME=$GIT_USERNAME
#--------------------------------


PROJECT_NAME="$1"
PROJECT_PATH="$PARENT_DIR_PATH/$PROJECT_NAME"
GIT_REMOTE=GIT_REMOTE="https://github.com/${GIT_USERNAME}/${PROJECT_NAME}.git" 



# ==================== CONFIG VALIDATION ====================

throw_error() {
    echo "❌ ERROR: $1"
    return 1
}
if [ -z "$1" ]; then
    throw_error "Project name required as first argument"
    return 1
fi

if [ -d "$PROJECT_PATH" ]; then
    throw_error "Project already exists at $PROJECT_PATH"
    return 1
fi

# Check if ROS is installed
if [ ! -d "/opt/ros/$ROS_VERSION" ]; then
    throw_error "ROS $ROS_VERSION not found at /opt/ros/$ROS_VERSION"
    return 1
fi