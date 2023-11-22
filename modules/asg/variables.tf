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

variable "launch_template_name" {
  
}
variable "create_launch_template" {
  description = "Create a launch template"
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs for the ASG"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type = map(string)
}

variable "target_group_arn" {}

