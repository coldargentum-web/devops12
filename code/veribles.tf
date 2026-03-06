variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "pablic_sabnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "privat_sabnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
  default     = "10.0.3.0/24"
}

# Лучше указать свой IP/32 (безопаснее), но для ДЗ можно оставить 0.0.0.0/0
variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH to public instance (recommended: your_ip/32)"
  type        = string
  default     = "0.0.0.0/0"
}