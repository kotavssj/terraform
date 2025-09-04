data "aws_ami" "joindevops" {
  most_recent = true
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "ami_id" {
  value = data.aws_ami.joindevops.id
}