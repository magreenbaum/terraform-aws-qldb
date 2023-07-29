# terraform-aws-qldb

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_qldb_stream"></a> [qldb\_stream](#module\_qldb\_stream) | ./modules/stream | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_qldb_ledger.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/qldb_ledger) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether or not to create a QLDB ledger. | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | The deletion protection for the QLDB Ledger instance. By default it is `true`. To delete this via Terraform, this value must be configured to `false` and applied first before attempting deletion. | `bool` | `false` | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | The AWS KMS key to use for encryption of data at rest in the ledger. Valid values are `AWS_OWNED_KMS_KEY` or the ARN of a valid symmetric customer managed KMS key. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The friendly name for the QLDB Ledger instance. | `string` | `null` | no |
| <a name="input_permissions_mode"></a> [permissions\_mode](#input\_permissions\_mode) | The permissions mode for the QLDB ledger instance. Specify either `ALLOW_ALL` or `STANDARD`. | `string` | `"STANDARD"` | no |
| <a name="input_streams"></a> [streams](#input\_streams) | A map of QLDB stream configurations. | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ledger_arn"></a> [ledger\_arn](#output\_ledger\_arn) | n/a |
| <a name="output_ledger_id"></a> [ledger\_id](#output\_ledger\_id) | n/a |
| <a name="output_ledger_streams"></a> [ledger\_streams](#output\_ledger\_streams) | n/a |
| <a name="output_ledger_tags_all"></a> [ledger\_tags\_all](#output\_ledger\_tags\_all) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
