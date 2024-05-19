output "gitlab_repo" {
  description = "URL to Access Gitlab Repo"
  value       = gitlab_project.main.web_url
}

output "github_repo" {
  description = "URL to Access GitHub Repo"
  value       = github_repository.actual.html_url
}
