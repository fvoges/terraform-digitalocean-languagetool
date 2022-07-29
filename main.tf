variable "autosign_token" {}
variable "region" {
  type = string
  description = "droplet region"
  default = "lon1"
}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.0, < 3.0"
    }
  }
}

# resource "digitalocean_project" "languagetool" {
#   name        = "LanguageTool"
#   description = "languagetool.org API service"
#   purpose     = "Web Application"
#   environment = "Production"
# }

data "digitalocean_vpc" "default" {
  name = format("default-%s", var.region)
}


module "languagetool" {
  source  = "fvoges/ubuntu/digitalocean"
  version = "1.0.0"

  puppet_application    = "languagetool"
  puppet_autosign_token = var.autosign_token
  puppet_server         = "pe.shadowsun.com.ar"
  dns_ttl               = 30
  domain                = "voges.uk"
  hostname              = "languagetool"
  manage_project        = true
  project_name          = digitalocean_project.languagetool.name
  tags                  = [ "http", "https" ]
  vpc_id                = data.digitalocean_vpc.default.id
}
