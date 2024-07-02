resource "aws_eip" "example" {
  instance = var.instance_id
  vpc      = true

  tags = {
    Name = var.eip_name
  }
}
