## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.2.1 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | ~> 17.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | < 6 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | < 6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.33.0 |
| <a name="provider_github"></a> [github](#provider\_github) | 6.2.1 |
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 17.0.0 |
| <a name="provider_google"></a> [google](#provider\_google) | 5.29.1 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 5.29.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_actual_project"></a> [actual\_project](#module\_actual\_project) | terraform-google-modules/project-factory/google | ~> 15.0 |

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.main](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [github_repository.actual](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [gitlab_project.main](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project) | resource |
| [gitlab_project_mirror.actual](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_mirror) | resource |
| [google-beta_google_cloud_run_v2_service.actual](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_cloud_run_v2_service) | resource |
| [google_cloud_run_domain_mapping.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_domain_mapping) | resource |
| [google_service_account.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.actual](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [random_id.bucket_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [cloudflare_zone.main](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |
| [terraform_remote_state.bootstrap](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_domain"></a> [base\_domain](#input\_base\_domain) | Cloudflare DNS Zone | `string` | `"cdiaz.cloud"` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | GitHub Token | `string` | n/a | yes |
| <a name="input_github_username"></a> [github\_username](#input\_github\_username) | GitHub Username | `string` | n/a | yes |
| <a name="input_repo_visibility"></a> [repo\_visibility](#input\_repo\_visibility) | Visibility of the GitHub Repo | `string` | `"private"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_repo"></a> [github\_repo](#output\_github\_repo) | URL to Access GitHub Repo |
| <a name="output_gitlab_repo"></a> [gitlab\_repo](#output\_gitlab\_repo) | URL to Access Gitlab Repo |
