resource "azurerm_key_vault" "keyvaultdetails" {
  depends_on = [ module.resourcegroup ]
  name                        = local.vault_name
  location                    = var.rg_config.location
  resource_group_name         = local.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
  }

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "terraform_policy" {

  key_vault_id = azurerm_key_vault.keyvaultdetails.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Purge"
  ]
}

resource "random_password" "randompass" {
  length  = 20
  special = true

}

resource "azurerm_key_vault_secret" "username" {
  name         = "linux-admin-username"
  value        = "azureadmin"
  key_vault_id = azurerm_key_vault.keyvaultdetails.id
  depends_on = [azurerm_key_vault_access_policy.terraform_policy]
}

resource "azurerm_key_vault_secret" "password" {
  name         = "linux-admin-password"
  value        = random_password.randompass.result
  key_vault_id = azurerm_key_vault.keyvaultdetails.id
  depends_on = [azurerm_key_vault_access_policy.terraform_policy]
}
