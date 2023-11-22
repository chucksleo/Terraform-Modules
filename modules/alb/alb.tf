 resource "aws_lb" "saicds-elb" {
  name               = "saicds-elb"
  internal           = false
  load_balancer_type = "application"
  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true
  idle_timeout = 60
  enable_http2 = true
  subnets = var.public_subnets
 }

 resource "aws_lb_listener" "alb_listener" {
   load_balancer_arn = aws_lb.saicds-elb.arn
   port = var.listener_port
   protocol = "HTTP"

   default_action {
     type = "forward"
     target_group_arn = var.target_group_arn
   }
 }
