The beauty of IaC is that it allows you to fully automate and account for your infrastructure as one can provision, commission and destroy infrastructure from the comfort of your IDE. For us to be able to have a single point of control and ability to collaborate in future, we can set up our resource provisioning infrastructure to rely on a Version Control System, in this case I shall use GitHub for Version Control and GitHub actions as the method of configuring my cloud environment.
### Writing configs
Write your Terraform configuration, in this case I shall add a domain to cloudflare using Terraform. We can start by writing our `main.tf` file 
```hcl
terraform {
	required_providers {
		cloudflare = {
		source = "cloudflare/cloudflare"
		version = "4.30.0"
		}
	}
}
provider "cloudflare" {
	email = var.cloudflare_email_address
	api_key = var.cloudflare_api_key
}
resource "cloudflare_zone" "y_com" {
	account_id = var.cloudflare_account_id
	zone = "y.com"
	plan = "free"
}
```

We can proceed to add our variables on `variables.tf`
```hcl
variable "cloudflare_account_id" {
	description = "Cloudflare account id"
	type = string
}
variable "cloudflare_email_address" {
	description = "Email address for my cloudflare account"
	type = string
}
variable "cloudflare_api_key" {
	description = "Cloudflare API key"
	type = string
}
```
In this case we shall have our state files stored on S3, we can define this on our `backend.tf` file.
```hcl
terraform {
	backend "s3" {
		bucket = "mybucket"
		key = "global/terraform.tfstate"
		region = "us-east-2"
		encrypt = true 
	}
}
```
Assumption, is we already have this bucket set up on AWS. We can then push this to our GitHub repository. To leverage the power of GitHub actions we can set up our test workflow which will be responsible for checking formatting, any errors on configurations and providing you with a plan on how what Terraform is going to provision.
Our test workflow will look as shown below:
```yml
name: Cloudflare Tests
on:
	pull_request:
		branches:
			- main
jobs:
	run-cloudflare-tests:
		runs-on: ubuntu-latest
		steps:
		- name: Checkout repository
		  uses: actions/checkout@v4
		- name: Install Terraform
		  uses: hashicorp/setup-terraform@v1
		  with:
			terraform_version: 1.7.5
		- name: Initialize Terraform
		  env:
			AWS_ACCESS_KEY: ${{ secrets.AWS_ACCESS_KEY }}
			AWS_SECRET_KEY: ${{ secrets.AWS_SECRET_KEY }}
		  run: terraform -chdir=${GITHUB_WORKSPACE}/cloudflare init -backend-config="access_key=$AWS_ACCESS_KEY" -backend-config="secret_key=$AWS_SECRET_KEY"

		- name: Check formatting
		  run: terraform -chdir=${GITHUB_WORKSPACE}/cloudflare fmt -check
		- name: Checking for misconfigurations
		  run: terraform -chdir=${GITHUB_WORKSPACE}/cloudflare validate
		- name: Does your cloudflare configuration make sense?
		  env:
			CLOUDFLARE_ACCOUNT_ID: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
			CLOUDFLARE_API_KEY: ${{ secrets.CLOUDFLARE_API_KEY }}
			CLOUDFLARE_EMAIL_ADDRESS: ${{ secrets.CLOUDFLARE_EMAIL_ADDRESS }}
			run: |
				terraform -chdir=${GITHUB_WORKSPACE}/cloudflare plan \
				-var cloudflare_account_id="$CLOUDFLARE_ACCOUNT_ID" \
				-var cloudflare_api_key="$CLOUDFLARE_API_KEY" \
				-var cloudflare_email_address="$CLOUDFLARE_EMAIL_ADDRESS"
```

Because our AWS bucket does not have public access available, we need to authenticate to it, we add our AWS keys to GitHub secrets and call them as environments and initialize add them to the `terraform init` command as environmental variable using the `-backend-config` flag and specify our secrets.

On the plan script, we add our Cloudflare credentials that we defined as variables when we run the `terraform plan` command using the `-var` flag. The workflow will pass if all the steps pass, we can use this as one way to test our Terraform configurations.

To apply, we can have a yml file that runs on merge as show below:
```yml
name: Apply all configurations
on:
	push:
	branches:
		- main
jobs:
	run-cloudflare-tests:
	runs-on: ubuntu-latest
	steps:
	- name: Checkout repository
	  uses: actions/checkout@v4
	- name: Install Terraform
	  uses: hashicorp/setup-terraform@v1
	  with:
		  terraform_version: 1.7.5
	- name: Initialize Terraform
	  env:
		AWS_ACCESS_KEY: ${{ secrets.AWS_ACCESS_KEY }}
		AWS_SECRET_KEY: ${{ secrets.AWS_SECRET_KEY }}
	  run: terraform -chdir=${GITHUB_WORKSPACE}/cloudflare init -backend-config="access_key=$AWS_ACCESS_KEY" -backend-config="secret_key=$AWS_SECRET_KEY"
	- name: Applying your cloudflare configurations
	  env:
		CLOUDFLARE_ACCOUNT_ID: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
		CLOUDFLARE_API_KEY: ${{ secrets.CLOUDFLARE_API_KEY }}
		CLOUDFLARE_EMAIL_ADDRESS: ${{ secrets.CLOUDFLARE_EMAIL_ADDRESS }}
	  run: |
		  terraform -chdir=${GITHUB_WORKSPACE}/cloudflare apply -auto-approve \
		  -var cloudflare_account_id="$CLOUDFLARE_ACCOUNT_ID" \
		  -var cloudflare_api_key="$CLOUDFLARE_API_KEY" \
		  -var cloudflare_email_address="$CLOUDFLARE_EMAIL_ADDRESS"
```

The last workflow just applies the change to Cloudflare so what you need to do is just write your configuration and push to GitHub.