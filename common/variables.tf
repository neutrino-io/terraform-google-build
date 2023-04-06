variable "org_id" {
  description = "Organisation name"
}

variable "project_id" {
  description = "GCP project ID"
}

variable "env" {
  description = "Project environment"
}

variable "region" {
  description = "GCP project region"
}

variable "service_account_iam_roles" {
  type = list(string)
  default = [
    "roles/cloudbuild.serviceAgent",
    "roles/storage.objectAdmin",
    "roles/clouddeploy.developer",
    "roles/container.developer",
    "roles/containerregistry.ServiceAgent",
    "roles/gkehub.serviceAgent"
  ]
  description = "List of IAM roles to assign to the service account."
}