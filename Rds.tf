resource "aws_db_instance" "my-proj10sql-db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin1"
  password             = "admin124"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.my-p10rds-db-subnet.id
}

#Create RDS subnet
resource "aws_db_subnet_group" "my-p10rds-db-subnet" {
  name       = "my-p10rds-db-subnet"
  subnet_ids = [aws_subnet.privsub-001.id, aws_subnet.privsub-002.id]

  tags = {
    Name = "my-p10rds-db-subnet"
  }
}

resource "aws_security_group" "rds-SG-proj10" {
  name        = "rds-SG-proj10"
  description = "Allow inbound traffic db"
  vpc_id      = aws_vpc.project-10.id
}

resource "aws_security_group_rule" "my-p10rds-sg-rule" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"
  ]
  
  security_group_id = aws_security_group.rds-SG-proj10.id
}

resource "aws_security_group_rule" "outbound_rule" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.rds-SG-proj10.id
  cidr_blocks       = ["0.0.0.0/0"
  ]
}

