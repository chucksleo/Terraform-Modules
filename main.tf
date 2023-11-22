module "asg" {
  source = "./modules/asg"
  name                   = var.name
  image_id               = var.image_id
  instance_type          = var.instance_type
  desired_capacity       = var.desired_capacity
  max_size               = var.max_size
  min_size               = var.min_size
  vpc_zone_identifier    = var.vpc_zone_identifier
  launch_template_name = "saicds-asg-template"
  create_launch_template = var.create_launch_template
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = var.tags
  target_group_arn = var.target_group_arn
  # target_group_arn = module.alb.aws_lb_listener.alb_listener.target_group_arn
}

module "alb" {
  source          = "./modules/alb"
  vpc_id          = var.vpc_id
  public_subnets = var.public_subnets
  security_group = var.security_group
  target_group_arn = var.target_group_arn
  listener_port = var.listener_port
}

# module "lambda_function" {
#   source            = ".."
#   function_name     = "my-lambda-function"
#   runtime           = "nodejs14.x"
#   handler           = "index.handler"
#   filename           = "path/to/lambda.zip"
#   role_name         = "my-lambda-role"
#   environment_vars  = { key = "value" }
#   event_bucket_name = "my-s3-bucket"
# }