variable "zone" {
  type = string
}

resource "google_sourcerepo_repository" "machine_image" {
  name = "machine-image"

  depends_on = [
    google_project_service.sourcerepo
  ]
}

resource "google_sourcerepo_repository" "packer" {
  name = "packer"

  depends_on = [
    google_project_service.sourcerepo
  ]
}

resource "google_cloudbuild_trigger" "packer_build" {
  name = "packer"
  trigger_template {
    repo_name = google_sourcerepo_repository.packer.name
    branch_name = "main"
  }

  filename = "cloudbuild.yaml"
}

resource "google_storage_bucket" "machine_images" {
  name = "machine-images-7825343"
}

resource "google_cloudbuild_trigger" "machine_image_build" {
  name = "machine-image"
  trigger_template {
    repo_name = google_sourcerepo_repository.machine_image.name
    branch_name = "main"
  }

  filename = "cloudbuild.yaml"
}
