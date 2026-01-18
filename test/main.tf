terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

locals {
  node      = var.pve-node
  temaplate = var.template
}

variable "pve-node" {
  type = string
}

variable "template" {
  type = string
}

variable "password" {
  type = string
}

resource "proxmox_virtual_environment_container" "test" {
  node_name    = local.node
  unprivileged = true
  started      = true

  features {
    nesting = true
  }

  initialization {
    hostname = "test"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  clone {
    vm_id = local.temaplate
  }
}

resource "null_resource" "run-ansible-test" {
  depends_on = [proxmox_virtual_environment_container.test]

  provisioner "local-exec" {
    command = <<-EOT
      echo "Waiting for test lxc to be ready..."
      sleep 20

      echo "Running Ansible ..."
      ansible-playbook -i '${proxmox_virtual_environment_container.test.ipv4["eth0"]},' --extra-vars "ansible_user=root ansible_password=${var.password}" ${path.module}/playbook.yml
      EOT
  }
}

output "ip" {
  value = proxmox_virtual_environment_container.test.ipv4["eth0"]
}

