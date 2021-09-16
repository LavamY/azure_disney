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

variable "storage_container_name" {
  type        = string
  description = "Name of Storage Container"
}

variable "storage_blob_name" {
  type        = string
  description = "Name of Storage Blob"
}

variable "container_access_type" {
  type        = string
  description = "Name of access type"
}

variable "storage_queue_name" {
  type        = string
  description = "Name of storage queue"
}

variable "storage_share_name" {
  type        = string
  description = "Name of storage share"
}

variable "storage_table_name" {
  type        = string
  description = "Name of storage table"
}


