variable "sa_account_tier" {
  type        = string
  description = "Tier of the storage account"
}

variable "sa_account_replication_type" {
  type        = string
  description = "Replication type of the storage account"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resources"
}