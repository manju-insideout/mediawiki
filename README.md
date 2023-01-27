This code is solution to automate the deployment of mediawiki on docker orchestrated using K8

Details
--------
It's started with one instance of mediawiki running.
It's backed by a database server MySql running on a separate container.

The problem statement including the infrastructure setup using any Terraform as IAC with proper syntax and naming convention, modular code

This structure is optimized by creating a separate folder for provisioners, which contains all provisioners for the entire deployment. 
This way, you can keep all provisioners in a single place and manage them easily.

Also Dockerfile.tpl at the root of the project, this way it's accessible by all the modules, and the provisioners can use it to build the required images.


├── modules
|   ├── mediawiki
|   |   ├── main.tf
|   |   ├── variables.tf
|   |   └── outputs.tf
|   ├── mysql
|   |   ├── main.tf
|   |   ├── variables.tf
|   |   └── outputs.tf
|   ├── kubernetes
|   |   ├── deployment
|   |   |   ├── main.tf
|   |   |   ├── variables.tf
|   |   |   └── outputs.tf
|   |   ├── service
|   |   |   ├── main.tf
|   |   |   ├── variables.tf
|   |   |   └── outputs.tf
|   |   ├── provisioners
|   |       ├── main.tf
|   |       ├── variables.tf
|   |       └── outputs.tf
|   ├── provisioners
|   |   ├── main.tf
|   |   ├── variables.tf
|   |   └── outputs.tf
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── Dockerfile.tpl
└── README.md


