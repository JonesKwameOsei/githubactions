
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type["dev"]
  tags = {
    Name = "${var.name}-${var.servers[2]}"
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = local.resource_name
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  tags = {
    Name = "${local.resource_name}-private-subnet"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  tags = {
    Name = "${local.resource_name}-public-subnet"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.name}-jones-shiny-bucket"
  tags = {
    Name = "${var.name}-jones-demo-s3"
  }
}

