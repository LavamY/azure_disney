#
resource "azurerm_storage_account" "lavamsa" {
    name                        = var.storage_account_name
    resource_group_name         = var.resource_group_name
    location                    = var.location
    account_tier                = var.account_tier
    account_replication_type    = var.account_replication_type
}

resource "azurerm_storage_container" "lavamsc" {
    name                  = var.storage_container_name
    storage_account_name  = azurerm_storage_account.lavamsa.name
    container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "lavamb" {
    name                   = var.storage_blob_name
    storage_account_name   = azurerm_storage_account.lavamsa.name
    storage_container_name = azurerm_storage_container.lavamsc.name
    type                   = "Block"
}   

resource "azurerm_storage_queue" "lavamq" {
    name                 = var.storage_queue_name
    storage_account_name = azurerm_storage_account.lavamsa.name
}

resource "azurerm_storage_share" "lavamss" {
    name                 = var.storage_share_name
    storage_account_name = azurerm_storage_account.lavamsa.name 
}

resource "azurerm_storage_table" "lavamst" {
    name                 = var.storage_table_name
    storage_account_name = azurerm_storage_account.lavamsa.name
}