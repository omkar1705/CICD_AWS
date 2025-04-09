#!/bin/bash

# Give full permission to the app directory (if necessary — not always recommended)
sudo chmod -R 777 /home/ec2-user/express-app

# Navigate into our working directory
cd /home/ec2-user/express-app || exit 1

# Load Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Install Node modules
npm install

# Kill any process running on port 3000 (or whichever port your app uses)
fuser -k 3000/tcp || true

# Start the app in the background with logging
nohup node app.js > app.out.log 2> app.err.log < /dev/null &

# Wait and confirm the app is up
sleep 5
if netstat -tuln | grep :3000; then
  echo "✅ App started successfully."
else
  echo "❌ App failed to start."
  exit 1
fi
