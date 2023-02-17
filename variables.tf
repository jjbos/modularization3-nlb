variable "env_short" {
  type = string
  description = "Set the short environment name, i.e. dev, test, acc, prod"
}

variable "app_name" {
  type = string
  description = "Set the application name i.e. crm"
}

variable "lb_subnet_ids" {
  type        = list(any)
  default     = null
  description = "The list of subnet IDs where the lb will live"
}

variable "protocol" {
  type        = map(string)
  default     = null
  description = "list of names and ports to be listening on"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "Define VPC ID"
}

variable "asg_name" {
  type        = string
  default     = null
  description = "Set ASG name"
}