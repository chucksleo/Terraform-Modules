module "asg" {
  source = "./modules/asg"

  name          = var.name
  image_id      = var.image_id
  instance_type = var.instance_type
  # availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  desired_capacity       = var.desired_capacity
  max_size               = var.max_size
  min_size               = var.min_size
  vpc_zone_identifier    = var.vpc_zone_identifier
  create_launch_template = var.create_launch_template
  # launch_template_name   = saicds
  # launch_template_id     = aws_launch_template.saicds.id
  vpc_security_group_ids = var.vpc_security_group_ids
  # create_alb            = true
  # alb_security_group_ids = ["sg-0e5a5cafdf06a67d1", "sg-06096157a53e31bf8"]
  # alb_subnet_ids = ["subnet-0ff652dc584e4750a", "subnet-0fdf8d43455768e16", "subnet-0d8efafb761417234"]
  tags = var.tags
}
