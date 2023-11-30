# Use an official Node.js runtime as the base image
FROM node:alpine

# Set the working directory in the container
WORKDIR .

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the source code to the container
COPY . .

# Build the React app for production
RUN npm run build

# Install a lightweight web server
RUN npm install -g serve

# Set the command to run when the container starts
CMD ["serve", "-s", "build", "-l", "3000"]

# Expose the specified port
EXPOSE 3000