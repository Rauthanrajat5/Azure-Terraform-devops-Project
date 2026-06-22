resource "azurerm_resource_group" "rgdetails" {
  name = var.resourcegroup.name
  location = var.resourcegroup.location
}