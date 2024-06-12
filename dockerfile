# syntax=docker/dockerfile:1

# Specify the parent image from which we build
FROM node:15.12.0-alpine3.12
#WORKDIR in container, app directory construction
WORKDIR /usr/src/app

# install dependencies
# That is recommended to copy package*.json before application installation
# ref. https://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
# "When possible, docker will try to use an existing cached layer if it’s possible. 
# You should try to take advantage of layers as much as possible by organizing your commands in a specific order. ""
COPY package*.json ./
RUN npm install

# install application files
# copy app files from local directory where Dockerfile is to container WORKDIR
COPY . .

#docker daemon port mapping
EXPOSE 3000
#runtime, WORKDIR/js/app.js execute
CMD ["node", "main.js"]