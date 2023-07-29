output "ledger_id" {
  value = try(aws_qldb_ledger.this[0].id, null)
}

output "ledger_arn" {
  value = try(aws_qldb_ledger.this[0].arn, null)
}

output "ledger_tags_all" {
  value = try(aws_qldb_ledger.this[0].tags_all, null)
}

output "ledger_streams" {
  value = module.qldb_stream
}
