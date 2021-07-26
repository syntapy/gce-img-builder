output "packer_build_repo" {
  value = google_sourcerepo_repository.packer_builder.url
}

output "machine_image_repo" {
  value = google_sourcerepo_repository.machine_image.url
}
