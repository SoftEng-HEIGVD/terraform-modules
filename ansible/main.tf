variable "ip_address" {}
variable "secret_id" {}
variable "role_id" {}
variable "dependencies_list" {
  default = []
}
variable "ansible_template_file" {}
variable "ansible_host_path" {}
variable "ansible_playbook_path" {}
data "template_file" "ansible-hosts-template" {
  template = file(var.ansible_template_file)
  vars = {
    ip = var.ip_address
    secret_id= var.secret_id
    role_id= var.role_id
  }
  depends_on = [var.dependencies_list]
}


resource "local_file" "ansible-hosts-file" {
  content  = data.template_file.ansible-hosts-template.rendered
  filename = var.ansible_host_path
}

resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command = "ssh-keyscan ${var.ip_address}  >> ~/.ssh/known_hosts && ansible-playbook -i ${var.ansible_host_path} ${var.ansible_playbook_path}"
  }
  triggers = {
    "after" = local_file.ansible-hosts-file.id,
  }
}