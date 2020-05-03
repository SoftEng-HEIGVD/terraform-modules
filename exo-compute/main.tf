locals {
  zone = var.local_zone
}

data "exoscale_compute_template" "ubuntu" {
  zone = local.zone
  name = "Linux Ubuntu 18.04 LTS 64-bit"
}

resource "exoscale_compute" "instance" {
  depends_on = [var.dependencies_list]

  zone            = local.zone
  display_name    = var.instance_name
  hostname        = var.instance_name
  template        = data.exoscale_compute_template.ubuntu.name
  size            = var.instance_size
  disk_size       = var.disk_size
  keyboard        = "fr-ch"
  key_pair        = format("%s%s", var.instance_name, "_keypair")
  state           = "Running"
  security_groups = var.security_groups_list
  ip6             = true

  connection {
    type = "ssh"
    host = self.ip_address
    user = data.exoscale_compute_template.ubuntu.username
  }
  provisioner "file" {
    source      = "ansible/wait-for-it.sh"
    destination = "wait-for-it.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x wait-for-it.sh",
      "./wait-for-it.sh"
    ]
  }
}



resource "exoscale_nic" "instance_network" {
  compute_id = exoscale_compute.instance.id
  network_id = var.network_id
}
