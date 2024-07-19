output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "instance_public_dns" {
  description = "The public DNS name of the EC2 instance"
  value       = aws_instance.example.public_dns
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.all_ports_open.id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.all_ports_open.name
}