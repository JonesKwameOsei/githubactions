# set variables for EC2 instance AMI
variable "ami" {
  description = "The AMI ID to be used for the EC2 Instance"
  type        = string
  default     = "ami-0d18e50ca22537278"
}

# set variables for EC2 instance Type
# variable "instance_type" {
#   description = "The AWS Instance Type to be used for the EC2 Instance"
#   type        = string
#   default     = "t2.micro"
# }

variable "instance_type" {
  type = map(any)
  default = {
    "prod" = "t2.small"
    "dev"  = "t2.micro"
  }
}

# set variables for EC2 instance NAme
variable "name" {
  description = "The instance name as prefix to be attached to almost every resource name"
  type        = string
  default     = "jonesvm"
}

variable "vpc_cidr" {
  description = "The VPC CIDR range to be used for our virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "The CIDR range to be used for the private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  description = "The CIDR range to be used for the public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "servers" {
  default = ["dev", "staging", "prod"]
  type    = list(any)
}

