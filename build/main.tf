variable "zone" {
  type = string
}

resource "google_sourcerepo_repository" "machine_image" {
  name = "machine-image"

  depends_on = [
    google_project_service.sourcerepo
  ]
}

resource "google_cloudbuild_trigger" "build_trigger" {
  name = "image-factory"
  trigger_template {
    repo_name = google_sourcerepo_repository.machine_image.name
    tag_name = ".*"
  }

  substitutions = {
    _IMAGE_FAMILY = "centos-8"
    _IMAGE_ZONE = var.zone
  }

  filename = "cloudbuild_bt.yaml"
}
