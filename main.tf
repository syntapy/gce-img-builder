// ubuntu 18.04
// m5a.large
// 2 cpus, 8gb ram, 20gbb hdd

variable "region" { type = string }
variable "zone_letter" { type = string }
variable "project_name" { type = string }
variable "project_number" { type = string }
variable "project_id" { type = string }

locals {
  zone                   = join("-", [var.region, var.zone_letter])
  cloud_build_account    = join("@", [var.project_number, "cloudbuild.gserviceaccount.com"])
  service_account_member = join(":", ["serviceAccount", local.cloud_build_account])
}

provider "google" {
  project = var.project_id
  region  = var.region
}
