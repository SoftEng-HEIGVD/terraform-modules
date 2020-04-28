
resource "exoscale_ssh_keypair" "ssh_key" {
  name       = format("%s%s", var.related_instance_name, "_keypair")
  public_key = var.public_key
}