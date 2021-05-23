resource "aws_ebs_volume" "terraform_volume1" {
  availability_zone = aws_instance.UK.availability_zone
  encrypted         = "true"
  size              = 2

  tags = {
    Name = "OPT"
    description = var.description
    name = var.name
  }
}


resource "aws_ebs_volume" "terraform_volume2" {
  availability_zone = aws_instance.UK.availability_zone
  encrypted         = "true"
  size              = 2
  tags = {
    Name = "MNT"
    description = var.description
    name = var.name
  }
}

resource "aws_ebs_volume" "terraform_volume3" {
  availability_zone = aws_instance.UK.availability_zone
  encrypted         = "true"
  size              = 2

  tags = {
    Name = "MEDIA"
    description = var.description
    name = var.name
  }
}

resource "aws_volume_attachment" "terraform_attach_vol1" {
  device_name = "/dev/sdx"
  volume_id   = aws_ebs_volume.terraform_volume1.id
  instance_id = aws_instance.UK.id
  depends_on = [aws_instance.UK]
}

resource "aws_volume_attachment" "terraform_attach_vol2" {
  device_name = "/dev/sdy"
  volume_id   = aws_ebs_volume.terraform_volume2.id
  instance_id = aws_instance.UK.id
  depends_on = [aws_instance.UK]
}

resource "aws_volume_attachment" "terraform_attach_vol3" {
  device_name = "/dev/sdz"
  volume_id   = aws_ebs_volume.terraform_volume3.id
  instance_id = aws_instance.UK.id
  depends_on = [aws_instance.UK]
}


output "OPT" {
  value = aws_ebs_volume.terraform_volume1.id
}

output "MNT" {
  value = aws_ebs_volume.terraform_volume2.id
}

output "MEDIA" {
  value = aws_ebs_volume.terraform_volume3.id
}
