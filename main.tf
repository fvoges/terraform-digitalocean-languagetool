variable "autosign_token" {}

resource "digitalocean_project" "languagetool" {
  name        = "LanguageTool"
  description = "languagetool.org API service"
  purpose     = "Web Application"
  environment = "Production"
}


module "languagetool" {
  source  = "fvoges/ubuntu/digitalocean"
  version = "0.20.1"

  application    = "languagetool"
  autosign_token = "${var.autosign_token}"
  dns_ttl        = 30
  domain         = "voges.uk"
  hostname       = "languagetool"
  manage_project = "true"
  project_name   = "LanguageTool"
  puppet_server  = "pe.shadowsun.com.ar"
  size           = "server"
  tags           = [ "http", "https" ]
}
