variable "vnet_config" {
  type = object({
    name          = string
    location      = string
    address_space = list(string)
  })
}

variable "rg_det" {
  type = object({
    name     = string
    location = string
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

variable "linux_vm" {
  type = object({
    name = string
  })
}