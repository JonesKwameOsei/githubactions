# Output AMI Image Name
output "ami_name" {
  value = data.aws_ami.ubuntu_image.name
}

# Output Public IP
output "web_server_public_ip" {
  value = aws_eip.elastic_web.public_ip
}

# Output Private IP
output "web_server_private_ip" {
  value = aws_instance.ec2_web.private_ip
}

# Output Web Server ID
output "web_server_id" {
  value = aws_instance.ec2_web.id
}


