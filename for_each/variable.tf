# aws instance variable
variable "instance_info" {
    default = {
        db ="t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
  
}

variable "common_tags" {
    default = {
        Terraform = "true"
        Environment  = "dev"
    }
  
}

#sg_group variable

variable "sg_name" {
    default = "allow_ssh"
  
}

variable "description" {
    default = "open port are 22, 80, 8080, 3303"
  
}

variable "allow_ports" {
    default = [
        {
            port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            port = 3306
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
  
}

# r53 variable
variable "domain_name" {
    default = "nsrikanth.online"
  
}