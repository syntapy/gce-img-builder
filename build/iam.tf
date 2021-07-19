//resource "google_service_account" "build_account" {
//  account_id   = "packer-builder"
//  display_name = "Cloudbuild Service Account"
//}

variable "cloud_build_account" {
  type = string
}

variable "account_b" {
  type = string
}

variable "account_c" {
  type = string
}

resource "google_project_iam_binding" "editor" {
  role = "roles/editor"
  members = [join(":", ["serviceAccount", var.cloud_build_account])]
}

resource "google_project_iam_binding" "cbsv_metadata" {
  role = "roles/compute.instanceAdmin.v1"
  members = [join(":", ["serviceAccount", var.cloud_build_account])]
}

//resource "google_project_iam_binding" "ab_metadata" {
//  role = "roles/compute.instanceAdmin.v1"
//  members = [join(":", ["serviceAccount", var.account_b])]
//}

//resource "google_project_iam_binding" "ac_metadata" {
//  role = "roles/compute.instanceAdmin.v1"
//  members = [join(":", ["serviceAccount", var.account_c])]
//}

//resource "google_project_iam_binding" "source_permission" {
//  role = "roles/source.writer"
//  members = ["user:syntapy@gmail.com"]
//}
