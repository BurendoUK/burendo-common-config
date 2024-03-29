# burendo-common-config

The repository holds configuration for infrastructure which is common amongst many services.

This is configuration that those services can them individually consume, rather than recreating many copies of the same configuration which have to be maintained.

This includes shared S3 buckets, KMS keys, DynamoDB instances and ECR repositories.

## Slack alerting

This repository creates an SNS topic called `[environment]-burendo-alerts`. If something is sent to this topic then it makes it way through AWS Chatbot and to the Burendo slack channel `#practice-engineering-notifications`.

To use this topic in your repo, import common infra repo as a `terraform_remote_state` data object and use the output `sns_topic_alerts_to_slack`.

## Usage

### First run
`pip3 install -r requirements.txt`

### Bootstrap

Create your AWS session with the cli, and assume the `Administrator` role. For this I persoanlly use [awsume](https://awsu.me/).

then:

`make bootstrap`
