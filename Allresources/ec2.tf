resource "aws_instance" "expense" {
  count = length(var.instance_names)
  ami           = data.aws_ami.ami_info.id
  instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = merge(
    var.common_tags,
    {
        Name = var.instance_names[count.index]
        Module = var.instance_names[count.index]
    }
  )
}


resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.description
    ingress {
    from_port        = var.port
    to_port          = var.port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}