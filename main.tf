terraform {
    required_providers {
      azurerm   = {
        source  = "hashicord/azurerm"
        version = "=4.1.0"
      }
    }
}

resource "azurerm_resource_group" "resource_group" {
  name     = "Ottos_RG"
  location = "North Europe"
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "Ottos_VNet"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  address_space       = ["10.0.0.0/16"]
}