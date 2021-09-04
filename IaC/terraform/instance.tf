resource "aws_instance" "app_server" {
  ami                         = "ami-00399ec92321828f5"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.main.id

  tags = {
    Name = "DevOpsLab"
  }
}
