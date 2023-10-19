terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.20.1"
    }
  }
}
provider "aws" {
  region = "ap-south-1"  # Change this to your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"             # Instance type
  key_name      = "terraformkey"   # Your key pair name

  tags = {
    Name = "myubuntu"
  }
}
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.example.public_ip
}