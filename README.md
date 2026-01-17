# ros2init

A command-line tool to streamline ROS2 project initialization and setup.

## Overview

`ros2init` automates the tedious setup process for new ROS2 projects, letting you focus on development instead of configuration. It creates a standardized workspace structure, configures version control, and provides convenient development shortcuts.

## Features

- **Workspace Setup**: Creates a ROS2 workspace with a best-practice folder structure
- **Shell Aliases**: Automatically adds project-specific aliases for quick sourcing of `setup.bash`
- **GitHub Integration**: Initializes a private GitHub repository for immediate version control
- **Template Library**: Includes ready-to-use templates for nodes, URDF files, and launch files (ongoing)

## Prerequisites

- ROS2 installed and configured
- Git installed
- GitHub account (for remote repository feature)
- Bash shell

## Installation

The installer will:
- Make `ros2init` executable
- Create `config.local.sh` from the example template
- Add `ros2init` to your PATH


```bash
git clone https://github.com/rasika-lokhande/ros2init.git
cd ros2init
bash install.sh
```


## Configuration

Before first use, edit `config.local.sh` to set your preferences:
```bash
# Open config.local.sh in your preferred editor
nano config.local.sh
```

Configure variables such as:
- GitHub username
- Default workspace paths
- ROS2 version
- Python version

## Usage

Optional: Configure variables for the project
```bash
cd ros2init
nano config.local.sh
```

```bash
ros2init <project_name>
```

**Example:**
```bash
ros2init my_robot_project
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
my_robot_project  # Sources my_robot_project/install/setup.bash
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
