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

variable "sku_name" {
  default = "standard"
  type    = string
}

variable "soft_delete_retention_days" {
  default = 7
  type    = number
}

variable "key_vault_secret1_name" {
  default     = "psusername"
  type        = string
  description = "This is about key vault secret name"
}

variable "key_vault_secret1_value" {
  default     = "Admin123"
  type        = string
  description = "This is about key vault secret value"
}

variable "key_vault_secret2_name" {
  default     = "pslogipassword"
  type        = string
  description = "This is about key vault secret name"
}

variable "key_vault_secret2_value" {
  default     = "Admin@123@123"
  type        = string
  description = "This is about key vault secret value"
}