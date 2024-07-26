provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "intro" {
  ami                    = "ami-0862be96e41dcbf74"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-2a"
  key_name               = "terra-sg"
  vpc_security_group_ids = ["terraform-sg"]

  tags = {
    Name = "dove-instance"
  }
}

