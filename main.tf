terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = var.sub_id
}

resource "azurerm_resource_group" "myrg" {
  name                = var.res_grp_name
  location            = var.res_grp_location
}
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "myvnet" {

  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  address_space       = var.address_space
}

#Create a subnet

resource "azurerm_subnet" "subnet" {
  count                 = length(var.subnet_name)   
  name                  = element(var.subnet_name, count.index)
  resource_group_name   = azurerm_resource_group.myrg.name
  virtual_network_name  = azurerm_virtual_network.myvnet.name
  address_prefixes      = [element(var.address_prefix, count.index)]
}

