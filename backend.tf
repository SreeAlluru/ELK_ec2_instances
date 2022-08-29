terraform {
  backend "s3" {
    bucket         = "talent-academy-monika1-lab-tfstates"
    key            = "talent-academy/ELK_ec2_instances/terraform.tfstates"
    dynamodb_table = "terraform-lock"
    region         = "eu-west-1"
  }
}