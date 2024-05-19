locals {
  repo_name        = "actual-infra"
  repo_description = "Actual Budget Infrastructure Resources"
  repo_topics      = ["terraform", "actualbudget", "iac"]
  repo_visibility  = "public"
}

resource "gitlab_project_mirror" "actual" {
  project = gitlab_project.main.id
  url     = "https://${var.github_username}:${var.github_token}@github.com/${github_repository.actual.full_name}.git"

}

resource "gitlab_project" "main" {
  name        = local.repo_name
  description = local.repo_description
  topics      = local.repo_topics

  visibility_level = local.repo_visibility

  initialize_with_readme = false

  environments_access_level = "private"
  pages_access_level        = "disabled"

  issues_enabled         = false
  lfs_enabled            = false
  merge_requests_enabled = true
  packages_enabled       = false
  public_jobs            = true
  snippets_enabled       = false
  wiki_enabled           = false

  releases_access_level   = "enabled"
  repository_access_level = "enabled"

}

resource "github_repository" "actual" {
  name        = local.repo_name
  description = local.repo_description
  topics      = local.repo_topics
  visibility  = local.repo_visibility

  # Features
  has_issues      = false
  has_discussions = false
  has_projects    = false
  has_downloads   = false
  has_wiki        = false

  # security_and_analysis {
  #   secret_scanning {
  #     status = "enabled"
  #   }
  #   secret_scanning_push_protection {
  #     status = "enabled"
  #   }
  # }
  vulnerability_alerts = true
}
