# modules/target_group/outputs.tf

output "tg_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.this.arn
}
