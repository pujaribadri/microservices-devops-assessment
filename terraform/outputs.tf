output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app_server.id
}

output "ec2_public_ip" {
  description = "EC2 public IP address"
  value       = aws_instance.app_server.public_ip
}

output "ec2_public_dns" {
  description = "EC2 public DNS"
  value       = aws_instance.app_server.public_dns
}

output "ecr_repository_urls" {
  description = "ECR repository URLs"
  value = {
    user_service    = aws_ecr_repository.user_service.repository_url
    product_service = aws_ecr_repository.product_service.repository_url
    order_service   = aws_ecr_repository.order_service.repository_url
  }
}

output "security_group_id" {
  description = "Application security group ID"
  value       = aws_security_group.app_sg.id
}
