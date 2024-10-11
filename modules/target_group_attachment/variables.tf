# modules/target_group_attachment/variables.tf

variable "target_group_arn" {
  type = string
}

variable "target_id" {
  type = string
}

variable "port" {
  type    = number
  default = 80
}
