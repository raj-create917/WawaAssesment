output "alb_id" {
  value = aws_security_group.alb.id
}

output "web_sg_id" {
  value = aws_security_group.web.id
}

