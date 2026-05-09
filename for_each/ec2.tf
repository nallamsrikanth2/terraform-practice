resource "aws_instance" "expense" {
  for_each = var.instance_info
  ami           = data.aws_ami.ami_info.id
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = merge(
    var.common_tags,
    {
        Name = each.key
        Module = each.key
    }
  )
}

resource "aws_security_group" "allow_ssh" {
  name        = var.sg_name
  description = var.description
  
  dynamic "ingress" {
    for_each = var.allow_ports
  
    content {
        from_port        = ingress.value["port"]
        to_port          = ingress.value["port"]
        protocol         = ingress.value["protocol"]
        cidr_blocks      = ingress.value["cidr_blocks"]
    }
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