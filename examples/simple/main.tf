resource "aws_ecr_repository" "this" {
  name                 = "my-nginx-copy"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

module "this" {
  source = "../../"

  dockerhub_repository_name = "nginx"
  dockerhub_repository_tag  = "latest"
  ecr_repository_url        = aws_ecr_repository.this.repository_url
}
