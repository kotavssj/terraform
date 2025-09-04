resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  tags = {
    Name = var.ec2_tags["Name"]
  }
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_desc

    dynamic ingress {
    for_each = var.ingress_ports 
      content {
        from_port   = ingress.value["from_port"]
        to_port     = ingress.value["to_port"]
        cidr_blocks = var.cidr_blocks
        protocol = "-1"
        ipv6_cidr_blocks = ["::/0"]
      }
    }

    dynamic egress {
    for_each = var.ingress_ports
      content {
        from_port   = egress.value["from_port"]
        to_port     = egress.value["to_port"]
        cidr_blocks = var.cidr_blocks
        protocol = "-1"
        ipv6_cidr_blocks = ["::/0"]
      }
    }

  tags = {
    Name = var.sg_tags["Name"]
  }
}