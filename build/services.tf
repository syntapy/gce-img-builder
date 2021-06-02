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

resource "google_project_service" "artifacts" {
  service = "artifactregistry.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "sourcerepo" {
  service = "sourcerepo.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloudapis" {
  service = "cloudapis.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "servicemanagement" {
  service = "servicemanagement.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "storage-api" {
  service = "storage-api.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "secretmanager" {
  service = "secretmanager.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

output "sourcerepo_service" {
  value = google_project_service.sourcerepo
}
