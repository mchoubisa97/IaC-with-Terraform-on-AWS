# modules/target_group/main.tf

resource "aws_lb_target_group" "this" {
  name     = var.name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  health_check {
    path = var.health_check_path
    port = var.health_check_port
  }
}

output "tgarn" {
  value = aws_lb_target_group.this.arn
}