resource "azurerm_storage_account" "stdetails" {
  name                     = var.storage.name
  resource_group_name      = var.storage.resource_group_name
  location                 = var.storage.location
  account_tier             = var.storage.account_tier
  account_replication_type = var.storage.account_replication_type
  account_kind             = "StorageV2"
}

resource "azurerm_storage_container" "containerdetails" {
  name                  = var.container.name
  storage_account_name  = azurerm_storage_account.stdetails.name
  container_access_type = var.container.container_access_type
}
