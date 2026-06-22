module "resourcegroup" {
  source = "../../modules/resourcegroup"
  resourcegroup = {
    name     = local.name
    location = var.rg_config.location
  }
}

#every value we have initilize in variable.tf we have to call them here.

module "networking" {
  source = "../../modules/networking"

  vnet_config      = var.vnet_config
  rg_det           = var.rg_det
  subnet_config    = var.subnet_config
  nsg_config       = var.nsg_config
  interface_config = var.interface_config
  linux_vm = {
    name = var.vm_config.name
  }
}

module "linux_vm" {
  source = "../../modules/linux-vm"

  lin_vm = {
    name                 = var.vm_config.name
    location             = var.vm_config.location
    resource_group_name  = local.name
    network_interface_id = module.networking.nic_id
    admin_username       = azurerm_key_vault_secret.username.value
    admin_password       = azurerm_key_vault_secret.password.value
  }
}

module "storage" {
  source = "../../modules/storage"

  storage = {
    name                     = var.storage_config.name
    resource_group_name      = local.name
    location                 = var.storage_config.location
    account_tier             = var.storage_config.account_tier
    account_replication_type = var.storage_config.account_replication_type
  }

  container = {
    name                  = var.container_config.name
    container_access_type = var.container_config.container_access_type
  }
}

