variable "ami_id" {
  type        = string
  default = "ami-0861f4e788f5069dd"
  description = "The id of the machine image (AMI) to use for the server."
}

variable "instance_type" {
  type        = string
#   default = "t3.micro"
  description = "type of instance"
}

variable "ec2_tags" {
    type = map(string)
  default = {
    Name = "HelloWorld"
    purpose = "variable tags"
  }
}

variable "sg_name" {
  type        = string
  default = "allow-all"
}

variable "sg_desc" {
  type        = string
  default = "Allowing all ports from internet"
}

variable "from_port" {
 type = number
  default = 0
}

variable "to_port" {
  type = number
  default = 0
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    type = map(string)
  default = {
    Name = "allow-all"
    purpose = "sg tags"
  }
}
