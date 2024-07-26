resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "terra-sg"
  vpc_security_group_ids = ["terraform-sg"]

  tags = {
    name = "jaga_us"
  }
}
