resource "azurerm_virtual_network" "vnet1" {
    for_each = var.vnets
    
  name                = each.value.name 
  resource_group_name = each.value.resource_group_name
  location            = each.value.location 
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

}