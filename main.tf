provider "aws" {
    region = "us-east-1"

}

module "vpc" {
    source = "./modules-vpc"
    vpc_cidr_block = "10.0.0.0/16"
    private_subnet = [ "10.0.1.0/24", "10.0.2.0/24"]
    public_subnet = [ "10.0.3.0/24" ]  
}