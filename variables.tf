variable "create" {
  description = "Whether or not to create a QLDB ledger."
  type        = bool
  default     = true
}

variable "deletion_protection" {
  type        = bool
  description = "The deletion protection for the QLDB Ledger instance. By default it is `true`. To delete this via Terraform, this value must be configured to `false` and applied first before attempting deletion."
  default     = false
}

variable "kms_key" {
  type        = string
  description = "The AWS KMS key to use for encryption of data at rest in the ledger. Valid values are `AWS_OWNED_KMS_KEY` or the ARN of a valid symmetric customer managed KMS key."
  default     = null
}

variable "name" {
  type        = string
  description = "The friendly name for the QLDB Ledger instance."
  default     = null
}

variable "permissions_mode" {
  type        = string
  description = "The permissions mode for the QLDB ledger instance. Specify either `ALLOW_ALL` or `STANDARD`."
  default     = "STANDARD"
}

variable "tags" {
  type        = map(string)
  description = "Key-value map of resource tags."
  default     = {}
}

variable "streams" {
  type        = map(any)
  description = "A map of QLDB stream configurations."
  default     = {}
}
