# autoscaling_module.tf

variable "name" {
  description = "Name of the Auto Scaling Group"
}

# variable "launch_template_version" {
#   description = "Version of the launch template to use for the Auto Scaling Group"
#   default     = "$Latest"
# }

variable "image_id" {
  description = "The AMI from which to launch the instance	"
  type = string  
}

variable "instance_type" {
  description = "EC2 instance type for the Auto Scaling Group"
  default     = "t2.micro"
}

# variable "availability_zones" {
#   description = "A list of one or more availability zones for the group."
#   type = list(string)
# }

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  default     = 2
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  default     = 3
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  default     = 1
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in."
  type = list(string)
}

variable "create_launch_template" {
  description = "Create a launch template"
  default     = true
}

# variable "launch_template_id" {
#   description = "ID of the launch template to use for the Auto Scaling Group"
# }

# variable "launch_template_name" {
#   description = "Name of launch template to be created"
#   type = string
# }

variable "vpc_security_group_ids" {
  description = "List of security group IDs for the ALB"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type = map(string)
}

# variable "create_alb" {
#   description = "Create an Application Load Balancer (ALB)"
#   default     = false
# }



# variable "alb_subnet_ids" {
#   description = "List of subnet IDs for the ALB"
#   type        = list(string)
# }