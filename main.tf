terraform {
    required_providers {
      azurerm   = {
        source  = "hashicorp/azurerm"
        version = "=4.1.0"
      }
    }
}

provider "azurerm" {
  features {}
  subscription_id = "6a5c7c80-b3f3-4b2f-aacb-8836a0f0aefd"
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

resource "azurerm_storage_account" "storage_account" {
  name                     = "ottosstorageacc"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_replication_type = "LRS"
  account_kind             = "BlobStorage"
  account_tier             = "Standard"
}