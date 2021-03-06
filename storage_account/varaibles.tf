#
variable "storage_account_name" {
  type        = string
  description = "Name of Storage Account"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
}

variable "location" {
  type        = string
  description = "Enter location"
}

variable "account_tier" {
  type        = string
  description = "Enter storage account tier"
}

variable "account_replication_type" {
  type        = string
  description = "Enter storage account replication type"
}
