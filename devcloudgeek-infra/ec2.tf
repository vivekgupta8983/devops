
# resource "aws_instance" "web" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instancetype
# }

# output "public-ip" {
#   value = aws_instance.web.public_ip  
# }

# output "pivate-ip" {
#   value = aws_instance.web.private_ip
# }
# # 