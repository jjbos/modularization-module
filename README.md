# Project Modularization in Terraform - part 2: managing exceptions
The code in this project is part of an example as described in https://stories.schubergphilis.com/project-modularization-in-terraform-part-2-managing-exceptions-cecb4ecd7b81

# update
Once you have updated this repository create a new release. You can then refer to the new version from the application project.

To update the part below automatically, use Terraform Docs: https://github.com/terraform-docs/terraform-docs

To update the documentation:
```
terraform-docs markdown table --output-file path-to-project\README.md --output-mode inject path-to-project
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_asg_app"></a> [asg\_app](#module\_asg\_app) | git::https://github.com/terraform-aws-modules/terraform-aws-autoscaling.git | v6.5.3 |
| <a name="module_nlb_app"></a> [nlb\_app](#module\_nlb\_app) | git@github.com:jjbos/modularization-nlb.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.sgp_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.sgr_app_ext_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ami.al2_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet.aws_private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.aws_private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.aws_public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Set the application name | `string` | n/a | yes |
| <a name="input_asg_app_desired_cappacity"></a> [asg\_app\_desired\_cappacity](#input\_asg\_app\_desired\_cappacity) | Set the desired number of app instances to create in autoscaling group | `number` | `1` | no |
| <a name="input_asg_app_max_size"></a> [asg\_app\_max\_size](#input\_asg\_app\_max\_size) | Set the maximum number of app instances to create in autoscaling group | `number` | `1` | no |
| <a name="input_asg_app_min_size"></a> [asg\_app\_min\_size](#input\_asg\_app\_min\_size) | Set the minimum number of app instances to create in autoscaling group | `number` | `1` | no |
| <a name="input_count_app_instances"></a> [count\_app\_instances](#input\_count\_app\_instances) | Set the number of app instances to create | `number` | `1` | no |
| <a name="input_ec2_type_app"></a> [ec2\_type\_app](#input\_ec2\_type\_app) | Define the instance type to use | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Define which environment to use | `string` | n/a | yes |
| <a name="input_external_ip"></a> [external\_ip](#input\_external\_ip) | Set your external IP, use default 0.0.0.0/0 for access from everywhere | `string` | `"0.0.0.0/0"` | no |
| <a name="input_override_cluster_resources"></a> [override\_cluster\_resources](#input\_override\_cluster\_resources) | Defines if cluster resources should be created | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->