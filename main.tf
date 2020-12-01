resource "aws_s3_bucket" "tf_backend_bucket" {
  bucket = "your_bucket_name" # var this
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