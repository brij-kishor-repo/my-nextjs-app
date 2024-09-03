#!/bin/bash
cd /var/www/html/
sudo -u apache chmod 0644 . -R

npm ci --production
npm run build
pm2 restart nextjs-app-cicd || pm2 start npm --name "nextjs-app-cicd" -- start