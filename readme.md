# Azure & Terraform state management

## Motivation

Simple example to demonstrate the code syntax to split and reuse state between projects.

## How to use

1. Edit core_backend.conf, lz_backend.conf and variables.tf files to fill in the name and region you want.

1. Locally, run `az login`

1. Go on folder project core and run :
- terraform init --backend-config=core_backend.conf
- terraform apply

4. then go on folder project lz and run :
- terraform init --backend-config=lz_backend.conf
- terraform apply

## Improvements to consider for production 

- Use this in a CICD pipeline instead of running it locally
- Provide a distinct repository for each project
- Use different identity to run each pipeline
- Provide distinct storage account for each backend project and make sure LZ Identity can only read only state of project core

## Specificity

### Backend Variables

In Terraform, you are not allowed to use variables in the backend block.

So either you put the value statically there, either you submit them through the file at the init time, which I did here.


### VNET & Subnet
In this example, VNET is created within the core project while subnet is created within the lz project.

However subnet is not an ARM resource but a subitem of the VNET.

Thus, the identity that is going to run the lz project must have VNET write permissions to add subnet.

