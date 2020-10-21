locals {
  zone = var.local_zone
}
resource "exoscale_compute" "instance" {
  depends_on = [var.dependencies_list]

  zone            = local.zone
  display_name    = var.instance_name
  hostname        = var.instance_name
  template_id        = var.template_id
  size            = var.instance_size
  disk_size       = var.disk_size
  keyboard        = "fr-ch"
  key_pair        = format("%s%s", var.instance_name, "_keypair")
  state           = "Running"
  security_groups = var.security_groups_list
  ip6             = true
}

resource "exoscale_nic" "instance_network" {
  compute_id = exoscale_compute.instance.id
  network_id = var.network_id
}
