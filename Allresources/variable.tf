# instance variable
variable "instance_names" {
    type = list
    default = ["db", "backend", "frontend"]
  
}

variable "common_tags" {
    default = {
        Name = "db"
        Environment = "dev"
        Terraform = "true"
    }
  
}

# sg_group variable

variable "sg_name" {
    default = "allow_ssh"
  
}

variable "description" {
    default = "open port 22"
  
}

variable "port" {
    default = 22
  
}

variable "protocol" {
    default = "tcp"
  
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
  
}

variable "domain_name" {
    default = "nsrikanth.online"
  
}