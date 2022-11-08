# security group to define access from load balancer to app servers
resource "aws_security_group" "sgp_app" {
  name        = "sgp-${local.env_short}-app-${var.app_name}"
  description = "Security group for APP"
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    Name = "sgp-${local.env_short}-app-${var.app_name}"
  }
}

resource "aws_security_group_rule" "sgr_app_ext_ingress" {
  count                    = length(local.ports-ingress-app)
  type                     = "ingress"
  from_port                = element(local.ports-ingress-app, count.index)
  to_port                  = element(local.ports-ingress-app, count.index)
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sgp_app.id
  cidr_blocks              = values(data.aws_subnet.aws_private_subnet).*.cidr_block
  description              = "connections from end users"
}
