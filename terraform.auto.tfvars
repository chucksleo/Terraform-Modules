name                   = "saicds-asg"
image_id               = "ami-0230bd60aa48260c6"
instance_type          = "t2.micro"
desired_capacity       = 3
max_size               = 5
min_size               = 1
vpc_zone_identifier    = ["subnet-02442105592a9cb06", "subnet-058311f2a61606b30", "subnet-004528eb7200dd7b5"]
create_launch_template = true
vpc_security_group_ids = ["sg-0e5a5cafdf06a67d1", "sg-06096157a53e31bf8"]
tags = {
  Environment = "dev"
  Project     = "Dataiku"
  # propagate_at_launch = true
}
vpc_id = "vpc-02fdc3e51f053b3d2"
public_subnets = ["subnet-0ff652dc584e4750a", "subnet-0fdf8d43455768e16", "subnet-0d8efafb761417234" ]
security_group = "sg-0e5a5cafdf06a67d1"
target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:246308127864:targetgroup/demo-tg-alb/d9987ba52a962f44"
listener_port = 80