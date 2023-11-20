resource "aws_launch_template" "saicds" {
  name = var.name
  # version = var.launch_template_version
  # count = var.create_launch_template ? 1 : 0
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
  # Other configuration options...
}

resource "aws_autoscaling_group" "saicds" {
  # availability_zones = var.availability_zones
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  launch_template {
    id      = aws_launch_template.saicds.id
    # name = aws_launch_template.saicds.name
    version = "$Latest"
  }
  vpc_zone_identifier = var.vpc_zone_identifier
  
  # tags = var.tags
  # tags {
  #   Environment = "dev"
  #   Project = "Dataiku"
  #   propagate_at_launch = true
  # }

  lifecycle {
    create_before_destroy = true
  }
}

# resource "aws_lb" "saicds" {
#   count = var.create_alb ? 1 : 0
#   name               = "saicds-lb"
#   internal           = false
#   load_balancer_type = "application"
#   subnets            = var.alb_subnet_ids
#   security_groups     = var.alb_security_group_ids

# }
