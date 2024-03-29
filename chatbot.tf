resource "awscc_chatbot_slack_channel_configuration" "burendo_alerts_to_slack" {
  configuration_name = "burendo-alerts-to-slack"
  iam_role_arn       = aws_iam_role.chatbot_burendo_alerts_to_slack.arn
  slack_channel_id   = local.burendo_slack_practice_engineering_notifications_channel_id
  slack_workspace_id = local.burendo_slack_workspace_id
  sns_topic_arns     = [aws_sns_topic.burendo_alerts_topic.arn]
  logging_level      = "INFO"
  guardrail_policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

resource "aws_iam_role" "chatbot_burendo_alerts_to_slack" {
  provider           = aws.northvirginia
  name               = "AWSChatbotRoleBurendoAlertsToSlack"
  assume_role_policy = data.aws_iam_policy_document.chatbot_burendo_alerts_to_slack_assume_role.json
}

data "aws_iam_policy_document" "chatbot_burendo_alerts_to_slack_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["chatbot.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "chatbot_burendo_alerts_to_slack_read_only_access" {
  provider   = aws.northvirginia
  role       = aws_iam_role.chatbot_burendo_alerts_to_slack.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
