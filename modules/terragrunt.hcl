terraform {
  source = "/home/azure-disney1/TerragruntSpike/stage/network_module/"
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
location = "East US"
resource_group_name = "lavamrsg"
nsg_name = "lavamsg"
vnet_name = "lavamvnet"
address_space = "10.134.0.0/16"

}