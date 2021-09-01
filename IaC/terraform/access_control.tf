resource "aws_security_group" "jenkins" {
  name        = "Jenkins security group"
  description = "Allow SSH and Jenkins related ports"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Jenkins interface"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Jenkins workers"
    from_port        = 50000
    to_port          = 50000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "devops-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCitxJi9iK6fngWnDL0qdjktqtUK+pPu1Uzxpbja7H7LWS2a1X8qa1xW27bxdX0dRDfFuNY1YAN2MQK003aV3HePSLuskU+h/nsQUkfBzbYVCMqzfzjeQoWfBFhOZbxlRoY6l8Y9sFyeAFauPHNYoosHxB5Lty2AJNme+Yt7jYTFyR2NtGi5780EKQSV1lqgs0TuQCvUnq70JPjVrVYeGlfWG0pppdp/5G1aZxf4gmxbItGWRkkSBCTzhPwROna6nKX/rhI8A8Ioz6SF5ymHrGVcz9MY3ni4klOVU8yso0sj/a8jIFdeqzOsywzVrWdENytHvj24PqcPiB6vnHk4KpDpjmtYBL1f3G2jKwtUJc+nru7J41IyeAt0LAFt1nM3AZHe147cNgNRKLcDMvQ/8+iiLudNgO+S0xgWQfMKI1Dvu4TRaLUpVG3hRBZxd7PxQI2iWe9rebBWvi1r93eSoWNv2ln5VvyBPIX0wEI3JD4t6TcMQk1PfmhWhH+Sd7fX8+1gpHWrUR/l1IzYOkbS7uGNlgliJ4myPQhMgCyqbytLlvu4yQu37TRyMyXMreHUWyvVwMKybk0avAhKwkx873vbE6nAkYVi8bXzd3S4BoIIxVQcIQgSWt0SIOufkPaR66QGvZQil/xBBV00ESj8p7sFhUdN1rcxuXrTfwTVcGKTw== d.manakovskiy@innopolis.university"
}
