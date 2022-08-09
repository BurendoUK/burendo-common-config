resource "aws_s3_bucket" "terraform_state" {

  bucket = "burendo-terraform-state"

  tags = merge(local.tags, { Name = "burendo-terraform-state" })

}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.burendo_terraform_state_key.arn
      sse_algorithm     = "aws:kms"
    }
  }

}

resource "aws_s3_bucket_versioning" "terraform_state_version" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
