resource "google_service_account" "infra_cicd" {
  account_id   = "infra-cicd"
  display_name = "Infra CICD"
  project      = var.project_id
}

resource "google_project_iam_member" "infra_cicd" {
  count   = length(var.service_account_iam_roles)
  project = var.project_id
  role    = element(var.service_account_iam_roles, count.index)
  member  = "serviceAccount:${google_service_account.infra_cicd.email}"
}

output "sa_infra_cicd" {
  value = google_service_account.infra_cicd
}