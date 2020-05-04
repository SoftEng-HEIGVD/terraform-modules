#Exoscale ansible module

This module specifies the creation of the a `null_resource` that will execute locally ansible.


## Variables
- `ip_address`
   The instance's ipv4 address
- `secret_id`
   A vault wrapped secret_id 
- `role_id`
   The vault role_id
- `dependencies_list`
    A list of resource to be waiting on before executing ansible
    Default: `[]`
- `ansible_template_file`
    The path of the ansible host template file.
    This file should provide the role_id and secret_id variable.
- `ansible_host_path`
    The path where to store the rendered file
- `ansible_playbook_path`
    The path to the playbook

## Output
`No actual output`