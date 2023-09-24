# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

The root module structure are as follows:
```
PROJECT_ROOT
|
|-- main.tf          - everything else
|-- variables.tf     - stores structure of input variables
|-- terraform.tfvars - data of variables loaded by default
|-- providers.tf     - required providers and their configuration
|-- outputs.tf       - stores outputs
|-- README.md        - required for root module
```

[Root Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)


## Terraform and Input Variables
## Terraform Cloud Variables

In terraform we can set two kind of variables:
- Environment Variables - those you would normally set in your  bash terminal eg. AWS_CREDENTIALS
- Terraform Variables - those you would normally set in your tfvars file

We can set Terrafom Cloud Variables to sensititve, so they are not shown visibility in the UI.

### Loading Terraform Input Variables
[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my-user_id"`

### var-file flag
We can use the `-var-file` flag to define multiple variables in a *.tfvars or *.tfvars.json to override variables eg `terraform -var-file="example.tfvars"`

### terraform.tfvars

This is the default file to load in terraform variables in bulk

### auto-tfvars
Files ending in .auto-tfvars are automatically loaded.

### order of terraform variables
- The terraform.tfvars file, if present.
- The terraform.tfvars.json file, if present.
- Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
- Any -var and -var-file options on the command line, in the order they are provided. (This includes   variables set by a Terraform Cloud workspace.)

