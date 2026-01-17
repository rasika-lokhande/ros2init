# ros2init

A command-line tool to streamline ROS2 project initialization and setup.

## Overview

`ros2init` automates the tedious setup process for new ROS2 projects, letting you focus on development instead of configuration. It creates a standardized workspace structure, configures version control, and provides convenient development shortcuts.

## Features

- **Workspace Setup**: Creates a ROS2 workspace with a best-practice folder structure
- **Shell Aliases**: Automatically adds project-specific aliases for quick sourcing of `setup.bash`
- **GitHub Integration**: Initializes a private GitHub repository for immediate version control
- **Template Library**: Includes ready-to-use templates for nodes, URDF files, and launch files

## Prerequisites

- ROS2 installed and configured
- Git installed
- GitHub account (for remote repository feature)
- Bash shell

## Installation
```bash
# Clone the repository
git clone https://github.com/yourusername/ros2init.git
cd ros2init

# Make the script executable
chmod +x run.sh
```

## Configuration

Before first use, edit `config.sh` to set your preferences:
```bash
# Open config.sh in your preferred editor
nano config.sh
```

Configure variables such as:
- GitHub username/token
- Default workspace paths
- Preferred folder structure
- Template locations

## Usage
```bash
source run.sh <project_name>
```

**Example:**
```bash
source run.sh my_robot_project
```

This will:
1. Create a new ROS2 workspace named `my_robot_project`
2. Set up the standard folder structure
3. Add a `my_robot_project` alias to your shell configuration
4. Initialize a Git repository and push to GitHub (if configured)
5. Copy template files to appropriate directories

### Using the Alias

After initialization, you can quickly source your project's setup file:
```bash
my_robot_project  # Sources ~/ros2_ws/my_robot_project/install/setup.bash
```



## Templates

The tool includes templates for:
- **Python/C++ Nodes**: Boilerplate code with ROS2 best practices
- **URDF Files**: Robot description templates
- **Launch Files**: Common launch configurations

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.


## Support

For issues, questions, or suggestions, please open an issue on the GitHub repository.

---
