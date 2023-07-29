resource "aws_qldb_ledger" "this" {
  count = var.create ? 1 : 0

  deletion_protection = var.deletion_protection
  kms_key             = var.kms_key
  name                = var.name
  permissions_mode    = var.permissions_mode
  tags                = var.tags
}

module "qldb_stream" {
  source = "./modules/stream"

  for_each = { for k, v in var.streams : k => v if var.create }

  stream_name                = each.key
  exclusive_end_time         = try(each.value.exclusive_end_time, null)
  inclusive_start_time       = each.value.inclusive_start_time
  aggregation_enabled        = try(each.value.kinesis_aggregation_enabled, true)
  kinesis_stream_arn         = each.value.kinesis_stream_arn
  kinesis_stream_kms_key_arn = try(each.value.kinesis_stream_kms_key_arn, null)
  ledger_name                = aws_qldb_ledger.this[0].name
  stream_role_arn            = try(each.value.stream_role_arn, null)
  stream_role_name           = try(each.value.stream_role_name, "${each.key}-role")
  tags                       = var.tags
}
