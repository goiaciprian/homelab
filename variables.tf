variable "proxmox_user" {
  type        = string
  description = "terraform user declared on proxmox"
}

variable "proxmox_password" {
  type        = string
  description = "terraform password"
}
variable "proxmox_instance" {
  type = string
}


variable "test_lxc_password" {
  type = string
}