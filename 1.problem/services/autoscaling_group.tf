resource "aws_launch_template" "template" {
  name                                 = var.template_name
  ebs_optimized                        = true
  image_id                             = data.aws_ami.amazon_linux.id
  instance_initiated_shutdown_behavior = var.shutdown_behaviour
  instance_type                        = var.instance_type
  key_name                             = var.key_name
  user_data                            = "${filebase64("services/user_data.sh")}"
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }
  
  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = aws_subnet.private.id
    security_groups            = [aws_security_group.durianpay_asg_sg.id]
    delete_on_termination       = true
  }
   tag_specifications {   
   resource_type = "instance"
   tags = merge(local.common_tags, {
   Name = "Durianpay-EC2"
  })
 }
}

resource "aws_autoscaling_group" "durianpay_ASG" {
  name                      = var.asg_name
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_period
  
  launch_template {
    id  = aws_launch_template.template.id
  }
  min_size = var.min_size
  max_size = var.max_size
 
}

resource "aws_autoscaling_policy" "durianpay_target_tracking_policy" {
name = "durianpay-asg-target-tracking-policy"
policy_type = "TargetTrackingScaling"
autoscaling_group_name = "${aws_autoscaling_group.durianpay_ASG.name}"
estimated_instance_warmup = var.health_period

target_tracking_configuration {
predefined_metric_specification {
predefined_metric_type = "ASGAverageCPUUtilization"
}

    target_value = var.target_value
 }
}