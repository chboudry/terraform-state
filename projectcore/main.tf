terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.29.1"
    } 
  }
  backend "azurerm" {
  }
}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "core_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "core_vnet" {
  name     = var.vnet_name
  location = var.location
  address_space = var.vnet_address_space
  resource_group_name = azurerm_resource_group.core_rg.name
}