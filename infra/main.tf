################################################################################
# Remote State — dados da plataforma (VPC + EKS)
################################################################################
data "terraform_remote_state" "platform" {
  backend = "s3"

  config = {
    bucket = var.platform_state_bucket
    key    = var.platform_state_key
    region = var.aws_region
  }
}

################################################################################
# ElastiCache Redis
################################################################################
module "elasticache" {
  source = "git::https://github.com/alissonmota-am/toggle-master-infra.git//modules/elasticache?ref=develop"

  project_name               = var.project_name
  vpc_id                     = data.terraform_remote_state.platform.outputs.vpc_id
  subnet_ids                 = data.terraform_remote_state.platform.outputs.private_subnet_ids
  eks_node_security_group_id = data.terraform_remote_state.platform.outputs.eks_node_security_group_id
  node_type                  = var.redis_node_type
}

################################################################################
# Secrets Manager — Redis URL
################################################################################
resource "aws_secretsmanager_secret" "redis_url" {
  name                    = "${var.project_name}/redis-url"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "redis_url" {
  secret_id     = aws_secretsmanager_secret.redis_url.id
  secret_string = "redis://${module.elasticache.endpoint}:${module.elasticache.port}"
}
