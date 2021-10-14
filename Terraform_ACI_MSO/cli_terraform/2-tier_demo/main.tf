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

resource "aci_bridge_domain" "internal_tf" {
  tenant_dn          = aci_tenant.tenant_tf.id
  name               = var.bd1_tf
  relation_fv_rs_ctx = aci_vrf.vrf_tf.id
}

resource "aci_bridge_domain" "external_tf" {
  tenant_dn          = aci_tenant.tenant_tf.id
  name               = var.bd2_tf
  relation_fv_rs_ctx = aci_vrf.vrf_tf.id
}

resource "aci_subnet" "internal_tf_subnet" {
  parent_dn        = aci_bridge_domain.internal_tf.id
  ip               = var.bd_subnet1_tf
}

resource "aci_subnet" "external_tf_subnet" {
  parent_dn        = aci_bridge_domain.external_tf.id
  ip               = var.bd_subnet2_tf
}

resource "aci_application_profile" "anp_tf" {
  tenant_dn = aci_tenant.tenant_tf.id
  name      = var.anp_tf
}

data "aci_vmm_domain" vmm_domain_tf {
  provider_profile_dn = "/uni/vmmp-VMware"
# provider_profile_dn = "/comp/prov-VMware"
  name                = var.vmm_domain
}

resource "aci_epg_to_domain" "vmm_domain_int1_tf" {
  application_epg_dn    = aci_application_epg.internal_tf.id
  tdn                   = data.aci_vmm_domain.vmm_domain_tf.id
  instr_imedcy          = "lazy"
  res_imedcy            = "pre-provision"
# lag_policy_name        = "dm_eLAG"
# lag_policy_name        = var.vmm_elag_policy 
}

resource "aci_epg_to_domain" "vmm_domain_ext1_tf" {
  application_epg_dn    = aci_application_epg.external_tf.id
  tdn                   = data.aci_vmm_domain.vmm_domain_tf.id
  instr_imedcy          = "lazy"
  res_imedcy            = "pre-provision"
  lag_policy_name        = "dm_eLAG"
# lag_policy_name        = var.vmm_elag_policy 
}
resource "aci_application_epg" "internal_tf" {
  application_profile_dn = aci_application_profile.anp_tf.id
  name                   = var.epg1_tf
  relation_fv_rs_bd      = aci_bridge_domain.internal_tf.id
}

resource "aci_application_epg" "external_tf" {
  application_profile_dn = aci_application_profile.anp_tf.id
  name                   = var.epg2_tf
  relation_fv_rs_bd      = aci_bridge_domain.external_tf.id
}

resource "aci_epg_to_contract" "internal_provide_contract" {
  application_epg_dn = aci_application_epg.internal_tf.id
  contract_dn        = aci_contract.contract_internal_tf_external_tf.id
  contract_type      = "provider"
}

resource "aci_epg_to_contract" "external_provide_contract" {
  application_epg_dn = aci_application_epg.external_tf.id
  contract_dn        = aci_contract.contract_internal_tf_external_tf.id
  contract_type      = "consumer"
}


resource "aci_contract" "contract_internal_tf_external_tf" {
  tenant_dn = aci_tenant.tenant_tf.id
  name      = "contract_Web"
}
