# variable "istest" {
#   type    = bool
#   default = false
# }

# # variable "instance_type" {
# #     type = map(string)
# #     default = {
# #       "dev" = "t2.micro"
# #       "test" = "t2.medium"
# #       "prod" = "t2.large"
# #     }

# # }
# # variable "env" {
  
# # }

# # Creating the test-server instance if `istest` equals true
# resource "aws_instance" "test-server" {
#   ami           = "ami-05cafdf7c9f772ad2"
#   instance_type = var.istest
#   count         = var.istest == true ? 0 : 1 # conditional expression
# }

# # Creating the prod-server instance if `istest` equals false
# # resource "aws_instance" "prod-server" {
# #   ami           = "ami-05cafdf7c9f772ad2"
# #   instance_type = "t2.large"                  # it's not free tier eligible
# #   count         = var.istest == false ? 1 : 0 # conditional expression
# # }