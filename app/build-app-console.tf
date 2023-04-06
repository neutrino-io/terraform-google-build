resource "google_cloudbuild_trigger" "cloudbuild-trigger-app-console" {
  name = "${var.org_id}-app-console"
  description = "Application Console"
  service_account = var.common.sa_infra_cicd.id

  trigger_template {
    branch_name = "^dev$"
    project_id = var.project_id
    repo_name = ""
  }

  substitutions = {
    _ENV = var.env,
    _K8S_TOKEN = var.k8s_token
  }

  filename = "cloudbuild.yaml"
}