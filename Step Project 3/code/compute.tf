resource "aws_key_pair" "main_key" {
  key_name   = "${var.project_name}-key"
  public_key = var.ssh_public_key

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-key"
  })
}

locals {
  master_user_data = templatefile("${path.module}/user_data/master.sh.tftpl", {
    ssh_public_key = var.ssh_public_key
  })

  worker_user_data = templatefile("${path.module}/user_data/worker.sh.tftpl", {
    ssh_public_key = var.ssh_public_key
  })
}

resource "aws_instance" "jenkins_master" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.master_instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.jenkins_master_sg.id]
  key_name               = aws_key_pair.main_key.key_name

  associate_public_ip_address = true
  user_data                   = local.master_user_data
  user_data_replace_on_change = true

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-jenkins-master"
    Role = "jenkins-master"
  })
}

resource "aws_instance" "jenkins_worker" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.worker_instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.jenkins_worker_sg.id]
  key_name               = aws_key_pair.main_key.key_name

  user_data                   = local.worker_user_data
  user_data_replace_on_change = true

  instance_market_options {
    market_type = "spot"

    spot_options {
      instance_interruption_behavior = "terminate"
      spot_instance_type             = "one-time"
    }
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-jenkins-worker"
    Role = "jenkins-worker"
  })
}