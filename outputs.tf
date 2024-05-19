output "github_repo" {
  value = github_repository.actual.html_url
}

output "domain_mapping_status" {
  value = google_cloud_run_domain_mapping.main.status[0].conditions[0].message
}
