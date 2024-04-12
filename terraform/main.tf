################################################################################
# Declaring Resources
################################################################################

# Defining VPC
resource "aws_vpc" "vpc_web" {
  cidr_block = var.cidr_block[0]
}

# Defining Internet Gateway
resource "aws_internet_gateway" "ig_web" {
  vpc_id = aws_vpc.vpc_web.id
}

# Defining Custom Route Table
resource "aws_route_table" "route_web" {
  vpc_id = aws_vpc.vpc_web.id

  route {
    cidr_block = var.cidr_block[2]
    gateway_id = aws_internet_gateway.ig_web.id
  }

  tags = {
    Name = "${local.resource_name}_Route_Table"
  }
}

# Defining Subnet
resource "aws_subnet" "subnet_web" {
  vpc_id            = aws_vpc.vpc_web.id
  cidr_block        = var.cidr_block[1]
  availability_zone = var.region[1]

  tags = {
    Name = "${local.resource_name}_Subnet"
  }
}

# Associating route table with subnet
resource "aws_route_table_association" "rta_web" {
  subnet_id      = aws_subnet.subnet_web.id
  route_table_id = aws_route_table.route_web.id
}

# Defining Security group for HTTP, HTTPS and SSH protocols
resource "aws_security_group" "sg_web" {
  name        = "${local.resource_name} Server"
  description = "Allow Web Server Traffic"
  vpc_id      = aws_vpc.vpc_web.id

  ingress {
    description = "HTTP Incoming traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block[2]]
  }

  ingress {
    description = "HTTPs Incoming traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block[2]]
  }

  ingress {
    description = "SSH Incoming traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block[3]]
  }

  egress {
    description = "All Outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_block[2]]
  }

  tags = {
    Name = "${local.resource_name}_Security_Group"
  }

}

# Defining network interface
resource "aws_network_interface" "nic_web" {
  subnet_id       = aws_subnet.subnet_web.id
  private_ips     = [var.private_ips]
  security_groups = [aws_security_group.sg_web.id]

  # Use only if not declared in instance resource block
  #   attachment {  
  #     instance     = aws_instance.ec2_web.id
  #     device_index = 1
  #   }
}

# Assinging elastic IP
resource "aws_eip" "elastic_web" {
  depends_on                = [aws_internet_gateway.ig_web]
  domain                    = "vpc"
  network_interface         = aws_network_interface.nic_web.id
  associate_with_private_ip = aws_network_interface.nic_web.private_ip

  tags = {
    Name = "${local.resource_name}_Elastic_IP"
  }
}

# Importing SSH key
# resource "aws_key_pair" "key_web" {
#   key_name   = var.key
#   public_key = file("aws_key.pub")
# }

# Defining EC2 instance
resource "aws_instance" "ec2_web" {
  ami               = data.aws_ami.ubuntu_latest.id
  instance_type     = var.type
  availability_zone = var.availability_zones[0]
  user_data = file("userdata.tpl")
  root_block_device {
    volume_size = var.root_size
  }

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.nic_web.id
  }
  tags = {
    Name = var.name
  }
}
