provider "google" {
  project = var.gcp_project_id
  region = var.gcp_region
  credentials = file("${var.gcp_credentials_file}")
}

data "google_compute_zones" "available" {
  region = "${var.gcp_region}"
}
