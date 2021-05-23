
resource "aws_instance" "UK" {
  ami                   = "ami-0d5eff06f840b45e9"
  instance_type         = "t2.micro"
  count                 = 3
  key_name              = "ec2_user"
  #iam_instance_profile = "instance-terraform"
  subnet_id             = var.subnet_id
  security_groups       = [aws_security_group.allow_tls.id]
  #user_data            = file("user_data/mount_volume")

  tags = {
    name           = var.name
    application_id = var.application_id
    description    = var.description
    created_by     = var.created_by
    environment    = "dev"
  }
}


