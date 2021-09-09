variable "ip_address" {}
variable "secret_id" {}
variable "role_id" {}
variable "project_name" {}
variable "env_name" {}
variable "env_type" {}


variable "dependencies_list" {
  default = []
}
variable "ansible_template_file" {}
variable "ansible_host_path" {}
variable "ansible_playbook_path" {}