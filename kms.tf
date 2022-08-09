resource "aws_kms_key" "burendo_terraform_state_key" {
  description             = "This key is used to encrypt terraform state bucket objects"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = merge(local.tags, { Name = "burendo-terraform-state-key" })
}

resource "aws_kms_alias" "burendo_terraform_state_key_alias" {
  name          = "alias/burendo-common-config/terraform-state-key"
  target_key_id = aws_kms_key.burendo_terraform_state_key.key_id
}
