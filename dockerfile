# Use an official Node.js runtime as the base image
FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

# Install curl (add this line!)
RUN apk add --no-cache curl

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
