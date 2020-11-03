/*
 * Terraform variable declarations for GCP.
 */

/*********************************************
Modify the following fields
*********************************************/
variable "gcp_project_id" {
  description = "GCP Project ID"
  type = string
  default = "GCP_PROJECT_ID"
}

variable "gcp_region" {
  description = ""
  type = string
  default = "us-central1" // optional
}

variable "gcp_credentials_file" {
  description = "Full path to the JSON credentials file"
  type = string
  default = "PATH_TO_JSON_FILE"
}

variable "gcp_ssh_key" {
    description = "Full path to the SSH private key file"
    type = string
    default = "PATH_TO_SSH_KEY"
}

/*********************************************
END
*********************************************/

variable "vnet-linux1-cidr" {
   default = "192.168.1.0/24"
}

variable "vnet-linux2-cidr" {
   default = "192.168.2.0/24"
}

variable "vnet-fiber-hub1-cidr" {
   default = "198.18.0.0/24"
}

variable "vnet-lte-hub1-cidr" {
   default = "198.19.0.0/24"
}

variable "vnet-fiber-spoke1-cidr" {
   default = "198.18.1.0/24"
}

variable "vnet-lte-spoke1-cidr" {
   default = "198.19.1.0/24"
}

variable "vnet-fiber-spoke2-cidr" {
   default = "198.18.2.0/24"
}

variable "vnet-lte-spoke2-cidr" {
   default = "198.19.2.0/24"
}

variable "vnet-dc1-cidr" {
   default = "192.168.0.0/24"
}

variable "vnet-mgmt-cidr" {
   default = "192.168.100.0/24"
}

