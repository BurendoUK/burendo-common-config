resource "aws_sns_topic" "burendo_alerts_topic" {
  provider = aws.northvirginia
  name     = "${local.environment}-burendo-alerts"
}
