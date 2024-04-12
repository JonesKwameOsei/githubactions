## AWS Nginx Web Server Terraform Configuration
This repository contains terraform configuration files to configure an EC2 instance running nginx web server. Following is the outline of the configuration:

1. Define AWS provider
2. Create vpc
3. Create internet gateway
4. Create Custom route table
5. Create a subnet
6. Associate subnet with route table
7. Create security group to allow port 22,80,443
8. Create a network interface with a private IP
9. Assign an elastic IP to the network interface
10. Create SSH key pair
11. Create ubuntu server and call startup script to install and enable nginx
12. Define variables and outputs

## File Structure:


- main.tf consists of providers and modules
- variable.tf contains a set of variables which can be changed as per needs of your configuration.
- output.tf contains the output a user need to show when applying the terraform configuration.

## Terraform Commands:

terraform init
terraform validate
terraform plan
terraform apply -auto-aprove