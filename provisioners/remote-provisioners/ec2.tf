resource "aws_instance" "db" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-05591528ad1d39b0e"]
  tags = {
  Name = "web"

  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
     "sudo dnf install ansible -y",
     "sudo dnf install nginx -y ",
     "sudo systemctl start nginx"
    ]
  }

}