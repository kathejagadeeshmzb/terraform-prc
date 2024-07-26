variable "REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-0862be96e41dcbf74"
    us-east-1 = "ami-0427090fd1714168b"
  }
}

variable "USER" {
  default = "ubuntu"
}

