###############################
# Common variables
###############################

variable "profile_name" {
  description = "This is the value of the profile_name that use in provider block"
  default     = "Parth-Vasoya"
}
variable "account_number" {
  description = "This is the account number"

}
variable "region" {
  description = "This is the default region we use in the provider block."
}
variable "env" {
  description = "This is show a enviroment that we work"
  validation {
    condition     = contains(["dev", "uat", "prod"], var.env)
    error_message = "env must be one of dev, uat, or prod."
  }
}
variable "prefix_company" {
  description = "This is used as a company prefix"
}
variable "company" {
  description = "This is used as a company name"
}


##################################
# DynamoDB
##################################

variable "hash_key" {
  default     = "ID"
  description = "This is the name for the primary key"
}

variable "dyndb_name" {
  default     = "pitr-deletion-protection-v2"
  description = "This is the name we use in dynamo db table"
}

variable "billing_mode" {
  default     = "PAY_PER_REQUEST"
  description = "This is the value that we use as a billing mode in dynamoDB e.g.(PAY_PER_REQUEST, PROVISIONED)"
}

variable "enable_deletion_protection" {
  type = bool
  description = "Enable dynamodb deletion protection"
}
 
variable "point_in_time_recovery_enabled" {
  type        = bool
  description = "Enable PITR in DynamoDB"
}

variable "point_in_time_recovery_period_in_days" {
  type        = number
  description = "Number of days (1–35) for PITR retention period. Required only if PITR is enabled."
  default     = null


  validation {
    condition = (
      var.point_in_time_recovery_enabled == false
      ||
      (
        var.point_in_time_recovery_period_in_days != null &&
        var.point_in_time_recovery_period_in_days >= 1 &&
        var.point_in_time_recovery_period_in_days <= 35
      )
    )
    error_message = "You must provide a valid point_in_time_recovery_period_in_days (1–35) when point_in_time_recovery_enabled = true."
  }
}
