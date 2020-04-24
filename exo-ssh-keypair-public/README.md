# Exoscale SSH-keypair

This module is specified to generate an SSH keypair resource with a given public key.

## Variables
 
 - `related_instance_name` :
    The name of the instance where the key will be reattached at. Is use to create the keypair name as `{{ related_instance_name }}_keypair`
 - `public_key` :
    The public part of a generated ssh key (see [The Exoscale documentation](https://community.exoscale.com/documentation/compute/ssh-keypairs/))

## Output
 - `key_pair`: The complete resource data