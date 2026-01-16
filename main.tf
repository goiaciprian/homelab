module "lxc" {
  source = "./modules.tf/lxc"

  hostname = var.hostname
  node     = var.node
  password = var.password
}
