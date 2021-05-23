resource "aws_instance" "UK" {
  ami = var.ec2_ami_id
  instance_type = "t2.micro"
  key_name = "ec2_user"
  private_ip = var.ip_addr
  #iam_instance_profile = "instance-terraform"
  subnet_id = var.subnet_id
  security_groups = ["sg-010d65c8f101db65d"]
  user_data = file("user_data/mount_volume_init")

  tags = {
    name = var.name
    application_id = var.application_id
    description = var.description
    created_by = var.created_by
  }

}

output "terraform_instance_id" {
  value = aws_instance.UK.id
}


