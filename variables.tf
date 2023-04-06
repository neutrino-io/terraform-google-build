variable "org_id" {
  description = "Organisation name"
}

variable "project_id" {
  description = "GCP project ID"
  default = "blacksmith-ops"
}

variable "region" {
  description = "GCP project region"
}

variable "zone_default" {
  description = "GCP project default zone"
}

variable "env" {
  description = "Project environment"
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

variable "branch_name" {
  description = "Bitbucket Branch name"
}