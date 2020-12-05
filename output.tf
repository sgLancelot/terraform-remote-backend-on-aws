output "bucket_name" {
  value       = aws_s3_bucket.tf_backend_bucket.id
  description = "Bucket name of your remote Terraform state storage"
}

output "dynamodb_name" {
  value       = aws_dynamodb_table.tf_state_lock_db.id
  description = "DynamoDB table name of your remote Terraform state locking mechanism"
}

output "region" {
  value       = var.region
  description = "Region your remote Terraform state will be in"
}