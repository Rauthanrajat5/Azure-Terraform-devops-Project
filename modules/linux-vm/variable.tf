variable "lin_vm" {
  type = object({
    name                 = string
    location             = string
    resource_group_name  = string
    network_interface_id = string
    admin_username       = string
    admin_password       = string
  })
}