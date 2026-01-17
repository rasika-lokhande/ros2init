#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ==================== CONFIGURATION ====================
source $SCRIPT_DIR/config.sh

# ==================== CREATE FOLDERS ====================
mkdir -p $PROJECT_PATH
mkdir -p $PROJECT_PATH/src
echo "✓ Project folders created"

# ==================== CREATE ROS ENV SCRIPT ====================
source $SCRIPT_DIR/env_setup.sh


# ==================== BUILD ====================
cd $PROJECT_PATH
colcon build
echo "✓ Workspace built"

# ==================== CREATE ROS PACKAGE ====================
source $SCRIPT_DIR/pkg_setup.sh


# ==================== ADD TEMPLATES ====================
source $SCRIPT_DIR/template_setup.sh

# ==================== GIT SETUP ====================================
source $SCRIPT_DIR/git_setup.sh


# ==================== FINAL STEPS ====================
echo ""
echo "✅ Project setup complete!"
echo "Next steps:"
echo "  1. source ~/.bashrc"
echo "  2. $PROJECT_NAME"
