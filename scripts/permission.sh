#!/bin/bash
cd /var/www/html/

# Set ownership to the web server user and group (adjust as needed)
sudo chown -R nginx:nginx /var/www   # For Nginx on CentOS
# OR
sudo chown -R apache:apache /var/www  # For Apache on CentOS

# Set directory permissions to 755
sudo find /var/www -type d -exec chmod 755 {} \;

# Set file permissions to 644
sudo find /var/www -type f -exec chmod 644 {} \;

# Build the Next.js application for production
npm run build

# Optional: Install PM2 or another process manager to run the Next.js app
npm install -g pm2
pm2 start npm --name "nextjs-app" -- start
pm2 save
pm2 startup

echo "Dependencies installed and application built successfully."