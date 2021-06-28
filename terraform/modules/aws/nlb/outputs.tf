# output "target_group_arn" {
#   value = aws_alb_target_group.main.id
# }

output "alb_arn" {
  value = aws_lb.main.id
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

