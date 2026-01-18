# terraform {
#   required_providers {
#     proxmox = {
#       source  = "telmate/proxmox"
#       version = "3.0.2-rc07"
#     }
#   }
# }
#
# provider "proxmox" {
#   pm_debug        = true
#   pm_api_url      = var.proxmox_instance
#   pm_user         = var.proxmox_user
#   pm_password     = var.proxmox_password
#   pm_tls_insecure = true
#   pm_log_enable = true
#   pm_log_file   = "./logs/terraform-plugin-proxmox.log"
#   pm_log_levels = {
#     _default    = "debug"
#     _capturelog = ""
#   }
# }


terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.93.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_instance
  username = var.proxmox_user
  password = var.proxmox_password
  insecure = true

  debu
}
