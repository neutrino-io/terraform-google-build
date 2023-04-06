resource "google_cloudbuild_trigger" "cloudbuild-trigger-service-identity" {
  name = "${var.org_id}-service-identity"
  description = "Service Identity"
  service_account = var.common.sa_infra_cicd.id

  trigger_template {
    branch_name = "^${var.branch_name}$"
    project_id = var.project_id
    repo_name = ""
  }

  substitutions = {
    _GKE_CLUSTER = "${var.org_id}-cluster-core-${var.env}"
    _GKE_LOCATION = "asia-southeast1"
    _IMAGE_NAME = "gcr.io/${var.org_id}-${var.env}/${var.org_id}-service-identity"
    _K8S_YAML_PATH = "src/deploy/cloudbuild"
    _DOCKERFILE_PATH = "./src/Dockerfile"
    _ENV = var.env
    _K8S_TOKEN = var.k8s_token
  }

  filename = "src/cloudbuild.yaml"
}