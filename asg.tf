module "asg_app" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-autoscaling.git?ref=v6.5.3"

  # Autoscaling group
  name                      = format("asg-%s-app-%s", local.env_short, var.app_name)
  min_size                  = var.asg_app_min_size
  max_size                  = var.asg_app_max_size
  desired_capacity          = var.asg_app_desired_cappacity
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  health_check_grace_period = 60
  vpc_zone_identifier       = data.aws_subnets.aws_private_subnets.ids

  # Launch template
  update_default_version = true
  image_id               = data.aws_ami.al2_ami.image_id
  instance_type          = var.ec2_type_app
  ebs_optimized          = true
  enable_monitoring      = true

  block_device_mappings = [
    {
      device_name = "/dev/xvda"
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 25
        volume_type           = "gp3"
      }
    }
  ]

  network_interfaces = [
    {
      security_groups = [aws_security_group.sgp_app.id]
    }
  ]
}
