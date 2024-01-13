terraform {
  backend "gcs" {
    bucket      = "streamline-terrafrom-bucket" # GCS bucket name to store terraform tfstate
    prefix      = "env-dev2"
    credentials = "streamline-408713-43a9f435bb42.json" # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}