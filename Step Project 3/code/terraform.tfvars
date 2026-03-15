aws_region          = "us-west-2"
project_name        = "jenkins-step3"
vpc_cidr            = "10.20.0.0/16"
public_subnet_cidr  = "10.20.1.0/24"
private_subnet_cidr = "10.20.2.0/24"

master_instance_type = "t3.small"
worker_instance_type = "t3.small"

ssh_access_cidr = "91.225.162.183/32"
ssh_public_key  = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHYjXtC1DxG5nkMhXcLWTz7apid0hy0Uj3/FXZWepwnb gl-12-01-25"