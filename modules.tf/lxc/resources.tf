terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_lxc" "docker-clone" {
  target_node = var.node
  hostname    = var.hostname
  password    = var.password

  clone = var.clone_source
  full  = true
}
