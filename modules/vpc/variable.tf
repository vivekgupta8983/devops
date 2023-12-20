variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "enable_dns_hostnames" {
  type    = bool
  default = false
}

# variable "instancetype" {
#   default = "t2.micro"
# }

variable "openvpn_ip" {
  default = "10.0.1.0"
}

variable "project_name" {
  default = "DevCloudGeek"
}