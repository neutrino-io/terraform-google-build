module "common" {
  source     = "./common"
  env        = var.env
  project_id = var.project_id
  region = var.region
  org_id    = var.org_id
}

module "app" {
  source     = "./app"
  env        = var.env
  project_id = var.project_id
  common     = module.common
  auth0_domain        = var.auth0_domain
  auth0_client_id     = var.auth0_client_id
  k8s_token           = var.k8s_token
  auth0_audience      = var.auth0_audience
  org_id    = var.org_id

  depends_on = [
    module.common
  ]
}

module "service" {
  source     = "./service"
  env        = var.env
  project_id = var.project_id
  k8s_token  = var.k8s_token
  branch_name = var.branch_name
  common     = module.common
  org_id    = var.org_id

  depends_on = [
    module.common
  ]
}

module "migration" {
  source     = "./migration"
  env        = var.env
  project_id = var.project_id

  depends_on = [
    module.common
  ]
}