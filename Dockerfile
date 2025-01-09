# Base image
FROM node:18-alpine

# Install Python 3, setuptools, and build dependencies
RUN apk add --no-cache python3 py3-setuptools make g++ gcc

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN yarn install

# Copy app source
COPY . .

# Set environment variables from config example
COPY server/config/config.env.example server/config/config.env

# Expose port
EXPOSE 4000

# Start command
CMD ["npm", "run", "start"]