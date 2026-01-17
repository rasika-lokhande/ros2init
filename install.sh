#!/bin/bash

echo "Installing ros2init..."

# Make executable
chmod +x ros2init

# Create config if needed
if [ ! -f config.local.sh ]; then
    cp config.local.sh.example config.local.sh
    echo "Created config.local.sh - please edit it with your settings"
fi

# Install to PATH
mkdir -p ~/.local/bin
ln -sf "$(pwd)/ros2init" ~/.local/bin/ros2init

echo ""
echo "✓ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Edit config: nano config.local.sh"
echo "  2. Run: ros2init my_project"
echo ""
echo "If 'ros2init' command not found, add to ~/.bashrc:"
echo "  export PATH=\"\$PATH:\$HOME/.local/bin\""