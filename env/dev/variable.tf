variable "rg_config" {
  type = object({
    name        = string
    location    = string
    environment = string
  })
}

variable "keyvault_config" {
  type = object({
    name     = string
    location = string
  })
}

variable "vm_config" {
  type = object({
    name     = string
    location = string
  })
}

variable "vnet_config" {
  type = object({
    name          = string
    location      = string
    address_space = list(string)
  })
}

variable "subnet_config" {
  type = object({
    name             = string
    address_prefixes = list(string)
  })
}

variable "nsg_config" {
  type = object({
    name = string
  })
}

variable "interface_config" {
  type = object({
    name = string
  })
}

variable "rg_det" {
  type = object({
    name     = string
    location = string
  })
}

variable "storage_config" {
  type = object({
    name                     = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  })
}

variable "container_config" {
  type = object({
    name                  = string
    container_access_type = string
  })
}

