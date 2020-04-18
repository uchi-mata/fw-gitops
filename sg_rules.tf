provider "aws" {
  region = "us-east-2"
}

########################################## Security Groups

resource "aws_security_group" "sg_web" {
  name        = "sg_web"
  id          = "sg-05e8d866ca2a16969"
  description = "SG for web servers"
  vpc_id      = "vpc-05fb0e7964de7d239"

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["4.4.2.2/32"]
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
