module "console_portal_waf" {
  source  = "aws-ss/wafv2/aws"
  version = "3.13.0"

  name        =   "${var.prefix_company}-waf-${var.waf_name}-${local.region_prefixes[var.region]}-${var.env}"


  description = "WAFv2 to allow only US and India traffic for Console Portal"

  scope          = "CLOUDFRONT"
  resource_arn   = []
  default_action = "block"

  visibility_config = {
    cloudwatch_metrics_enabled = true
    metric_name                = format("%s-waf-geo-%s-%s", var.application, var.env, var.random_suffix)
    sampled_requests_enabled   = false
  }

  rule = [
    {
      name     = "AllowUSAndIndia"
      priority = 1
      action = {
        allow = {}
      }
      statement = {
        geo_match_statement = {
          country_codes = ["US", "IN"]
        }
      }
      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "AllowUSAndIndia"
        sampled_requests_enabled   = false
      }
    }
  ]

  tags = merge(local.tags, {
    "Name" = "${var.prefix_company}-waf-${var.waf_name}-${local.region_prefixes[var.region]}-${var.env}"
  })

}
 