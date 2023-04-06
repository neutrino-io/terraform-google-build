 resource "google_clouddeploy_delivery_pipeline" "deploy_pipeline_service" {
   location = var.region
   name     = "service"
   description = "Service Delivery Pipeline"
   project = "${var.org_id}-develop"

   serial_pipeline {
     stages {
       profiles  = ["prod"]
       target_id = "prod"
     }

     stages {
       profiles  = ["staging"]
       target_id = "staging"
     }

     stages {
       profiles  = ["develop"]
       target_id = "develop"
     }
   }
 }

 resource "google_clouddeploy_target" "target_prod" {
   location = var.region
   name     = "prod"
   description = "Production Environment"

   gke {
     cluster = "projects/${var.org_id}-prod/locations/${var.region}/clusters/${var.org_id}-cluster-core-prod"
   }

   project          = "${var.org_id}-prod"
   require_approval = false
 }

 resource "google_clouddeploy_target" "target_staging" {
   location = var.region
   name     = "staging"
   description = "Staging Environment"

   gke {
     cluster = "projects/${var.org_id}-prod/locations/${var.region}/clusters/${var.org_id}-cluster-core-staging"
   }

   project          = "${var.org_id}-staging"
   require_approval = false
 }

 resource "google_clouddeploy_target" "target_develop" {
   location = var.region
   name     = "develop"
   description = "Development Environment"

   gke {
     cluster = "projects/${var.org_id}-prod/locations/${var.region}/clusters/${var.org_id}-cluster-core-develop"
   }

   project          = "${var.org_id}-develop"
   require_approval = false
 }