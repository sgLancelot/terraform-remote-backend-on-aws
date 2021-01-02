terraform {
  required_version = ">= 0.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    github = {
      source  = "hashicorp/github"
      version = "~> 4.1"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "github" {
  token = var.github_access_token
}