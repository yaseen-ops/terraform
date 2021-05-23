terraform {
  required_version = ">=0.12"
}

provider "aws" {
   region = "us-east-1"
}

data "aws_instance" "getInstance" {
   filter {
     name = "private-ip-address"
     values = [var.ip_addr]
   }
}

output "InstanceID" {
   value = data.aws_instance.getInstance.id
}

resource "aws_ami_from_instance" "goldenAMI" {
  name = "AMI Created from Terraform"
  source_instance_id = data.aws_instance.getInstance.id

  tags = {
    name = var.name
    application_id = var.application_id
    description = var.description
    created_by = var.created_by
    ip_address = <<EOT
          %{ for ip in data.aws_instance.getInstance.*.private_ip }
          ${ip}
          %{ endfor }
    EOT
    test = "%{ if var.iftest == "" }unamed%{ endif }"
    details = <<EOT
        ${var.application_id}
        ${var.description}
        ${var.created_by}
    EOT
  }
}

output "NewAMIid" {
   value = aws_ami_from_instance.goldenAMI.id
}
