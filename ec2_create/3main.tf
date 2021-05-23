resource "aws_instance" "UK" {
   ami = "ami-038f1ca1bd58a5790"
   instance_type = "t2.micro"
   key_name = "ec2_user"
   subnet_id = "subnet-0c865bcfbb29e1dd0"
   security_groups = ["sg-0c719bff3f5387408"]

   tags = {
      name = "Jenkins Terrafrom test"
      application_id = "UK"
      desciption = "Terrform test ec2 instance"
      ExcludeBackup = "true"
   }
 }

output "terraform_instance_id" {
  value = aws_instance.UK.id
}


