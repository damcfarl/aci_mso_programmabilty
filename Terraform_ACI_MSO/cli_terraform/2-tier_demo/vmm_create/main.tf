
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

resource "aci_vmm_domain" "vmm_domain_tf" {
        provider_profile_dn = "uni/vmmp-VMware"
#        description         = var.vmm_domain
        name                = var.vmm_domain
        ep_inventory_type   = "on-link"
        ep_ret_time         = "0"
        hv_avail_monitor    = "no"
        mcast_addr          = "224.0.1.0"
        mode                = "default"
        name_alias          = "alias_dom"
        pref_encap_mode     = "unspecified"
    }
