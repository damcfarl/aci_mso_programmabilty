terraform {
  required_version = ">= 1.0.1"
}
 
terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
    }
  }
}

provider "aci" {
  username = var.aci_username
  password = var.aci_password
  url      = var.aci_url
#  insecure = true
}

resource "aci_tenant" "tenant_tf" {
  name = var.demo_tenant_tf
}

resource "aci_vrf" "vrf_tf" {
  tenant_dn = aci_tenant.tenant_tf.id
  name      = var.vrf_tf
}
