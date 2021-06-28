resource "aws_lb" "main" {
  name               = "${var.app_name}-${var.environment}"
  internal           = false
  load_balancer_type = "network"
  # security_groups    = [var.alb_security_groups]
  subnets            = var.subnet_ids
  enable_deletion_protection = false
}
 
resource "aws_lb_target_group" "main" {
  name        = "${var.app_name}-${var.environment}"
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "instance"
 
  # health_check {
  #  healthy_threshold   = "3"
  #  interval            = "30"
  #  protocol            = "HTTP"
  #  matcher             = "200"
  #  timeout             = "3"
  #  path                = "/" #var.health_check_path
  #  unhealthy_threshold = "2"
  # }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.id
  port              = 80
  protocol          = "TCP"
 
  default_action {
    target_group_arn = aws_lb_target_group.main.id
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "web_instance" {
  target_group_arn = aws_lb_target_group.main.id
  target_id        = var.instance_id
}