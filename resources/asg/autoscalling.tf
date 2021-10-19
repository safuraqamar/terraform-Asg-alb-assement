resource "aws_launch_configuration" "asg_launch_config" {
  name = var.name
  image_id = var.ami
  instance_type = var.type
  iam_instance_profile = var.iam_instance_profile
  key_name = var.keypair
  security_groups = var.security_groups
  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  EOF
  lifecycle {
    create_before_destroy = true
  }
    ebs_optimized                 = "false"
  root_block_device {
    volume_type                 = "standard"
    volume_size                 = 20
  }
}

resource "aws_autoscaling_group" "main_asg" {
  depends_on = ["aws_launch_configuration.asg_launch_config"]
  name = var.name
  vpc_zone_identifier = var.vpc_zone_subnets
  launch_configuration = aws_launch_configuration.asg_launch_config.id
  max_size = var.asg_max_number_of_instances
  min_size = var.asg_minimum_number_of_instances
  desired_capacity = var.asg_number_of_instances
  health_check_grace_period = var.health_check_grace_period
  target_group_arns         = var.target_groups
}

