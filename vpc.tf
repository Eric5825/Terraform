# Create VPC
# terraform aws create vpc
resource "aws_vpc" "edub_vpc" {
  cidr_block              = "${var.vpc-cidr}"
  instance_tenancy        = "default"

  tags      = {
    Name    = "EDUB VPC"
  }
}

# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id    = aws_vpc.edub_vpc.id

  tags      = {
    Name    = "EDUB IGW"
  }
}

# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.edub_vpc.id
  cidr_block              = "${var.public-subnet-1-cidr}"
  availability_zone       = "us-east-1a"
  
  tags      = {
    Name    = "Public Subnet 1"
  }
}

# Create Public Subnet 2
# terraform aws create subnet
resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.edub_vpc.id
  cidr_block              = "${var.public-subnet-2-cidr}"
  availability_zone       = "us-east-1b"
  
  tags      = {
    Name    = "Public Subnet 2"
  }
}

# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "private-subnet-1" {
  vpc_id                   = aws_vpc.edub_vpc.id
  cidr_block               = "${var.private-subnet-1-cidr}"
  availability_zone        = "us-east-1a"
  
  tags      = {
    Name    = "Private Subnet 1"
  }
}

# Database
resource "aws_db_instance" "edub_db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

# Create a load balancer,application
resource "aws_lb" "edub-lb" {
  name               = "edub-lb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]

  enable_deletion_protection = false

  
  tags = {
    Name = "EDUB-lb"
  }
}