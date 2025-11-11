module "dynamodb_table" {
  source = "git@github.com:parth-vasoya-prominentpixel/terraform-modules.git//terraform-aws-dynamodb-table?ref=v1.0.0"

  name = "${var.prefix_company}-dyndb-${var.dyndb_name}-${local.region_prefixes[var.region]}-${var.env}"

  hash_key     = var.hash_key
  billing_mode = var.billing_mode

  attributes = [
    {
      name = var.hash_key
      type = "S"
    }
  ]

  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"

  deletion_protection_enabled           = var.enable_deletion_protection
  point_in_time_recovery_enabled        = var.point_in_time_recovery_enabled
  point_in_time_recovery_period_in_days = var.point_in_time_recovery_enabled ? var.point_in_time_recovery_period_in_days : null

  tags = local.tags
}
