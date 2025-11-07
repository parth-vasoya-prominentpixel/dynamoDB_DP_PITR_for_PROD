
#####################################
# DynamoDB
#####################################
output "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  value       = module.dynamodb_table.dynamodb_table_arn
}


output "bucket-web-hosting-link" {
  value = module.s3_bucket.s3_bucket_website_domain
}