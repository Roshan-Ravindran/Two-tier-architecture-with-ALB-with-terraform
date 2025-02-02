resource "aws_instance" "instance1" {
  ami             = var.ami
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet1.id
  user_data       = file("userdata.sh")
  security_groups = [aws_security_group.ec2_sg.id]
  tags = {
    Name = "ami1"
  }
}

resource "aws_instance" "instance2" {
  ami             = var.ami
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet2.id
  user_data       = file("userdata.sh")
  security_groups = [aws_security_group.ec2_sg.id]
  tags = {
    Name = "ami2"
  }
}
