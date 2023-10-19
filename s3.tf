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

resource "aws_instance" "terraformmachine1" {
  ami           = "ami-0f5ee92e2d63afc18"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = "terraformkey"   # Your key pair name

  tags = {
    Name = "mytestmachine"
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.terraformmachine1.public_ip
}

resource "aws_s3_bucket" "terraforms3bucket" {
  bucket = "terraformsthreebucket"
}
resource "aws_s3_object"  "terraforms3object" {
  bucket = aws_s3_bucket.terraforms3bucket.id
  key = "pragathees.txt"
  source = "/root/pragathees.txt"
}
