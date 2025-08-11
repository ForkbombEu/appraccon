#!/bin/bash

# Build the Docker image
echo "Building AppRaccoon Docker image..."
docker build -t appraccoon .

if [ $? -eq 0 ]; then
    echo "✅ Docker image built successfully!"
    echo ""
    echo "Usage examples:"
    echo "docker run --rm appraccoon \"https://play.google.com/store/apps/details?id=com.whatsapp\""
    echo "docker run --rm appraccoon \"https://play.google.com/store/apps/details?id=com.spotify.music\""
else
    echo "❌ Failed to build Docker image"
    exit 1
fi
