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

data "terraform_remote_state" "core"{
  backend = "azurerm"
  config = {
    resource_group_name  = var.backend_resource_group_name
    storage_account_name = var.backend_storage_account_name
    container_name       = var.backend_container_name
    key                  = var.backend_core_key

  }
}

resource "azurerm_subnet" "lzsubnet" {
  name                = var.subnet_name
  resource_group_name = data.terraform_remote_state.core.outputs.core_vnet.resource_group_name
  virtual_network_name = data.terraform_remote_state.core.outputs.core_vnet.name
  address_prefixes = var.subnet_address_space
}