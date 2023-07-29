# Complete AWS KMS Example

Configuration in this directory creates:

- Complete KMS key example with key policy, aliases, and grants
- External KMS key example
- Default KMS key example with default policy
- Disable KMS key example

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.10.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ledger"></a> [ledger](#module\_ledger) | ../../ | n/a |
| <a name="module_ledger_and_stream"></a> [ledger\_and\_stream](#module\_ledger\_and\_stream) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kinesis_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Apache-2.0 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-kms/blob/master/LICENSE).
