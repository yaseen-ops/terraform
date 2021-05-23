provider "aws" {
   region = "us-east-1"
}

/* data "aws_ami" "get_ami" {
  owners = ["self"]
  most_recent = true
  filter {
    name = "name"
    values = ["AMI Created from Terraform"]
  }
}

output "current-ami" {
  value = data.aws_ami.get_ami.tags.name
} */
module "ami_create" {
  source = "./ami_create"
}
