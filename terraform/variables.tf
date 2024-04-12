# set variables for EC2 instance AMI
variable "region" {
  type = string
  default     = ["eu-west-2"]
  description = "AWS region for deployment"
}

variable "availability_zones" {
  type = list(string)
  default = ["eu-west-2a", "eu-west-2b"]
  description = "availability zone for deployment"
}

variable "cidr_block" {
  type = list(string)
  default     = ["10.0.0.0/16", "10.0.1.0/24", "0.0.0.0/0", "1.2.3.4/32"]
  description = "CIDR blocks for VPC, subnet and security group"
}

variable "private_ips" {
  # type        = list(string)
  default     = "10.0.1.50"
  description = "Private IP for EC2 nistance"
}

variable "key" {
  type = string
  default     = "ssh-key"
  description = "SSH-Key for EC2 instance"
}

variable "type" {
  type        = string
  default     = "t2.micro"
  description = "Instance type of EC2 instance"
}

variable "name" {
  type = string
  default     = "Nginx Web Server"
  description = "Name of the server"
}

variable "root_size" {
  type = number
  default     = 9
  description = "Size of the root volume"
}

