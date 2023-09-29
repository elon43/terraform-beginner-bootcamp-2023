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

## Dealing With Configuration Drift

### What happens if we lose our state file?

If you lose your statefile, you most likely have to tear donw all your cloud infrastructure manually.

You can use terraform import but it won't work for all cloud resources.  Check the documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`
[Terraform Import](https://developer.hashicorp.com/terraform/language/import)
## Fix Manual Configuration

If someone goes and deletes or modifies cloud resources manually through ClickOps.

If we run Terraform plan it will attempt to put or infrastructure back into the expected state fixing Configuration Drift.

### Fix using Terraform Refresh
```sh
terraform apply -refresh-only -auto-approve
```
##  Terraform Modules

### Terraform Module Structure

It is recommended to place modules in a `modules` directory when locally developing modules.  However, you can name the directory whatever you like.

### Passing Input Variables

We can pass input variables to our module.

The module has to declare the terraform variables in its own variables.tf
```tf
module terrahouse_aws {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}  
```
### Modules Sources

Using the source we can import the module from places, eg:
- locally
- Github
- Terraform Registry

```tf
module terrahouse_aws {
  source = "./modules/terrahouse_aws"
}  
```
[Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

## Considerations when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraform.

It may likely produce older examples that could be be deprecated.  This will often on affect providers.

## Working with Files in Terraform

### Filemd5 function

This is a built in terraform function that hashes the contents of a given file rather than a liter string.

[filemd5](https://developer.hashicorp.com/terraform/language/functions/filemd5)
### Fileexists function

This is a built in terraform function to check the existence of a file.

```
variable "error_html_filepath" {
  description = "Path to the error.html file"
  type        = string
  validation {
    condition     = fileexists((var.error_html_filepath))
    error_message = "The specified error.html file does not exist."
  }
}
```

[Fileexists](https://developer.hashicorp.com/terraform/language/functions/fileexists)

### Path Variable

In terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path of the current module
- path.root = get the path of the root module of the configuration

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references)/workspace/terraform-beginner-bootcamp-2023/modules/

```resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "{path.root}/public/index.html"
}
```

## Terraform Local Values

Local values are temporary local variables.

[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)

## Terraform Data Sources

Data sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions.

```tf
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}

[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)
```
## Working with JSON

This will map terraform language values to JSON.  We used this to create the policy statements.

```json
jsonencode({"hello"="world"})
{"hello":"world"}
```