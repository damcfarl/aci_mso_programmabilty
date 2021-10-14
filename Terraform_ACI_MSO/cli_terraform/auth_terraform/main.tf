terraform {
  required_version = ">= 1.0.1"
}
 
terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=0.7.1"
    }
  }
}

provider "aci" {
  username = "dm_terraform"
# username = var.aci_username
# password = var.aci_password
  url      = var.aci_url
# insecure = true
# Cisco-ACI signature based cert
  private_key = "damcfarl_tf.key"
  cert_name = "damcfarl_tf.crt"
}


resource "aci_tenant" "tenant_tf" {
  name = "dm_terraform_cert"
# name = "${var.demo_tenant_tf}"
}

