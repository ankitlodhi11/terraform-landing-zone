resource"azurerm_storage_account" "st1" {
  #checkov:skip=CKV_AZURE_44: "TLS 1.2 testing environment"
  #checkov:skip=CKV_AZURE_206: "LRS is sufficient for dev environment"
    for_each = var.stg
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}