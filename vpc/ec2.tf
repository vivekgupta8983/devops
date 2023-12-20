resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "name" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = "subnet-04ac1020b0702baf1"

  # provisioner "local-exec" {
  #   command = "${aws_instance.name.public_ip} >> public_ips.txt"
  # }
}

# output "public_pi" {
#   value = aws_instance.name.public_ip
# }


resource "aws_instance" "import_example" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = "subnet-092ad5b8e88ba9b57"
}

resource "null_resource" "apache" {

  # provisioner "local-exec" {
  #   command = "'${aws_instance.name.public_ip}' >> public_ips.txt"
  # }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt upgrade -y",
      "sudo apt install apache2 -y"
    ]
  }

  connection {
    type        = "ssh"
    timeout = "30m"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.name.public_ip
  }


  # timeouts {
  #   create = "60m"
  #   delete = "2h"
  # }

}