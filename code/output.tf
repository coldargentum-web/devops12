output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_instance_public_ip" {
  value = aws_instance.public.public_ip
}

output "public_instance_private_ip" {
  value = aws_instance.public.private_ip
}

output "private_instance_private_ip" {
  value = aws_instance.privat.private_ip
}