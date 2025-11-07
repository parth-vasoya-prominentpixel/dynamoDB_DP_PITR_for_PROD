provider "aws" {  
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::501046919017:role/pv-iam-github-resource-creation-role"
  }
}

terraform {
  backend "s3" {}
}
