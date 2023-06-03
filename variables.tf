variable "dockerhub_repository_name" {
  type        = string
  description = "Docker Hub source repository name."
}

variable "dockerhub_repository_tag" {
  type        = string
  description = "Docker Hub source/destination repository tag."
}

variable "ecr_repository_url" {
  type        = string
  description = "ECR destination repository name."
}
