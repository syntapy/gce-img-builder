resource "google_project_iam_binding" "editor" {
  role = "roles/editor"
  members = ["serviceAccount:99124858490@cloudbuild.gserviceaccount.com"]
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

//resource "google_project_service" "compute" {
//  service = "compute.googleapis.com"
//}

//output "sourcerepo_service" {
//  value = google_project_service.sourcerepo
//}
