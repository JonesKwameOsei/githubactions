################################################################################
# Declaring Provider
################################################################################

terraform {
  backend "s3" {
    bucket = "jones-tf-state-bucket"
    key    = "devops/infrastructure/resources.tfstate"
    region = var.region
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.0"
      # Latest provider verion: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    }
  }
}

provider "aws" {
  region = var.region
}