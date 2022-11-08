module "nlb_app" {
  count  = local.cluster_resources ? 1 : 0
  source = "git@github.com:jjbos/modularization-nlb.git?ref=v1.0.0"

  env_short           = local.env_short
  app_name            = var.app_name
  lb_subnet_ids       = data.aws_subnets.aws_private_subnets.ids
  protocol            = local.protocol_map
  vpc_id              = data.aws_vpc.vpc.id
  asg_name            = module.asg_app.autoscaling_group_name

}