locals {
  subdomain        = "budget"
  resource_records = google_cloud_run_domain_mapping.main.status[0].resource_records
}

resource "cloudflare_record" "main" {
  zone_id = data.cloudflare_zone.main.zone_id

  for_each = { for record in local.resource_records : record.name => record }

  name    = each.value.name
  type    = each.value.type
  value   = each.value.rrdata
  proxied = false
  comment = "Managed by Terraform"

  depends_on = [google_cloud_run_domain_mapping.main]
}


resource "google_cloud_run_domain_mapping" "main" {
  name     = "${local.subdomain}.cdiaz.cloud"
  location = google_cloud_run_v2_service.actual.location
  project  = google_cloud_run_v2_service.actual.project
  metadata {
    namespace = google_cloud_run_v2_service.actual.project
  }
  spec {
    route_name       = google_cloud_run_v2_service.actual.name
    certificate_mode = "AUTOMATIC"
  }
}

data "cloudflare_zone" "main" {
  name = var.base_domain
}
