terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.33.0"
    }
  }
}

provider "azurerm" {
    client_id = "b7401eb6-c84b-46be-bfa0" #example
    client_secret = "ZWr8Q~fUkVyEsOcdXKX2" #example
    subscription_id = "5a142c43-324b-4bfa" #example
    tenant_id = "ca3f6d08-8546-4fe4-b315" #example

  features {
    
  }
}
