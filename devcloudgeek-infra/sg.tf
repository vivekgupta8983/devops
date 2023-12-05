
# # resource "aws_security_group" "allow_ssh" {
# #   name        = "allow_ssh"
# #   description = "Allow TLS inbound traffic"
# #   vpc_id      = aws_vpc.main.id

# #   ingress {
# #     description = "SSH"
# #     from_port   = 22
# #     to_port     = 22
# #     protocol    = "tcp"
# #     cidr_blocks = ["${var.openvpn_ip}/32"]
# #   }

# #   ingress {
# #     description = "HTTP"
# #     from_port   = 80
# #     to_port     = 80
# #     protocol    = "tcp"
# #     cidr_blocks = ["${var.openvpn_ip}/32"]
# #   }

# #   ingress {
# #     description = "HTTPS"
# #     from_port   = 443
# #     to_port     = 443
# #     protocol    = "tcp"
# #     cidr_blocks = ["${var.openvpn_ip}/32"]
# #   }
# #   ingress {
# #     description = "Jenkins"
# #     from_port   = 8080
# #     to_port     = 8080
# #     protocol    = "tcp"
# #     cidr_blocks = ["${var.openvpn_ip}/32"]
# #   }
# #   egress {
# #     from_port   = 0
# #     to_port     = 0
# #     protocol    = "-1"
# #     cidr_blocks = ["0.0.0.0/0"]
# #   }

# #   tags = {
# #     Name = "allow_ssh"
# #   }
# # }


# variable "ports" {
#   type    = list(number)
#   default = [8911, 8085, 90, 80, 443, 22, 8080, 8081, 8082, 8083]
# }

# resource "aws_security_group" "allow_ssh" {
#   name        = "allow_ssh"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.main.id

#   dynamic "ingress" {
#     for_each = var.ports
#     iterator = iport
#     content {
#       from_port   = iport.value
#       to_port     = iport.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }

#   dynamic "egress" {
#     for_each = var.ports
#     iterator = iport
#     content {
#       from_port   = iport.value
#       to_port     = iport.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }

#   tags = {
#     Name = "allow_ssh"
#   }

# }