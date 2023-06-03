data "aws_region" "current" {}

resource "null_resource" "this" {
  triggers = {
    dockerhub_repository_name = var.dockerhub_repository_name
    dockerhub_repository_tag  = var.dockerhub_repository_tag
    ecr_repository_url        = var.ecr_repository_url
    aws_region                = data.aws_region.current.name
  }

  provisioner "local-exec" {
    working_dir = path.module
    command     = "./sync.sh '${var.dockerhub_repository_name}' '${var.dockerhub_repository_tag}' '${var.ecr_repository_url}' '${data.aws_region.current.name}'"
  }
}
