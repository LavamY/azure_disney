#
module "storage_account" {
    source = "./modules/storage_account"
    storage_account_name        = "azuredisneyexample"
    resource_group_name         = "lavamrsg"
    location                    = "East US"
    account_tier                = "Standard"
    account_replication_type    = "LRS"
    storage_container_name      = "lavamsc"
    container_access_type       = "private"
    storage_blob_name           = "lavamsb"
    storage_queue_name          = "lavamsq"
    storage_share_name          = "lavamss"
    storage_table_name          = "lavamst"
    
}

# module "nsg" {
#   source              = "./modules/network_security_group"
#   nsg_name                = "lavam-nsg"
#   location            = "East US"
#   resource_group_name = "${module.resource_group.resource_group_name}"
# }

# module "vnet" {
#   source              = "./modules/vnet"
#   resource_group_name = "example1"
#   location            = "East US"
#   vnet_name           = "lavam-vnet"
#   address_space       = "10.134.0.0/16"
# }

# module "subnet" {
#   source              = "./modules/subnet"
#   subnet_name         = "lavamsubnet"
#   resource_group_name = "example1"
#   vnet_name           = "${module.vnet.vnet_name}"
#   prefixes            = ["10.134.20.0/24"]
#   network_security_group_name           = "${module.nsg.nsg_name}"

# }

# module "network_module" {
#    source              = "./modules/network_module"
#    resource_group_name = "example1"
#    location            = "East US"
#    nsg_name            = "lavam-nsg"
#    vnet_name           = "lavam-vnet"
#    address_space       = "10.134.0.0/16"
#  }

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "lavamrsg1"
  location            = "East US"
}

module "modified_vnet_module" {
   source              = "./modules/modified_vnet_module"
   resource_group_name = "${module.resource_group.resource_group_name}"
   location            = "East US"
   vnet_name           = "lavam-vnet"
   address_space       = "10.134.0.0/16"
 }

 module "modified_subnet_module" {
   source              = "./modules/modified_subnet_module"
   resource_group_name = "${module.resource_group.resource_group_name}"
   subnet_name         = "lavam-subnet"
   vnet_name           = "${module.modified_vnet_module.vnet_name}"
   address_prefixes    = "10.134.20.0/24"
 }

# #  module "ni_module"{
# #   source              = "./modules/ni_module"
# #   count               = 4
# #   nic_name            = "lavam_nic${count.index}"
# #   location            = "East US"
# #   resource_group_name = "${module.resource_group.resource_group_name}"
# #   subnet_id           = "${module.modified_subnet_module.subnet_id}"
# # }
 

 module "vm_module"{
   source                = "./modules/vm_module"
   count                 = 4
   nic_name              = "lavam_nic${count.index+1}"
   subnet_id             = "${module.modified_subnet_module.subnet_id}"
   vm_name               = "lavam${count.index+1}"
   resource_group_name   = "${module.resource_group.resource_group_name}"
   location              = "East US"
   size                  = "Standard_B1ls"
   admin_username        = "adminuser"

 }
