variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "jenkins-step3"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "10.20.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
  default     = "10.20.2.0/24"
}

variable "master_instance_type" {
  description = "Jenkins master instance type"
  type        = string
  default     = "t3.small"
}

variable "worker_instance_type" {
  description = "Jenkins worker instance type"
  type        = string
  default     = "t3.small"
}

variable "ssh_public_key" {
  description = "Your public SSH key"
  type        = string
}

variable "ssh_access_cidr" {
  description = "Your public IP with /32 for SSH"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Project = "step-project-3"
    Owner   = "Michael"
    Env     = "study"
  }
}