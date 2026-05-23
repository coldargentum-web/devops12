variable "name" {}
variable "vpc_id" {}
variable "subnets_ids" {}
variable "tags" {}
variable "region" {
  default = "eu-central-1"
}
variable "iam_profile" {
  default = null
}
variable "zone_name" {}