output "subnet_id" {
  description = "The ids of subnets created inside the new vNet"
  value       = "${azurerm_subnet.internal.id}"
}