resource "aws_launch_template" "saicds" {
  name = var.name
  # launch_template_name = var.launch_template_name
  image_id = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  monitoring {
    enabled = true
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 10
      volume_type = "gp2"
    }
  }

  tags = {
    Environment = "dev"
    Project = "Dataiku"
  }
  # Other configuration options...
}

resource "aws_autoscaling_group" "saicds" {
  name = var.name
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  health_check_grace_period = 300
  health_check_type = "ELB"
  launch_template {
    # id      = aws_launch_template.saicds.id
    name = aws_launch_template.saicds.name
    version = "$Latest"
  }
  vpc_zone_identifier = var.vpc_zone_identifier
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.saicds.name
  lb_target_group_arn = var.target_group_arn
}
