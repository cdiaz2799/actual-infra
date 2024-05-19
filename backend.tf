terraform {
  backend "gcs" {
    bucket = "cd-tfstate-e791"
    prefix = "terraform/actual-infra"
  }
}

data "terraform_remote_state" "bootstrap" {
  backend = "gcs"

  config = {
    bucket = "cd-tfstate-e791"
    prefix = "terraform/gcp-infra/organization"
  }
}
