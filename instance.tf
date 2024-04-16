terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.region
}
variable "region" {
  default = "us-east-1"
}
resource "aws_instance" "public-instance" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet.id
  tags = {
    Name = "public-instance"
  }
}
