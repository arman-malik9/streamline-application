
variable "project" {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = "streamline-408713"
}

variable "credentials_json_file" {
  description = "The name of credential json file name."
  type        = string
}

variable "region" {
  description = "Region for cloud resources"
  default     = "us-central1"
}
variable "zone" {
  description = "zone for cloud compute instances"
}

variable "machine_type" {
  description = "machine type for instances"
}

variable "os_image" {
  description = "os image for instances"
}
variable "disk_size" {
  description = "size of disk"
  type        = number
}
variable "project_id" {
  description = "Project Id of the Cloud resourc"
}

variable "service_account_email_id" {
  description = "An email address that represents a service account"
  default     = "1037323327051-compute@developer.gserviceaccount.com"
}

