resource "github_repository" "actual" {
  name        = "actual-infra"
  description = "Actual Budget Infrastructure Resources"
  topics      = ["terraform", "actualbudget", "iac"]
  visibility  = "private"

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

# Enable Dependabot
resource "github_repository_dependabot_security_updates" "actual" {
  repository = github_repository.actual.id
  enabled    = true
}
