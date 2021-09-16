variable resource_group_name {
    description = "Resource Group Name for the virtual net"
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = ""
}

variable "subnet_name" {
  description = "Name of the vnet to create"
  default     = ""
}

variable "address_prefixes" {
  description = "The address space that is used by the sub-network."
  default     = ""
}