#!/bin/bash

# Configuration
DOCKER_REPO="forkbombeu/appraccoon"
VERSION="v1.0.0"

echo "🚀 Publishing AppRaccoon Docker image..."

# Check if user is logged in to Docker Hub
if ! docker info | grep -q "Username:"; then
    echo "Please login to Docker Hub first:"
    echo "docker login"
    exit 1
fi

# Build the image first
echo "Building the image..."
docker build -t appraccoon .

if [ $? -ne 0 ]; then
    echo "❌ Failed to build Docker image"
    exit 1
fi

# Tag the image for Docker Hub
echo "Tagging image for Docker Hub..."
docker tag appraccoon ${DOCKER_REPO}:latest
docker tag appraccoon ${DOCKER_REPO}:${VERSION}

# Push to Docker Hub
echo "Pushing to Docker Hub..."
docker push ${DOCKER_REPO}:latest
docker push ${DOCKER_REPO}:${VERSION}

if [ $? -eq 0 ]; then
    echo "✅ Successfully published to Docker Hub!"
    echo ""
    echo "Image is now available at:"
    echo "  ${DOCKER_REPO}:latest"
    echo "  ${DOCKER_REPO}:${VERSION}"
    echo ""
    echo "Users can now run:"
    echo "  docker run --rm ${DOCKER_REPO}:latest \"<google-play-url>\""
else
    echo "❌ Failed to push to Docker Hub"
    exit 1
fi
