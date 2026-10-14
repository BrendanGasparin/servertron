# Provider required for Terraform to communicate with Proxmox
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.112.0"
    }
  }
}
