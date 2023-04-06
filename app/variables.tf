variable "org_id" {
  description = "Organisation name"
}

variable "project_id" {
  description = "GCP project ID"
}

variable "env" {
  description = "Project environment"
}

variable "common" {
  description = "Common module"
}

variable "auth0_domain" {
  description = "Auth0 domain"
}

variable "auth0_client_id" {
  description = "Auth0 client ID"
}

variable "k8s_token" {
  description = "k8S Token"
}

variable auth0_audience {
  description = "k8S Token"
}
