aws_region   = "us-east-1"
project_name = "evaluation-service"

# Remote State da plataforma
platform_state_bucket = "BUCKET_NAME_AQUI"
platform_state_key    = "terraform-prod/terraform.tfstate"

# ElastiCache
redis_node_type = "cache.t3.micro"
