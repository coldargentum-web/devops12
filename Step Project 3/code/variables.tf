variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "bucket_prefix" {
  description = "Prefix for S3 bucket name"
  type        = string
  default     = "michael-tfstate-jenkins"
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Project = "step-project-3"
    Owner   = "Michael"
    Env     = "study"
  }
}