variable "instance_hostname" {
  default = "default-instance-hostname"
}
variable "instance_dispalay_name" {
  default = "default-instance-display-name"
}

variable "security_groups_list" {
  default = []
}

variable "dependencies_list" {
  default = []
}
variable "instance_size" {
  default = "Micro"
}
variable "disk_size" {
  default = 10
}

variable "network_id" {
}
variable "local_zone" {
  default = "ch-gva-2"
}

variable "template_id" {

}