terraform {
  backend "s3" {
    bucket = "jones-tf-state-bucket"
    key    = "devops/infrastructure/resources.tfstate"
    region = "eu-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}