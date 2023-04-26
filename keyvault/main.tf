data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_key_vault" "kv" {
  name                       = var.key-vault_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days
}

resource "azurerm_key_vault_access_policy" "accessPolicy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  certificate_permissions = ["Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List",
  "ListIssuers", "ManageContacts", "ManageIssuers", "SetIssuers", "Update", ]

  key_permissions = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge",
  "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", ]

  secret_permissions = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set", ]
}

resource "azurerm_key_vault_secret" "Secret1" {
  name         = var.key_vault_secret1_name
  value        = var.key_vault_secret1_value
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "Secret2" {
  name         = var.key_vault_secret2_name
  value        = var.key_vault_secret2_value
  key_vault_id = azurerm_key_vault.kv.id
}