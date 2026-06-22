variable "storage" {
  type = object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  })
}

variable "container" {
  type = object({
    name                  = string
    container_access_type = string
  })
}

