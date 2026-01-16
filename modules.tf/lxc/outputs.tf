output "id" {
  value       = proxmox_lxc.docker-clone.vmid
  description = "id of the created lxc"
}

# output "ipv4" {
#   value = proxmox_lxc.docker-clone.ip ??
# }
