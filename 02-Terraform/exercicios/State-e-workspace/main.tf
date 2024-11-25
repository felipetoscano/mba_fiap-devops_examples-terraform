provider "aws" {
   region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "base-config-353708"
    key    = "teste"
    region = "us-east-1"
  }
}

data "aws_ami" "hvm" {
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.202*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners      = ["amazon"]
  most_recent = true
}

resource "aws_instance" "ec2-test" {
  ami           = data.aws_ami.hvm.id
  instance_type = "t3.micro"
  tags = {
    Name = "ec2-${terraform.workspace}"
  }
}
