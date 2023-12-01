
resource "aws_instance" "web" {
  count = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instancetype
  subnet_id = aws_subnet.private_subnet[0].id

  tags = {
    Name = "DevCloudGeek-webserver-${count.index}"
  }
}

output "public-ip" {
  value = aws_instance.web[*].public_ip  
}

output "pivate-ip" {
  value = aws_instance.web[*].private_ip
}