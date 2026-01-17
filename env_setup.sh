#!/bin/bash


# ==================== CREATE ROS ENV SCRIPT ====================
cat > $PROJECT_PATH/ros_env.sh << EOF
#!/bin/bash

# Source ROS
source /opt/ros/$ROS_VERSION/setup.bash

# Navigate to workspace
cd $PROJECT_PATH

# Source workspace if built
if [ -f install/setup.bash ]; then
    source install/setup.bash
    echo "✓ Workspace sourced"
else
    echo "⚠ Workspace not built yet. Run 'colcon build' first."
fi

# Show environment info
echo "ROS Distro: \$ROS_DISTRO"
echo "Current Directory: \$(pwd)"
echo "Ready for ROS development! 🚀"
EOF

echo "✓ ros_env.sh created"
chmod +x $PROJECT_PATH/ros_env.sh


# ==================== ADD ALIAS TO BASHRC ====================
# Check if alias already exists
if ! grep -q "alias ${PROJECT_NAME}=" ~/.bashrc; then
    echo "alias ${PROJECT_NAME}='source $PROJECT_PATH/ros_env.sh'" >> ~/.bashrc
    echo "✓ Alias added to ~/.bashrc"
else
    echo "⚠ Alias already exists in ~/.bashrc"
fi


