#!/bin/bash

# Exit on any error
set -e

# Define variables
IMAGE_NAME="artgallery"
TAG="latest"

# Navigate to the directory containing the Dockerfile
echo "🏗️  Building Docker image: $IMAGE_NAME:$TAG"

# Build the Docker image
docker build -t "$IMAGE_NAME:$TAG" .

echo "✅ Build completed successfully!"
