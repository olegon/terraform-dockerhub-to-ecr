#!/bin/env bash

set -e

dockerhub_repository_name="$1"
dockerhub_repository_tag="$2"
ecr_repository_url="$3"
aws_region="$4"

echo "[DEBUG] dockerhub_repository_name = $dockerhub_repository_name"
echo "[DEBUG] dockerhub_repository_tag = $dockerhub_repository_tag"
echo "[DEBUG] ecr_repository_url = $ecr_repository_url"
echo "[DEBUG] aws_region = $aws_region"

# Downloading image from Docker Hub
docker pull "$dockerhub_repository_name:$dockerhub_repository_tag"

# Authencating on ECR
aws ecr get-login-password --region "$aws_region" | docker login --username AWS --password-stdin "$ecr_repository_url"

# Rettaging docker image
docker tag "$dockerhub_repository_name:$dockerhub_repository_tag" "$ecr_repository_url:$dockerhub_repository_tag"

# Pushing to ECR
docker push "$ecr_repository_url:$dockerhub_repository_tag"

# Removing ECR authentication
docker logout "$ecr_repository_url"
