rg_config = {
  name        = "project-cicd"
  location    = "eastus"
  environment = "dev"
}

keyvault_config = {
  name     = "cicd-kv"
  location = "eastus"
}

vm_config = {
  name     = "linux-vm-01"
  location = "eastus"
}

vnet_config = {
  name          = "vnet-devops"
  location      = "eastus"
  address_space = ["10.0.0.0/16"]
}

subnet_config = {
  name             = "subnet1"
  address_prefixes = ["10.0.1.0/24"]
}

nsg_config = {
  name = "nsg1"
}

interface_config = {
  name = "nic1"
}

rg_det = {
  name     = "project-cicd-dev-rg"
  location = "eastus"
}

storage_config = {
  name                     = "rajatstorage4021"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

container_config = {
  name                  = "container1"
  container_access_type = "private"
}

