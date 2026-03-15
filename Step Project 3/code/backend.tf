terraform {
  required_version = ">= 1.6.0"

  backend "s3" {
    bucket       = "michael-tfstate-jenkins-4115f6db"
    key          = "jenkins/terraform.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}