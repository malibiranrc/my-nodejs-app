# Use an official Node.js runtime as a parent image
FROM node:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install
RUN npm install express

# Copy application source code to the working directory
COPY . .

# Expose the port the app runs on (your application should listen on this port)
EXPOSE 3000

# Start the application when the container starts
CMD ["node", "app.js"]