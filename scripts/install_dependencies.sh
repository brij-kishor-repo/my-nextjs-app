#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update package index
sudo yum update -y

# Install EPEL repository for extra packages
sudo yum install epel-release -y

# Install Node.js (LTS version) and npm from NodeSource
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Install yarn globally (optional, if using yarn)
# sudo npm install -g yarn

# Navigate to the application directory (adjust if necessary)
cd /var/www/html

# Install application dependencies
npm install
