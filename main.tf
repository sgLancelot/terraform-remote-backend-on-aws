resource "aws_s3_bucket" "tf_backend_bucket" {
  bucket = "your-bucket-name-zk-testing" # var this
  acl    = "private"          # this is assumes that your pipeline is in the same AWS account. Dont var this.
  
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
    Name          = "S3 Bucket for Terraform Backend"
    ProvisionedBy = "Terraform"
    # you can add more tags here, such as Environment
  }
}

resource "aws_dynamodb_table" "tf_state_lock_db" {
  name = "your_ddb_name" # var this
  billing_mode = "PAY_PER_REQUEST" # state lock DB is very seldom utilized. reduce cost with this.
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name          = "DynamoDB for Terraform State Locking"
    ProvisionedBy = "Terraform"
    # you can add more tags here, such as Environment
  }
}