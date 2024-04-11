output "vpc-id" {
  value = aws_vpc.main.id
}

output "instance-private-ip" {
  value = aws_instance.web.private_ip
}


