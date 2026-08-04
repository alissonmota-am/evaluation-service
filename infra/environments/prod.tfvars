aws_region   = "us-east-1"
project_name = "evaluation-service-prod"

# Remote State da plataforma
platform_state_bucket = "BUCKET_NAME_AQUI"
platform_state_key    = "platform-prod/terraform.tfstate"

# ElastiCache
redis_node_type = "cache.t3.micro"
