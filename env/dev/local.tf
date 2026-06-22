locals {
  prefix = "${var.rg_config.name}-${var.rg_config.environment}"
  name   = "${local.prefix}-rg"
}

locals {
  vault_name = "${var.keyvault_config.name}-vault"
}