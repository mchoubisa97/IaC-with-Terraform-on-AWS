# modules/alb_listener/variables.tf

variable "load_balancer_arn" {
  type = string
}

variable "port" {
  type    = number
  default = 80
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "target_group_arn" {
  type = string
}
