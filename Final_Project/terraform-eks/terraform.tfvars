region      = "eu-central-1"
name        = "danit"
vpc_id      = "vpc-0eeda6e433f8c9db1"
subnets_ids = [
  "subnet-034ef95966c929871",
  "subnet-017ce7178f926d6bb",
  "subnet-014248ad828954882"
]

tags = {
  Environment = "test"
  TfControl   = "true"
}

zone_name = "devops8.test-danit.com"