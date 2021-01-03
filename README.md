Terraform Remote Backend on AWS
========
This Terraform script will help you to create a remote backend to store your Terraform state for your Terraform projects. It contains additonal features that is work in progress.

To use this Terraform script, go to the root directory and run:

    terraform apply
    
Terraform state can be stored locally or remote. Since this Terraform script helps you to create a backend to store your Terraform state remotely, it should use a local state to do so.

Features
--------
- Terraform state storage on Amazon S3 Bucket
- State locking with AWS DynamoDB Table
- GitHub Repository for Terraform code [additional feature in origin/github-as-code-repo branch]

Prerequisites
-------------
Terraform must be installed before usage of this Terraform script. For more instructions on how to do so, refer to https://learn.hashicorp.com/tutorials/terraform/install-cli. Ensure that you are using Terraform version 0.14.3 at least. 

Terraform utilizes your local AWS credentials stored on your computer to interact with AWS via the AWS provider. You need to install AWS CLI on your local computer and run `aws configure` to configure your local AWS credentials before running `terraform init` and `terraform apply`. Ensure that your AWS credentials have permissions to create AWS S3 buckets and DynamoDB tables.

If you intend to use the additional feature to create an empty GitHub repository for your Terraform code, you need to have an existing GitHub account.

Installation (basic)
------------
Install Terraform Remote Backend on AWS by running:

    git clone https://github.com/sgLancelot/terraform-remote-backend-on-aws.git
    cd terraform-remote-backend-on-aws
    terraform init

Installation (additional feature) - Work in Progress
------------
To utilise the additional feature to create an empty GitHub repository, run the following commands:

    git clone https://github.com/sgLancelot/terraform-remote-backend-on-aws.git
    cd terraform-remote-backend-on-aws
    git checkout origin/github-as-code-repo

Log into your GitHub account and generate a GitHub personal access token. This token key needs to be added into your Terraform variable file (terraform.tfvars). REMEMBER to treat your access Token like your password and NEVER expose it by checking it into a public version control repository. 

    touch terraform.tfvars
    terraform init

Open terraform.tfvars with a text editor and add in: `github_access_token = "<YOUR_GITHUB_ACCESS_TOKEN>"`. The detailed instructions can be found in my blogpost: https://blog.zhenkai.xyz/getting-started-with-terraform-ci-cd-github-repository/

Support
-------
If you are having issues, please let me know via email, tzhenkai@outlook.com

License
-------
The project is licensed under the MIT license.