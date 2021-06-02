//resource "google_service_account" "build_account" {
//  account_id   = "packer-builder"
//  display_name = "Cloudbuild Service Account"
//}

variable "cloud_build_account" {
  type = string
}

resource "google_project_iam_binding" "editor" {
  role = "roles/editor"
  members = [join(":", ["serviceAccount", var.cloud_build_account])]
}

//resource "google_project_iam_binding" "metadata" {
//  role = "roles/compute.instance.Metadata"
//  members = [join(":", ["serviceAccount", var.cloud_build_account])]
//}

//resource "google_project_iam_binding" "source_permission" {
//  role = "roles/source.writer"
//  members = ["user:syntapy@gmail.com"]
//}
