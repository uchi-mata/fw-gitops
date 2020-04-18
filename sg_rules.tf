########################################## Region

provider "aws" {
  region = "us-east-2"
}

########################################## VPC

resource "aws_vpc" "demovpc" {
  cidr_block = "10.0.0.0/16"
  id = "vpc-05fb0e7964de7d239"
}

########################################## Security Groups

resource "aws_security_group" "sg_web" {
  name        = "sg_web"
  description = "SG for web servers"
  vpc_id      = aws_vpc.demovpc.id

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["8.8.8.8/32"]
  }

  # Web interface access
  ingress {
    from_port   = 80
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound access allowed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
