resource "google_sourcerepo_repository" "machine_image" {
  name = "machine-image"
  depends_on = [ var.sourcerepo_service ]
}

resource "google_sourcerepo_repository" "packer_builder" {
  name = "packer-builder"
  depends_on = [ var.sourcerepo_service ]
}

resource "google_cloudbuild_trigger" "packer_build" {
  name = "packer"
  trigger_template {
    repo_name   = google_sourcerepo_repository.packer_builder.name
    branch_name = "main"
  }

  filename = "cloudbuild.yaml"
  depends_on = [ var.cloudbuild_service ]
}

resource "google_storage_bucket" "machine_images" {
  name = "machine-images-7825343"
  depends_on = [ var.sourcerepo_service ]
}

resource "google_cloudbuild_trigger" "machine_image_build" {
  name = "machine-image"
  trigger_template {
    repo_name   = google_sourcerepo_repository.machine_image.name
    branch_name = "main"
  }

  filename = "cloudbuild.yaml"
  depends_on = [ var.cloudbuild_service ]
}
