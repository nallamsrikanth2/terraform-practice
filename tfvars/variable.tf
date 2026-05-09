# instance variable
variable "instance_info" {
    type = map
  
}

variable "common_tags" {
    default = {
        Terraform = "true"
        project  = "Expense"
    }
  
}

variable "Environment" {
  type = string
}

# sg_group variables

variable "sg_name" {
    default = "allow_ssh"
  
}

variable "description" {
    default = "open port 22, 80, 3306, 8080"
  
}

variable "allow_ports" {
    default = [
        {
            port = 22
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
        },
        {
        port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    ]
  
}

# r53 variable

variable "domain_name" {
    default = "nsrikanth.online"
  
}