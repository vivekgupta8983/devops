provider "aws" {
    access_key = "AKIAVT5ILJZYO4DWUWXO"
    secret_key = "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"
    region = "us-east-1"
}



resource "aws_instance" "web" {
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t3.micro"
  subnet_id = "subnet-0fe80f50fb4bd07ce"
  security_groups = [aws_security_group.allow_ssh.id]
}



resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-09411f73ea6b833d2"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
