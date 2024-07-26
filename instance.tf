resource "tls_private_key" "jaggu" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "jaggu" {
  key_name   = "jaggu-key"
  public_key = tls_private_key.jaggu.public_key_openssh
}

resource "aws_instance" "jaggu_inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.jaggu.key_name
  vpc_security_group_ids = ["terraform-sg"]
  tags = {
    name    = "jaggu-vm"
    project = "jaggu1"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  connection {
    type        = "ssh"
    user        = var.USER
    private_key = tls_private_key.jaggu.private_key_pem
    host        = self.public_ip
  }
}