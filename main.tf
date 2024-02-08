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

resource "aws_key_pair" "demo" {
  key_name = "demo"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}
resource "local_file" "tf-key" {
    content = tls_private_key.rsa.public_key_pem
    filename = "tffile"
}
resource "aws_instance" "jenkinserver" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name      =  "demo"

  tags = {
    Name = "vicky"
  }
}
