terraform {
  source = "/home/azure-disney/modules"
}
remote_state {
    backend = "azurerm"
    generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
    }
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "lavamrsg"
        storage_account_name = "lavamsa"
        container_name = "lavamtfstate"
        key = "lavam.terraform.tfstate"
    }
}

inputs = {
location                    = "East US"
resource_group_name         = "lavamrsg"
storage_account_name        = "azuredisneyexample"
nsg_name                    = "lavamnsg"
vnet_name                   = "lavamvnet"
address_space               = "10.134.0.0/16"
subnet_name                 = "lavam-subnet"
address_prefixes            = "10.134.20.0/24"
account_tier                = "Standard"
account_replication_type    = "LRS"
storage_container_name      = "lavamsc"
container_access_type       = "private"
storage_blob_name           = "lavamsb"
storage_queue_name          = "lavamsq"
storage_share_name          = "lavamss"
storage_table_name          = "lavamst"
size                        = "Standard_B1ls"
admin_username              = "adminuser"

}