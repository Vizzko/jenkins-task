# Use the official Node.js 18 Alpine image as a lightweight base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json first (for npm install layer caching)
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy all app source code to the container
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Default command to run your app
CMD ["npm", "start"]
