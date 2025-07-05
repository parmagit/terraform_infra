data "azurerm_client_config" "tenant" {}

resource "azurerm_key_vault" "kv" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.tenant.tenant_id 
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id =  data.azurerm_client_config.tenant.tenant_id
    object_id =  data.azurerm_client_config.tenant.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}

# resource "azurerm_key_vault_secret" "key_secret" {
#   name         = "secret-sauce"
#   value        = "szechuan"
#   key_vault_id = azurerm_key_vault.example.id
# }
