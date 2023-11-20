output "autoscaling_group_arn" {
    value = aws_autoscaling_group.saicds.arn
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.saicds.name
}