provider "google" {
  credentials = file("${var.credentials_json_file}")
  project     = var.project
  region      = var.region
}