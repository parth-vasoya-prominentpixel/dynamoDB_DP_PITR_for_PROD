module "console_portal_waf" {
  source  = "aws-ss/wafv2/aws"
  version = "3.13.0"
  
  name        = format("%s-waf-%s-cfnt-waf-%s-%s-%s", var.prefix_company, var.application, local.region_prefixes, var.env, var.random_suffix)
  description = "WAFv2 to allow only US and India traffic for Console Portal"

  scope = "CLOUDFRONT"
resource_arn = []
  default_action = {
    block = {}
  }

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
    "Name" = format("%s-waf-%s-cfnt-waf-%s-%s-%s", var.prefix_company, var.application, local.region_prefixes, var.env, var.random_suffix)
  })

}
 