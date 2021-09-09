locals {
  zone = var.local_zone
}

data "exoscale_compute_template" "template" {
  zone = local.zone
  id = var.template_id
}
resource "exoscale_compute" "instance" {
  depends_on = [var.dependencies_list]

  zone            = local.zone
  display_name    = var.instance_dispalay_name
  hostname        = var.instance_hostname
  template_id     = var.template_id
  size            = var.instance_size
  disk_size       = var.disk_size
  keyboard        = "fr-ch"
  key_pair        = format("%s%s", var.instance_hostname, "_keypair")
  state           = "Running"
  security_groups = var.security_groups_list
  ip6             = true
}

resource "exoscale_nic" "instance_network" {
  compute_id = exoscale_compute.instance.id
  network_id = var.network_id
}
