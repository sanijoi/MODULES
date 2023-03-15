resource "aws_vpc" "vpc-main" {
  cidr_block            = var.cidr_block 
  instance_tenancy      = "default"
}
##########AWS_Internet_Gateway###########
resource "aws_internet_gateway" "igw" {
  vpc_id  = aws_vpc.vpc-main.id

  tags = {
    Name = "ig-main"
  }
}
##########AWS_Subnets###########
resource "aws_subnet" "public_1" {
  vpc_id              = aws_vpc.vpc-main.id
  cidr_block          = var.subnet_public_1
  availability_zone   = var.availability_zone1

  tags = {
    Name = "pub1"
  }
}
resource "aws_subnet" "public_2" {
  vpc_id              = aws_vpc.vpc-main.id
  cidr_block          = var.subnet_public_2
  availability_zone   = var.availability_zone2

  tags = {
    Name = "pub2"
  }
}
resource "aws_subnet" "private_1" {
  vpc_id              = aws_vpc.vpc-main.id
  cidr_block          = var.subnet_private_1
  availability_zone   = var.availability_zone1

  tags = {
    Name = "private1"
  }
}
resource "aws_subnet" "private_2" {
  vpc_id              = aws_vpc.vpc-main.id
  cidr_block          = var.subnet_private_2
  availability_zone   = var.availability_zone2

  tags = {
    Name = "private2"
  }
}
##########AWS_Route_Table###########
resource "aws_route_table" "public_route_table" {
  vpc_id                = aws_vpc.vpc-main.id

  route {
    cidr_block          = "0.0.0.0/0"
    gateway_id          = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-route"
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc-main.id
}
##########AWS_Route_Table_Association###########
resource "aws_route_table_association" "public_sub1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_sub2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "private_sub1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "private_sub2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_route_table.id
}
##########AWS_Nat_Gateway###########
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eipibekov.id
  subnet_id     = aws_subnet.public_1.id
}
resource "aws_eip" "eipibekov" {
  vpc    = true 
}
############### Aws_Route ##################
resource "aws_route" "private_route" {
  depends_on             = [aws_route_table.public_route_table]
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
###################################################
