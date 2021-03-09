output "data" {
  value = exoscale_compute.instance
}
output "template" {
  value = data.exoscale_compute_template.template
}