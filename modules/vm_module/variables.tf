variable "size" {
  type      = string
  default   = "Standard_B1ls"
}


variable "vm_name" {
  type        = string
  description = "Name of Virtual Machine"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
}

variable "location" {
  type        = string
  description = "Enter location"
}

variable "admin_username" {
  type        = string
  description = "Enter admin username"
}

variable "network_interface_ids" {
  description = "Enter Network Interface ID"
  default = ""
}

variable "nic_name" {
  type        = string
  description = "Name of nic"
}

variable "subnet_id" {
  type        = string
  description = "Enter subnet-id"
}