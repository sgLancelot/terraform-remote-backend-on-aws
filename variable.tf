variable "bucket_name" {
  description = "Name of bucket storing terraform state. Must be globally unique."
  type        = string
  default     = "" # defaults to a random terraform name
}

variable "dynamodb_name" {
  description = "Name of DynamoDB table to enforce terrform state locking."
  type        = string
  default     = "tfstate-locking-dynamodb-table"
}

variable "github_repo_name" {
  description = "GitHub repository name for Terraform code"
  type        = string
  default     = "terraform-code-repo"
}

variable "region" {
  description = "Region to deploy the remote backend"
  type        = string
  default     = "us-east-1"
}

variable "github_access_token" {
  description = "GitHub Personal Access Token to access GitHub API"
  type        = string
}