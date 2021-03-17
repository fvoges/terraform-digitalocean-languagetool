variable "autosign_token" {}

module "ubuntu" {
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
