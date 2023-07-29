data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_qldb_stream" "this" {
  count = var.create_stream ? 1 : 0

  stream_name          = var.stream_name
  exclusive_end_time   = var.exclusive_end_time
  inclusive_start_time = var.inclusive_start_time
  kinesis_configuration {
    aggregation_enabled = var.aggregation_enabled
    stream_arn          = var.kinesis_stream_arn
  }
  ledger_name = var.ledger_name
  role_arn    = var.create_stream_role == true && var.stream_role_arn == null ? aws_iam_role.stream[0].arn : var.stream_role_arn
  tags        = var.tags
}

# Create an IAM role per stream
data "aws_iam_policy_document" "assume_role_policy" {
  count = var.create_stream && var.create_stream_role ? 1 : 0

  statement {
    sid     = "QLDBStreamAssumeRole"
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["qldb.amazonaws.com"]
      type        = "Service"
    }

    condition {
      test     = "StringEquals"
      values   = [data.aws_caller_identity.current.account_id]
      variable = "aws:SourceAccount"
    }

    condition {
      test     = "ArnEquals"
      values   = ["arn:aws:qldb:${data.aws_region.current.name}:${data.aws_caller_identity.current.id}:stream/${var.ledger_name}/*"]
      variable = "aws:SourceArn"
    }
  }
}

data "aws_iam_policy_document" "stream" {
  count = var.create_stream && var.create_stream_role ? 1 : 0

  statement {
    sid = "QLDBStreamKinesisPermissions"
    actions = [
      "kinesis:PutRecord*",
      "kinesis:DescribeStream",
      "kinesis:ListShards"
    ]
    resources = [
      var.kinesis_stream_arn
    ]
  }

  dynamic "statement" {
    for_each = var.kinesis_stream_kms_key_arn != null ? [true] : []

    content {
      sid = "QLDBStreamKMSPermissions"
      actions = [
        "kms:GenerateDataKey"
      ]
      resources = [
        var.kinesis_stream_kms_key_arn
      ]
    }
  }
}

resource "aws_iam_policy" "stream" {
  count = var.create_stream && var.create_stream_role ? 1 : 0

  policy = data.aws_iam_policy_document.stream[0].json
  tags   = var.tags
}

resource "aws_iam_role" "stream" {
  count = var.create_stream && var.create_stream_role ? 1 : 0

  name                  = var.stream_role_name
  assume_role_policy    = data.aws_iam_policy_document.assume_role_policy[0].json
  force_detach_policies = true

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "stream" {
  count = var.create_stream && var.create_stream_role ? 1 : 0

  policy_arn = aws_iam_policy.stream[0].arn
  role       = aws_iam_role.stream[0].name
}
