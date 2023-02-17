# Project Modularization in Terraform - part 3: converting non-mod projects
The code in this project is part of an example as described in https://stories.schubergphilis.com/project-modularization-in-terraform-part-3-converting-non-mod-projects-d2c318fbb0b5

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.asg_attachment_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_lb.nlb_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.nlb_l_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.tg_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Set the application name i.e. green or blue | `string` | n/a | yes |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | Set ASG name | `string` | `null` | no |
| <a name="input_env_short"></a> [env\_short](#input\_env\_short) | Set the short environment name, i.e. dev, test, acc, prod | `string` | n/a | yes |
| <a name="input_lb_subnet_ids"></a> [lb\_subnet\_ids](#input\_lb\_subnet\_ids) | The list of subnet IDs where the lb will live | `list(any)` | `null` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | list of names and ports to be listening on | `map(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Define VPC ID | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->