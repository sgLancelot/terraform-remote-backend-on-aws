Terraform Remote Backend on AWS
========

This Terraform script will help you to create a remote backend to store your Terraform state for your Terraform projects. 

To use this Terraform script, go to the root directory and run:

    terraform init
    terraform apply
    
Terraform state can be stored locally or remote. Since this Terraform script helps you to create a backend to store your Terraform state remotely, it should use a local state to do so.


Features
--------

- Terraform state storage on Amazon S3 Bucket
- State locking with AWS DynamoDB Table

Prerequisites
-------------
Terraform must be installed before usage of this Terraform script. For more instructions on how to do so, refer to https://learn.hashicorp.com/tutorials/terraform/install-cli. Ensure that you are using Terraform version 0.13.5 at least. 

Terraform utilizes your local AWS credentials stored on your computer to interact with AWS via the AWS provider. You need to install AWS CLI on your local computer and run `aws configure` to configure your local AWS credentials before running `terraform init` and `terraform apply`. Ensure that your AWS credentials have permissions to create AWS S3 buckets and DynamoDB tables.

Installation
------------

Install Terraform Remote Backend on AWS by running:

    git clone https://github.com/sgLancelot/terraform-remote-backend-on-aws.git
    cd terraform-remote-backend-on-aws
    terraform init

Support
-------

If you are having issues, please let me know via email, tzhenkai@outlook.com

License
-------

The project is licensed under the MIT license.