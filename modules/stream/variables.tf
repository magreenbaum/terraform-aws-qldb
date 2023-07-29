variable "create_stream" {
  type    = bool
  default = true
}

variable "stream_name" {
  type = string
}

variable "exclusive_end_time" {
  type    = string
  default = null
}

variable "inclusive_start_time" {
  type = string
}

variable "aggregation_enabled" {
  type    = bool
  default = true
}

variable "kinesis_stream_arn" {
  type = string
}

variable "ledger_name" {
  type = string
}

variable "stream_role_arn" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "create_stream_role" {
  type    = bool
  default = true
}

variable "stream_role_name" {
  type    = string
  default = null
}

variable "kinesis_stream_kms_key_arn" {
  type    = string
  default = null
}
