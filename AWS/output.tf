output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2_instance.instance_id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = module.ec2_instance.instance_public_ip
}

output "instance_public_dns" {
  description = "The public DNS name of the EC2 instance"
  value       = module.ec2_instance.instance_public_dns
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.ec2_instance.security_group_id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = module.ec2_instance.security_group_name
}

output "eip_id" {
  description = "The ID of the Elastic IP"
  value       = module.elastic_ip.eip_id
}

output "eip_public_ip" {
  description = "The public IP address of the Elastic IP"
  value       = module.elastic_ip.eip_public_ip
}
