#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Navigate to the application directory (adjust if necessary)
cd /var/www/html

# Stop the Next.js application (assuming you use PM2)
if command -v pm2 >/dev/null 2>&1; then
  pm2 stop nextjs-app || echo "PM2 or application not found"
  pm2 delete nextjs-app || echo "PM2 or application not found"
else
  echo "PM2 is not installed. Please ensure it is installed and configured."
fi

# Optional: Stop any other related services if necessary
# Example: Stop a service running on a specific port
# sudo fuser -k 3000/tcp || echo "No service running on port 3000"

echo "Application stopped successfully."
