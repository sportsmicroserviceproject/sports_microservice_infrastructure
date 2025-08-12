terraform {
  required_version = ">= 1.0"
  
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"  
      version = "~> 1.50"
    }
  }
}

# Provider auth: prefer environment variable HCLOUD_TOKEN or TF_VAR_hcloud_token.
provider "hcloud" {
  token = var.hcloud_token
}