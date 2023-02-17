resource "aws_lb" "nlb_app" {
  name               = format("nlb-%s-lb01-app-%s", var.env_short, var.app_name)
  internal           = true
  load_balancer_type = "network"
  subnets            = var.lb_subnet_ids
}

resource "aws_lb_listener" "nlb_l_app" {
  for_each          = var.protocol
  load_balancer_arn = aws_lb.nlb_app.arn
  port              = each.value
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_app[each.key].arn
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "tg_app" {
  for_each    = var.protocol
  name        = format("nlb-%s-lb01-app-%s-%s", var.env_short, var.app_name, each.key)
  port        = each.value
  protocol    = "TCP"
  vpc_id      = var.vpc_id
}

resource "aws_autoscaling_attachment" "asg_attachment_app" {
  for_each               = var.protocol
  autoscaling_group_name = var.asg_name
  lb_target_group_arn    = aws_lb_target_group.tg_app[each.key].arn
}