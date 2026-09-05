resource "azurerm_resource_group" "rg1" {
    for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}

resource"azurerm_storage_account" "st1" {
    for_each = var.stg
    depends_on = [azurerm_resource_group.rg1]
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_virtual_network" "vnet1" {
    for_each = var.vnets
    
  name                = each.value.name 
  resource_group_name = each.value.resource_group_name
  location            = each.value.location 
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

}