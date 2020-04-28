
resource "exoscale_ssh_keypair" "ssh_key" {
  name       = format("%s%s", var.related_instance_name, "_keypair")
}
resource "local_file" "private_key" {
  filename = format("%s%s",var.path,var.related_instance_name)
  content = exoscale_ssh_keypair.ssh_key.private_key
  file_permission = "0600"
  depends_on = [exoscale_ssh_keypair.ssh_key]
  provisioner "local-exec" {
    command = "ssh-keygen -y -f ${format("%s%s",var.path,var.related_instance_name)} > ${format("%s%s",var.path,var.related_instance_name)}.pub"
  }
}
