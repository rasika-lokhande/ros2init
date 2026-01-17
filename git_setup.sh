
#!/bin/bash

# ==================== GIT SETUP ====================================
cd $PROJECT_PATH
git init

# create .gitignore
cat > .gitignore << 'EOF'
ros_env.sh
.env

# ROS build artifacts
build/
install/
log/

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
venv/
env/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db
EOF

# Create ReadMe
cat > README.md << EOF
# $PROJECT_NAME

## Project Info
- **Created**: $(date +"%Y-%b-%d")
- **ROS2 Version**: ROS2 $ROS_VERSION
- **Python Version**: $PYTHON_VERSION
- **Ubuntu Version**: $(lsb_release -rs) ($(lsb_release -cs))

EOF


# Initial commit
git add .
git commit -m "Initial commit: $PROJECT_NAME"

# Create GitHub repo and push
if command -v gh &> /dev/null; then
    echo "Creating GitHub repository..."
    gh repo create $PROJECT_NAME --private --source=. --remote=origin --push
    echo "✓ Repository created and pushed to GitHub"
else
    echo "⚠ GitHub CLI not installed. Install with: sudo apt install gh"
    echo "  Then run: gh auth login"
fi


