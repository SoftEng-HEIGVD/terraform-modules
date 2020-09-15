terraform {
  required_providers {
    exoscale = {
      source = "exoscale/exoscale"
    }
    local = {
      source = "hashicorp/local"
    }
  }
  required_version = ">= 0.13"
}
