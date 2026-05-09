resource "aws_instance" "db" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-05591528ad1d39b0e"]
  tags = {
  Name = "web"
}
  provisioner "local-exec" {
    command = "echo  ${self.private_ip} > private_ips.txt"
  }

   provisioner "local-exec" {
    command = "ansible-plabbok -i private_ips.txt web.yaml"
  }

}