# stream

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_qldb_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/qldb_stream) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aggregation_enabled"></a> [aggregation\_enabled](#input\_aggregation\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_create_stream"></a> [create\_stream](#input\_create\_stream) | n/a | `bool` | `true` | no |
| <a name="input_create_stream_role"></a> [create\_stream\_role](#input\_create\_stream\_role) | n/a | `bool` | `true` | no |
| <a name="input_exclusive_end_time"></a> [exclusive\_end\_time](#input\_exclusive\_end\_time) | n/a | `string` | `null` | no |
| <a name="input_inclusive_start_time"></a> [inclusive\_start\_time](#input\_inclusive\_start\_time) | n/a | `string` | n/a | yes |
| <a name="input_kinesis_stream_arn"></a> [kinesis\_stream\_arn](#input\_kinesis\_stream\_arn) | n/a | `string` | n/a | yes |
| <a name="input_kinesis_stream_kms_key_arn"></a> [kinesis\_stream\_kms\_key\_arn](#input\_kinesis\_stream\_kms\_key\_arn) | n/a | `string` | `null` | no |
| <a name="input_ledger_name"></a> [ledger\_name](#input\_ledger\_name) | n/a | `string` | n/a | yes |
| <a name="input_stream_name"></a> [stream\_name](#input\_stream\_name) | n/a | `string` | n/a | yes |
| <a name="input_stream_role_arn"></a> [stream\_role\_arn](#input\_stream\_role\_arn) | n/a | `string` | `null` | no |
| <a name="input_stream_role_name"></a> [stream\_role\_name](#input\_stream\_role\_name) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
