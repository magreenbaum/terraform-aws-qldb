provider "aws" {
  region = "us-east-1"
}

locals {
  name = "complete-example"

  tags = {
    name = "ledger-complete-example"
  }
}

################################################################################
# QLDB Ledger
################################################################################

module "ledger" {
  source = "../../"

  deletion_protection = false
  kms_key             = aws_kms_key.this.arn
  name                = local.name
}

module "ledger_and_stream" {
  source = "../../"

  deletion_protection = false
  kms_key             = "AWS_OWNED_KMS_KEY"
  name                = "${local.name}-with-stream"

  streams = {
    complete-example-stream = {
      kinesis_stream_arn         = aws_kinesis_stream.this.arn
      kinesis_stream_kms_key_arn = aws_kms_key.this.arn
      inclusive_start_time       = "2023-07-28T21:36:34Z"
    }
    another-examle = {
      kinesis_stream_arn         = aws_kinesis_stream.this.arn
      kinesis_stream_kms_key_arn = aws_kms_key.this.arn
      inclusive_start_time       = "2023-07-28T21:36:34Z"
    }
  }
}

################################################################################
# Supporting Resources
################################################################################

resource "aws_kms_key" "this" {
  deletion_window_in_days = 7
  enable_key_rotation     = true
  tags                    = local.tags
}

resource "aws_kinesis_stream" "this" {
  name            = local.name
  encryption_type = "KMS"
  kms_key_id      = aws_kms_key.this.id

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }
}
