terraform {
  required_version = "1.2.6"

  backend "s3" {
    bucket         = "burendo-terraform-state"
    key            = "terraform/burendo/burendo-common-config.tfstate"
    region         = "eu-west-2"
    encrypt        = false
    dynamodb_table = "terraform-state-lock"
    kms_key_id     = "alias/burendo-common-config/terraform-state-key"
  }

  required_providers {
    aws = {
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region

  assume_role {
    role_arn = "arn:aws:iam::${lookup(local.account, local.environment)}:role/${var.assume_role}"
  }
}
