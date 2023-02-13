#!/bin/sh


# Build docker image
echo -e "Building docker image..."
docker buildx build --platform linux/amd64 . -t dockernetexample

echo -e "\n\n\n\n------------------------------------------------------"
echo -e "Tagging docker image..."
echo -e "------------------------------------------------------"

docker tag dockernetexample ilgazinho/dockernetexample

echo -e "\n\n\n\n------------------------------------------------------"
echo -e "Pushing docker image to Docker Hub..."
echo -e "------------------------------------------------------"

docker image push ilgazinho/dockernetexample

echo -e "\n\n\n\n------------------------------------------------------"
echo -e "Deploying to DO..."
echo -e "------------------------------------------------------"

# Run compose methods on remote server
#ssh root@164.92.201.239 'cd web-api; docker compose down 2>/dev/null; docker compose pull 2>/dev/null; docker compose up -d 2>/dev/null'

echo -e "\n\n\n\n------------------------------------------------------"
echo -e "Deployment completed!"
