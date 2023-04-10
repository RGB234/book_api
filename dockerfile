# syntax=docker/dockerfile:1

# Specify the parent image from which we build
FROM node:15.12.0-alpine3.12
#WORKDIR in container, app directory construction
WORKDIR /usr/src/app
#install dependencies, package-.json, pacakage-lock.json
# That is recommended to copy package*.json before "npm install"
# https://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
# It prevents to copy same modules everytime when the change occurs to package list
# cashed docker layer skip that duplicated parts
COPY package*.json ./
#install dependencies
RUN npm install
#copy app files from local directory where Dockerfile is to container WORKDIR
COPY . .
#docker daemon port mapping
EXPOSE 3000
#runtime, WORKDIR/js/app.js execute
CMD ["node", "main.js"]