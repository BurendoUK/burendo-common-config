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
