#Exoscale compute module

This module specifies the creation of the `exoscale_compute` resource.


## Variables
- `instance_name`
   The instance's name and hostname
   Default : `default-instance-name`
- `security_groups_list`
   A list of security group where the instance should be in 
   Default : `[]`
- `dependencies_list`
    A list of terraform ressources that the instance muste be waiting on creation or delete
    Exemple: "Wait for ssh_key_pair creation before creating the instance"
    Default: `[]`
- `instance_size`
    A string describing the instance size [See on Exoscale](https://www.exoscale.com/pricing/)
    Default: `Micros`
- `disk_size`
    An integer describing the disk size [See on Exoscale](https://www.exoscale.com/pricing/)
    Default: `10`              
- `network_id`
    The id of an existing network on Exoscale
- `local_zone`
    The string describing the local zone [See on Exoscale](https://www.exoscale.com/datacenters/)
    Default: `ch-gva-2`

## Output
 - `data`: The complete resource data