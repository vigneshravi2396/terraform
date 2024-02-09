terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "tff_key" {
  key_name = "tff_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}
resource "local_file" "tff-key" {
    content = tls_private_key.rsa.private_key_pem
    filename = "tff_key.pem"
}
resource "aws_instance" "jenkindevserver" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name      =  "tff_key"

  tags = {
    Name = "vicky"
  }
}

output "instance_id" {
  value = aws_instance.jenkindevserver.id
}

output "public_ip" {
  value = aws_instance.jenkindevserver.public_ip
}

output "private_ip" {
  value = aws_instance.jenkindevserver.private_ip
}
#addd newfile