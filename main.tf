resource "aws_s3_bucket" "tf_backend_bucket" {
  bucket = var.bucket_name
  acl    = "private" # this is assumes that your pipeline is in the same AWS account.

  versioning {
    enabled = true # hashicorp highly recommends enabling Bucket Versioning to allow for state recovery in case of accidental deletions
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256" # general good practice to encrypt state file at rest
      }
    }
  }

  tags = {
    Name          = var.bucket_name
    ProvisionedBy = "Terraform"
    # you can add more tags here, such as Environment
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_bucket" {
  # blocks bucket public access. should be modified to fit the system design.
  bucket = aws_s3_bucket.tf_backend_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "tf_state_lock_db" {
  name         = var.dynamodb_name
  billing_mode = "PAY_PER_REQUEST" # state lock DB is very seldom utilized. reduce cost with this.
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name          = var.dynamodb_name
    ProvisionedBy = "Terraform"
    # you can add more tags here, such as Environment
  }
}