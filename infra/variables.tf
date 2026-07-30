variable "aws_region" {
  description = "Regiao AWS"
  type        = string
}

variable "project_name" {
  description = "Nome do projeto/servico (prefixo dos recursos)"
  type        = string
}

# Remote State da plataforma
variable "platform_state_bucket" {
  description = "Bucket S3 onde esta o state da plataforma"
  type        = string
}

variable "platform_state_key" {
  description = "Key do state da plataforma no S3"
  type        = string
}

# ElastiCache
variable "redis_node_type" {
  description = "Tipo do node do ElastiCache Redis"
  type        = string
}
