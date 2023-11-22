variable "vpc_id" {
  type = string
}
variable "public_subnets" {
  type = list(string)
}
variable "security_group" {
  type = string
}
variable "target_group_arn" {}
variable "listener_port" {
  
}