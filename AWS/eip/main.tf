resource "aws_eip" "example" {
  instance = var.instance_id

  tags = {
    Name = var.eip_name
  }
}
