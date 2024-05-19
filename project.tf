locals {
  org_id         = data.terraform_remote_state.bootstrap.outputs.common_config.org_id
  biling_account = data.terraform_remote_state.bootstrap.outputs.common_config.billing_account
  default_region = data.terraform_remote_state.bootstrap.outputs.common_config.default_region
  prod_folder    = data.terraform_remote_state.bootstrap.outputs.prod_folder_id
}

module "actual_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 15.0"

  name              = "actual-budget"
  folder_id         = local.prod_folder
  random_project_id = true
  org_id            = local.org_id
  billing_account   = local.biling_account
  activate_apis     = ["run.googleapis.com"]
}
