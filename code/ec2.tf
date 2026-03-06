data "aws_ami" "amazon_linux_2023_latest" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHYjXtC1DxG5nkMhXcLWTz7apid0hy0Uj3/FXZWepwnb gl-12-01-25"
}

resource "aws_security_group" "public" {
  name        = "public"
  description = "Allow SSH inbound; all outbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-sg"
  }
}

resource "aws_security_group" "privat" {
  name        = "privat"
  description = "Allow SSH only from public SG; all outbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "SSH from public SG"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}

resource "aws_instance" "public" {
  ami                         = data.aws_ami.amazon_linux_2023_latest.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pablic.id
  vpc_security_group_ids      = [aws_security_group.public.id]
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  tags = {
    Name = "public-ec2"
  }
}

resource "aws_instance" "privat" {
  ami                    = data.aws_ami.amazon_linux_2023_latest.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.privat.id
  vpc_security_group_ids = [aws_security_group.privat.id]
  key_name               = aws_key_pair.deployer.key_name

  tags = {
    Name = "private-ec2"
  }
}