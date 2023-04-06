terraform {
  backend "remote" {
    organization = "Foundry360"
    hostname = "app.terraform.io"

    workspaces {
      prefix = "cicd-"
    }
  }

  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.13.0"
    }
  }
}

data "google_client_config" "current" {}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone_default
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  zone    = var.zone_default
}