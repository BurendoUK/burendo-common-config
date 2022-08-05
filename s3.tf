resource "aws_s3_bucket" "terraform_state" {

  bucket = "burendo-terraform-state"

  tags = {
    Name     = "burendo-terraform-state"
    Company  = "Burendo"
    Practice = "Engineering"
  }

}

resource "aws_s3_bucket_versioning" "terraform_state_version" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# resource "aws_s3_bucket_acl" "terraform_state_acl" {
#   bucket = aws_s3_bucket.terraform_state.id
#   acl    = "private"
# }
