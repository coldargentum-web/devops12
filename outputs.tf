output "instance_public_ip" {
  description = "Public IP of the created EC2 instance."
  value       = module.nginx_server.instance_public_ip
}