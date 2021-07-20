resource "google_project_iam_binding" "editor" {
  role    = "roles/editor"
  members = [local.service_account_member]
}

resource "google_project_iam_binding" "instance_admin" {
  role    = "roles/compute.instanceAdmin.v1"
  members = [local.service_account_member]
}
