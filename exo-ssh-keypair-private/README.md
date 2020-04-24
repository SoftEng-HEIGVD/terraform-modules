#Exoscale SSH-keypair private

This module specifies the creation of the `exoscale_ssh_keypair` without providing the public key.
If no public key was provided to the resourced, Exoscale will generate one and return the private key.

This module will store the private key in the given path and generate the public key with a `ssh-keygen`.

## Variables
 - `related_instance_name` :
    The name of the instance where the key will be reattached at. Is used to create the keypair name as `{{ related_instance_name }}_keypair`
 - `path` :
    The path where to store the key pair. If a relative path is passed it will be relative to the calling terrafom file


## Output
 - `key_pair`: The complete resource data (As the private key is a sensitive data be sure to protect it)

