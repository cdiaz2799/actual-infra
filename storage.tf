resource "random_id" "bucket_suffix" {
  byte_length = 2
}

resource "google_storage_bucket" "main" {
  name          = "actual-budget-${random_id.bucket_suffix.hex}"
  project       = module.actual_project.project_id
  location      = local.default_region
  storage_class = "STANDARD"

  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
  versioning {
    enabled = false
  }
}

resource "google_storage_bucket_iam_member" "actual" {
  bucket = google_storage_bucket.main.name
  member = "serviceAccount:${google_service_account.main.email}"
  role   = "roles/storage.admin"
}
