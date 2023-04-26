data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

data "azurerm_key_vault" "kv" {
  name                = var.key-vault_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_key_vault_secret" "Secret1" {
  name         = var.key_vault_secret1_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "Secret2" {
  name         = var.key_vault_secret2_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_postgresql_server" "postgresqlServer" {
  name                = var.pdbServer_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  sku_name = var.sku_name

  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = var.auto_grow_enabled

  administrator_login          = data.azurerm_key_vault_secret.Secret1.value
  administrator_login_password = data.azurerm_key_vault_secret.Secret2.value
  version                      = var.postgresql_version
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled
}

resource "azurerm_postgresql_database" "database" {
  name                = var.database_name
  resource_group_name = data.azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.postgresqlServer.name
  charset             = var.charset
  collation           = var.collation
}