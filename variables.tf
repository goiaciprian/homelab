variable "proxmox_user" {
  description = "terraform user declared on proxmox"
}

variable "proxmox_password" {
  description = "terraform password"
}

variable "proxmox_instance" {}

variable "node" {
  default = "pve-node-o1"
}

variable "hostname" {}

variable "password" {}

variable "clone_source" {
  default = "111"
}
