data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-${var.environment}"]
  }
}

# ami id's
data "aws_ami" "al2_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

## List of private subnet ID's
data "aws_subnets" "aws_private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["subnet-${var.environment}-private*"]
  }
}

## List of public subnet ID's
data "aws_subnets" "aws_public_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["subnet-${var.environment}-public*"]
  }
}

# get more info about each private subnet
data "aws_subnet" "aws_private_subnet" {
  for_each = "${toset(data.aws_subnets.aws_private_subnets.ids)}"
  id       = "${each.value}"
}