resource "aws_vpc" "project-10" {
  cidr_block       = var.vpc-cidr01
  instance_tenancy = "default"

  tags = {
    Name = "project-10"
  }
}

# Public Subnet

resource "aws_subnet" "pubsub-001" {
  vpc_id     = aws_vpc.project-10.id
  cidr_block = var.publsub001
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsub-001"
  }
}

resource "aws_subnet" "pubsub-002" {
  vpc_id     = aws_vpc.project-10.id
  cidr_block = var.publsub002
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsub-002"
  }
}

resource "aws_subnet" "pubsub-003" {
  vpc_id     = aws_vpc.project-10.id
  cidr_block = var.publsub003
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsub-003"
  }
}
#Private subnet

resource "aws_subnet" "privsub-001" {
  vpc_id     = aws_vpc.project-10.id
  cidr_block = var.privasub001
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "privsub-001"
  }
}


resource "aws_subnet" "privsub-002" {
  vpc_id     = aws_vpc.project-10.id
  cidr_block = var.privasub002
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "privsub-002"
  }
}


resource "aws_subnet" "privsub-003" {
  vpc_id     = aws_vpc.project-10.id
  cidr_block = var.privasub003
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "privsub-003"
  }
}

#Route table

resource "aws_route_table" "publicrt001" {
  vpc_id = aws_vpc.project-10.id

  tags = {
    Name = "publicrt001"
  }
}

resource "aws_route_table" "privatert001" {
  vpc_id = aws_vpc.project-10.id

  route = []

  tags = {
    Name = "privatert001"
  }
}

#RT association

resource "aws_route_table_association" "pubrt-asso001" {
  subnet_id      = aws_subnet.pubsub-001.id
  route_table_id = aws_route_table.publicrt001.id
}

resource "aws_route_table_association" "pubrt-asso002" {
  subnet_id      = aws_subnet.pubsub-002.id
  route_table_id = aws_route_table.publicrt001.id
}

resource "aws_route_table_association" "pubrt-asso003" {
  subnet_id      = aws_subnet.pubsub-003.id
  route_table_id = aws_route_table.publicrt001.id
}


resource "aws_route_table_association" "privrt-asso001" {
  subnet_id      = aws_subnet.privsub-001.id
  route_table_id = aws_route_table.privatert001.id
}

resource "aws_route_table_association" "privrt-asso002" {
  subnet_id      = aws_subnet.privsub-002.id
  route_table_id = aws_route_table.privatert001.id
}


resource "aws_route_table_association" "privrt-asso003" {
  subnet_id      = aws_subnet.privsub-003.id
  route_table_id = aws_route_table.privatert001.id
}
#Igw

resource "aws_internet_gateway" "igw-project-10" {
  vpc_id = aws_vpc.project-10.id

  tags = {
    Name = "igw-project-10"
  }
}

resource "aws_route" "igw-rtasso" {
  route_table_id = aws_route_table.publicrt001.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.igw-project-10.id
}

