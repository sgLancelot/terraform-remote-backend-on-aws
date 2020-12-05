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

variable "region" {
  description = "Region to deploy the remote backend"
  type        = string
  default     = "us-east-1"
}