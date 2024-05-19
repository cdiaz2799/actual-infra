locals {
  volume_name = "actual-data"
}

resource "google_service_account" "main" {
  account_id = "sa-actual-budget-cloudrun"
  project    = module.actual_project.project_id
}


resource "google_cloud_run_v2_service" "actual" {
  provider = google-beta

  name         = "actual-budget"
  location     = local.default_region
  project      = module.actual_project.project_id
  launch_stage = "BETA"
  ingress      = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      min_instance_count = 0
      max_instance_count = 1
    }
    service_account = google_service_account.main.email
    volumes {
      name = local.volume_name
      gcs {
        bucket    = google_storage_bucket.main.name
        read_only = false
      }
    }
    containers {
      name  = "actual"
      image = "docker.io/actualbudget/actual-server:latest-alpine"
      ports {
        container_port = 5006
      }
      volume_mounts {
        name       = local.volume_name
        mount_path = "/data"
      }
    }
  }
  depends_on = [google_storage_bucket.main, google_storage_bucket_iam_member.actual]
}
