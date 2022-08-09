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

locals {
  environment = terraform.workspace == "default" ? "burendo-prod" : terraform.workspace
  account = {
    "burendo-prod" = "936130398903"
  }

  admin_team = 5127148

  tags = {
    Environment = local.environment
    Company     = "Burendo"
    Practice    = "Engineering"
  }

}

variable "assume_role" {
  default = "Administrator"
}

variable "region" {
  default = "eu-west-2"
}

provider "aws" {
  region = var.region

  assume_role {
    role_arn = "arn:aws:iam::${lookup(local.account, local.environment)}:role/${var.assume_role}"
  }
}
