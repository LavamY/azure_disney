resource "azurerm_network_security_group" "lavamsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "lavamvnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["${var.address_space}"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.134.20.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.134.30.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.134.40.0/24"
    security_group = azurerm_network_security_group.lavamsg.id
  }

  subnet {
    name           = "subnet4"
    address_prefix = "10.134.50.0/24"
    security_group = azurerm_network_security_group.lavamsg.id
  }

  
}