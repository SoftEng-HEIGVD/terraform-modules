
data "template_file" "ansible-hosts-template" {
  template = file(var.ansible_template_file)
  vars = {
    ip = var.ip_address
    secret_id= var.secret_id
    role_id= var.role_id
    project_name=var.project_name
    env=terraform.workspace
  }
  depends_on = [var.dependencies_list]
}


resource "local_file" "ansible-hosts-file" {
  content  = data.template_file.ansible-hosts-template.rendered
  filename = var.ansible_host_path
}

resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command = "sleep 15 && ssh-keyscan -p 2028 ${var.ip_address}  >> ~/.ssh/known_hosts && ansible-playbook -i ${var.ansible_host_path} ${var.ansible_playbook_path}"
  }
  triggers = {
    "after" = local_file.ansible-hosts-file.id,
  }
}
