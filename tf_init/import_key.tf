resource "aws_key_pair" "deployer" {
  key_name   = "ec2_user"
  public_key = file("~/.ssh/id_rsa.pub")
}

