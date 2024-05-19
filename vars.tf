variable "repo_visibility" {
  description = "Visibility of the GitHub Repo"
  type        = string
  default     = "private"

  validation {
    condition     = can(regex("^(private|public)$", var.repo_visibility))
    error_message = "repo_visibility must be 'private' or 'public'"
  }
}

variable "base_domain" {
  description = "Cloudflare DNS Zone"
  type        = string
  default     = "cdiaz.cloud"
}

variable "github_username" {
  description = "GitHub Username"
  type        = string
}

variable "github_token" {
  description = "GitHub Token"
  type        = string
  sensitive   = true
}
