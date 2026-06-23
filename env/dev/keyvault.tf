resource "azurerm_key_vault" "keyvaultdetails" {
  name                        = local.vault_name
  location                    = var.rg_config.location
  resource_group_name         = local.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

data "azurerm_client_config" "current" {}

resource "random_password" "randompass" {
  length  = 20
  special = true

}

resource "azurerm_key_vault_secret" "username" {
  name         = "linux-admin-username"
  value        = "azureaddmin"
  key_vault_id = azurerm_key_vault.keyvaultdetails.id
}

resource "azurerm_key_vault_secret" "password" {
  name         = "linux-admin-password"
  value        = random_password.randompass.result
  key_vault_id = azurerm_key_vault.keyvaultdetails.id
}
