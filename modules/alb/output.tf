# modules/alb/outputs.tf

output "alb_arn" {
  description = "The ARN of the load balancer"
  value       = aws_alb.this.arn
}

output "dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_alb.this.dns_name
}
