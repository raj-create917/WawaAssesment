

variable "app_name" {
  description = "the name of your stack"
  default = "assignment"
}

variable "environment" {
  description = "the name of your environment"
  default = "uat"
}


variable "aws_account_id" {
  description = "AWS account id"
  default = "798701516363"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}