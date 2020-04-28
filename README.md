# Terraform-modules

The purpose of the repo, is to centralise and manage some [Terraform modules](https://www.terraform.io/docs/modules/index.html) 
for the [Exoscale](https://www.exoscale.com/) cloud provider. In order to simplify the structure of the main Terraform module

 ## Folder structure

In Terraform, a folder is a module. So each folder should follow the module structure given in the [documentation](https://www.terraform.io/docs/modules/index.html) 

```
$ tree minimal-module/
.
├── README.md 
├── main.tf
├── variables.tf
├── outputs.tf
```

## Documentation
Each module should have an explicit name, and provide some description in the nested README.md
With the informations about the input variables and outputs

## Modules list
 - exo-compute-module : specifies the creation of the `exoscale_compute` resource.
 - exo-ssh-keypair-private: specifies the creation of the `exoscale_ssh_keypair` without providing the public key.
 - exo-ssh-keypair-public : specifies to generate an SSH keypair resource the creation of the `exoscale_ssh_keypair` with a given public key.
