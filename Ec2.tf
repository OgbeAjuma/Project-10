resource "aws_instance" "webserver1-proj-10" {
  ami           = "ami-0fc15d50d39e4503c"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-proj10.id]
  subnet_id =  aws_subnet.pubsub-001.id
  availability_zone = "eu-west-2a"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver2-proj-10" {
  ami           = "ami-0fc15d50d39e4503c"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-proj10.id ]
  subnet_id =  aws_subnet.pubsub-002.id
  availability_zone = "eu-west-2b"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver3-proj-10" {
  ami           = "ami-0fc15d50d39e4503c"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-proj10.id ]
  subnet_id =  aws_subnet.pubsub-003.id
  availability_zone = "eu-west-2c"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}