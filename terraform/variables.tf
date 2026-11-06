variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project resource name prefix"
  type        = string
  default     = "microservices-devops"
}

variable "ssh_allowed_cidr" {
  description = "Public IP allowed to SSH into EC2"
  type        = string
  default     = "49.42.50.101/32"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}



