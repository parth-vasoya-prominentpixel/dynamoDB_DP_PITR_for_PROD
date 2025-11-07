data "aws_cloudfront_distribution" "cf" {
  id = module.cloudfront.cloudfront_distribution_id
}

data "aws_iam_policy_document" "s3_list_policy_custom" {
  statement {
    sid    = "VisualEditor0"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListBucketVersions",
      "s3:ListTagsForResource",
      "s3:ListMultipartUploadParts"
    ]

    resources = [
      "arn:aws:s3:::pv-s3-tf-create-new-bucket-use1-dev"
    ]
  }

  statement {
    sid    = "VisualEditor1"
    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets"
    ]

    resources = ["*"]
  }
}
