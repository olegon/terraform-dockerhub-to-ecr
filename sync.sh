#!/bin/env bash

set -e

docker_hub_image="$1"
dockerhub_repostiory_tag="$2"
ecr_repository_url="$3"
aws_region="$4"

echo "[DEBUG] docker_hub_image = $docker_hub_image"
echo "[DEBUG] dockerhub_repostiory_tag = $dockerhub_repostiory_tag"
echo "[DEBUG] ecr_repository_url = $ecr_repository_url"
echo "[DEBUG] aws_region = $aws_region"

# Downloading image from Docker Hub
docker pull "$docker_hub_image:$dockerhub_repostiory_tag"

# Authencating on ECR
aws ecr get-login-password --region "$aws_region" | docker login --username AWS --password-stdin "$ecr_repository_url"

# Rettaging docker image
docker tag "$docker_hub_image:$dockerhub_repostiory_tag" "$ecr_repository_url:$dockerhub_repostiory_tag"

# Pushing to ECR
docker push "$ecr_repository_url:$dockerhub_repostiory_tag"

# Removing ECR authentication
docker logout "$ecr_repository_url"
