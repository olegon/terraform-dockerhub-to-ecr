# Docker Hub to Amazon ECR

Terraform module that sends a docker image from Docker Hub to Amazon ECR using [local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec) and [null-resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource).

> You must have docker and bash installed because this module only executes it on your behalf.

## Example

```hcl
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
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3 |
| <a name="provider_null"></a> [null](#provider\_null) | >= 3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.this](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dockerhub_repository_name"></a> [dockerhub\_repository\_name](#input\_dockerhub\_repository\_name) | Docker Hub source repository name. | `string` | n/a | yes |
| <a name="input_dockerhub_repository_tag"></a> [dockerhub\_repository\_tag](#input\_dockerhub\_repository\_tag) | Docker Hub source/destination repository tag. | `string` | n/a | yes |
| <a name="input_ecr_repository_url"></a> [ecr\_repository\_url](#input\_ecr\_repository\_url) | ECR destination repository name. | `string` | n/a | yes |

## Outputs

No outputs.

> Docs made with [terraform-docs](https://terraform-docs.io/)!