# ===================== create layer 7 application load balancer ========================
resource "aws_lb" "my_noob_terraws_alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id[0]]
  subnets            = var.subnets
}

# ===================== create target group ========================
resource "aws_lb_target_group" "my_noob_terraws_alb_tg" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

  health_check {
    path = var.health_check_path
    port = var.health_check_port
  }
}

# ===================== attach ec2's for the target groups ========================
resource "aws_lb_target_group_attachment" "my_noob_terraws_alb_tg_attach" {
  count             = length(var.ec2_instance_ids)  # Use count to attach all instances
  target_group_arn  = aws_lb_target_group.my_noob_terraws_alb_tg.arn
  target_id         = var.ec2_instance_ids[count.index]  # Access the instance ID using count.index
  port              = var.target_group_port
}


# ===================== enable listening ========================
resource "aws_lb_listener" "my_noob_terraws_alb_listener" {
  load_balancer_arn = aws_lb.my_noob_terraws_alb.id
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    target_group_arn = aws_lb_target_group.my_noob_terraws_alb_tg.arn
    type             = "forward"
  }
}
