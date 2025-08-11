#!/bin/bash

# Configuration
DOCKER_REPO="ghcr.io/forkbombeu/appraccoon"
VERSION="v1.0.0"

echo "🚀 Publishing AppRaccoon Docker image to GitHub Container Registry..."

# Check if user is logged in to GitHub Container Registry
if ! docker info | grep -q "Username:" && ! echo "$DOCKER_REPO" | grep -q "ghcr.io"; then
    echo "Please login to GitHub Container Registry first:"
    echo "echo \$GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin"
    echo "or"
    echo "docker login ghcr.io"
    exit 1
fi

# Build the image first
echo "Building the image..."
docker build -t appraccoon .

if [ $? -ne 0 ]; then
    echo "❌ Failed to build Docker image"
    exit 1
fi

# Tag the image for GitHub Container Registry
echo "Tagging image for GitHub Container Registry..."
docker tag appraccoon ${DOCKER_REPO}:latest
docker tag appraccoon ${DOCKER_REPO}:${VERSION}

# Push to GitHub Container Registry
echo "Pushing to GitHub Container Registry..."
docker push ${DOCKER_REPO}:latest
docker push ${DOCKER_REPO}:${VERSION}

if [ $? -eq 0 ]; then
    echo "✅ Successfully published to GitHub Container Registry!"
    echo ""
    echo "Image is now available at:"
    echo "  ${DOCKER_REPO}:latest"
    echo "  ${DOCKER_REPO}:${VERSION}"
    echo ""
    echo "Users can now run:"
    echo "  docker run --rm ${DOCKER_REPO}:latest \"<google-play-url>\""
else
    echo "❌ Failed to push to GitHub Container Registry"
    exit 1
fi
