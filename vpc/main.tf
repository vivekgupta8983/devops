module "vpc" {
    source = "../modules/vpc"
    # vpc_cidr_block = "192.168.0.0/16"
    # public_subnet = [ "192.168.1.0/24", "192.168.2.0/24" ]
    # private_subnet = [ "192.168.3.0/24", "192.168.4.0/24" ]
}