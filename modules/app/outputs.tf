output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "frontend_public_ip" {
  value = aws_instance.frontend.public_ip
}

output "backend_sg_id" {
  value = aws_security_group.backend_sg.id
}
