variable "vpc_id" {
  description = "The ID of the VPC where resources will be created."
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID where EC2 will be created."
  type        = string
}

variable "list_of_open_ports" {
  description = "List of ports to open from anywhere."
  type        = list(number)
}