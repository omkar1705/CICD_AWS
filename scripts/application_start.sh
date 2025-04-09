#!/bin/bash

# give permission for everything in the express-app directory
chmod -R 777 /home/ec2-user/express-app
cd /home/ec2-user/express-app

# load nvm
export NVM_DIR="$HOME/.nvm"	
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# install dependencies and start the app
npm install
node app.js > app.out.log 2> app.err.log < /dev/null &
