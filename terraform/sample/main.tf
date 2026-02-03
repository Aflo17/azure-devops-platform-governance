terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "azurerm" {
  features {}                   
}

resource "azurerm_resource_group" "rg" {
    name     = "rg-ado-gov-terraform-validation"
    location = "East US"  

    tags = {
        owner   = "platform-governance"
        purpose = "terraform-validation"
    }
}