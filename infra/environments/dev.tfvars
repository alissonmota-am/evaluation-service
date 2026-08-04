aws_region   = "us-east-1"
project_name = "evaluation-service-dev"

# Remote State da plataforma
platform_state_bucket = "toggle-master-terraform-state-103568492404"
platform_state_key    = "platform/dev/terraform.tfstate"

# ElastiCache
redis_node_type = "cache.t3.micro"
