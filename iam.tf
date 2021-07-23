resource "google_project_iam_binding" "instance_admin_cb" {
  role    = "roles/compute.instanceAdmin.v1"
  members = [local.cloud_build_member]
}

resource "google_project_iam_binding" "account_user_cb" {
  role    = "roles/iam.serviceAccountUser"
  members = [local.cloud_build_member]
}

resource "google_project_iam_binding" "tunnel_accessor_cb" {
  role    = "roles/iap.tunnelResourceAccessor"
  members = [local.cloud_build_member]
}
