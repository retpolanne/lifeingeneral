data "cloudflare_accounts" "retpolanne" {
  name = "retpolanne"
}

data "cloudflare_zones" "retpolannedotcom" {
  filter {
    name = "retpolanne.com"
  }
}

resource "cloudflare_record" "lifeingeneral" {
  zone_id = data.cloudflare_zones.retpolannedotcom.id
  name    = "lifeingeneral"
  value   = "retpolanne.github.io."
  type    = "CNAME"
}

resource "github_repository" "lifeingeneralretpolannedotcom" {
  name        = "lifeingeneral"
  description = "My website"
  private      = false

  pages {
    cname = "lifeingeneral.retpolanne.com"
    build_type = "workflow"
  }
}
