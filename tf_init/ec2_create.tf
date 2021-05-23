resource "aws_instance" "UK" {
  ami = var.ec2_ami_id
  instance_type = "t2.micro"
  key_name = "ec2_user"
  private_ip = var.ip_addr
  #iam_instance_profile = "instance-terraform"
  subnet_id = var.subnet_id
  security_groups = [aws_security_group.allow_tls.id]
  user_data = file("user_data/mount_volume_init")

  tags = {
    name = var.name
    application_id = var.application_id
    description = var.description
    created_by = var.created_by
  }

 provisioner "file" {
    source = "C:/Users/yaseen/aws_practice/terraform/tf_init/snapshot_create"
    destination = "/tmp/snapshot_create"

    connection {
      type = "ssh"
      host = self.public_dns
      user = "ec2-user"
      private_key = file("~/.ssh/id_rsa")

    }
  }
}

output "terraform_instance_id" {
  value = aws_instance.UK.id
}


