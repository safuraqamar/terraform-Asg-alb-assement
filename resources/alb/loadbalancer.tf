resource "aws_lb" "appln-lb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group
  subnets            = var.subnets
  enable_deletion_protection = false
  tags = var.tags
}

resource "aws_lb_target_group" "tg-cf" {
  name     = var.name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "listner-cf" {
  load_balancer_arn = aws_lb.appln-lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-cf.arn
  }
}
resource "aws_lb_listener_rule" "health_check" {
  listener_arn = aws_lb_listener.listner-cf.arn

  action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "HEALTHY"
      status_code  = "200"
    }
  }

  condition {
    query_string {
      key   = "health"
      value = "check"
    }

    query_string {
      value = "bar"
    }
  }
}