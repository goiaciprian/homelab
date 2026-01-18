module "test-lxc" {
  source = "./test"

  pve-node = local.nodes.pve-node-1
  template = local.templates.small-docker

  password = var.test_lxc_password
}

output "ip" {
  value = module.test-lxc.ip
}
