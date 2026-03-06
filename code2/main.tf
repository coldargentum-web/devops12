terraform {
  required_version = ">= 1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  backend "s3" {
    bucket = "terraform-state-danit-devops-devops-cli-user-463886700224"
    key    = "devops-cli-user/aws-terraform-module-exercise/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "nginx_server" {
  source             = "./modules/nginx"
  vpc_id             = var.vpc_id
  subnet_id          = var.subnet_id
  list_of_open_ports = var.list_of_open_ports
}