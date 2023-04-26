variable "rg_name" {
  default     = "keyvaultpoc-venu"
  type        = string
  description = "This is about resourec group name"
}

variable "location" {
  default     = "eastus2"
  type        = string
  description = "This is about resource group location"
}

variable "key-vault_name" {
  default     = "newkeyvapoc"
  type        = string
  description = "This is about key vault name"
}

variable "key_vault_secret1_name" {
  default     = "psusername"
  type        = string
  description = "This is about key vault secret name"
}

variable "key_vault_secret2_name" {
  default     = "pslogipassword"
  type        = string
  description = "This is about key vault secret name"
}

variable "pdbServer_name" {
  default = "testpdbserver"
  type    = string
}

variable "sku_name" {
  default = "GP_Gen5_2"
  type    = string
}

variable "storage_mb" {
  default = 5120
  type    = number
}

variable "backup_retention_days" {
  default = 7
  type    = number
}

variable "geo_redundant_backup_enabled" {
  default = false
  type    = bool
}

variable "auto_grow_enabled" {
  default = true
  type    = bool
}

variable "postgresql_version" {
  default = "9.5"
  type    = string
}

variable "ssl_enforcement_enabled" {
  default = true
  type    = bool
}

variable "database_name" {
  default = "testddatabase"
  type    = string
}

variable "charset" {
  default = "UTF8"
  type    = string
}

variable "collation" {
  default = "en-US"
  type    = string
}