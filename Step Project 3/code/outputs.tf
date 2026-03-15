output "bucket_name" {
  value = aws_s3_bucket.tf_state.bucket
}

output "bucket_region" {
  value = var.aws_region
}