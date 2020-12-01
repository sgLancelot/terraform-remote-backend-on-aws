terraform {
  required_version = ">= 0.13.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1" # convert to var
  #access_key = "xxxxx" # Remember to not hardcode your credentials
  #secret_key = "xxxxx" # Remember to not hardcode your credentials
}