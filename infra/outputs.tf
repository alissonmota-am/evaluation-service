output "redis_endpoint" {
  description = "Endpoint do Redis (usar em REDIS_URL)"
  value       = module.elasticache.endpoint
}

output "redis_port" {
  description = "Porta do Redis"
  value       = module.elasticache.port
}
