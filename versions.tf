terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "< 6"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "< 6"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.2.1"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 17.0.0"
    }
  }
}
