output "eip_id" {
  description = "The ID of the Elastic IP"
  value       = aws_eip.example.id
}

output "eip_public_ip" {
  description = "The public IP address of the Elastic IP"
  value       = aws_eip.example.public_ip
}
